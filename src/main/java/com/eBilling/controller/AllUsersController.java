package com.eBilling.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.dao.RegisterDao;
import com.eBilling.model.Register;
import com.eBilling.model.SendSms;
import com.eBilling.service.RegistrationService;
import com.eBilling.util.CommonUtils;
import com.eBilling.util.EmailUtil;
import com.eBilling.util.Sms;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
public class AllUsersController {

	/*
	 * @Autowired sendSms objSendSms;
	 */
	@Autowired
	RegisterDao registerDao;
	@Autowired
	RegistrationService objRegistrationService;
	@Autowired
	ServletContext objContext;

	@RequestMapping(value = "/allUsers")
	public String allUsers(@ModelAttribute Register register, HttpServletResponse objResponce, HttpSession objSession,
			HttpServletRequest objRequest) {

		// System.out.println("From Prodcut Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			sJson = objRegistrationService.getAllRegister();
			objRequest.setAttribute("allregInfo", sJson);
			objSession.setAttribute("tabActive", "allUser");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return "allUsers";
	}
	@RequestMapping(value = "/saveRegisters")
	public @ResponseBody String saveRegisters(@ModelAttribute Register register, HttpSession objSession,
			HttpServletRequest objRequest) {
		boolean isInsert = false;
		String sJson = "";
		InputStream input = null;
		SendSms Objsmsbean = null;
		String sOtp = null;
		List<Register> lstRegister = null;
		try {
			
			String sEmail = register.getEmail();
			String sMobileNo= register.getMobileNo();
			lstRegister = objRegistrationService.checkEmailAndMobileNo(sEmail,sMobileNo);
			
			Properties prop = new Properties();
			String propertiespath = objContext.getRealPath("Resources" + File.separator + "DataBase.properties");
			input = new FileInputStream(propertiespath);
			// load a properties file
			prop.load(input);
			String sendMail = prop.getProperty("sendMail");
			String sendSms = prop.getProperty("sendSms");

			// System.out.println("sendMail==" + sendMail);
			sOtp = CommonUtils.generatePIN();
			System.out.println("lstRegister:::::::::::"+lstRegister.size());
			if(lstRegister.size() == 0){
			register.setPassword(sOtp);
			register.setRegId(CommonUtils.getAutoGenId());
			register.setEmailCode(sOtp);
			
			isInsert = objRegistrationService.saveRegister(register);
			System.out.println("isInsert===="+isInsert);
			
			if(isInsert){
			if (sendSms.equals("yes")) {
				String sOtpMsg = prop.getProperty("smsOtpText");
				// System.out.println("smsOtpText = " + smsOtpText);
				  
				  System.out.println("sOtpMsg=="+sOtpMsg);
				  if(sOtpMsg != null && sOtpMsg.length() > 0){
				   sOtpMsg = sOtpMsg.replace("OTP_TXT",sOtp);
				  }
				  System.out.println("sOtpMsg=="+sOtpMsg);

				Objsmsbean = new SendSms();
				Objsmsbean.setSendTo("91" + register.getMobileNo());
				Objsmsbean.setMessage(sOtpMsg);
				// System.out.println("before sendSms");
				Sms.sendMessage(objContext, Objsmsbean);
				// System.out.println("after sendSms");
			}
			// System.out.println("sendmail===" + sendMail);
			if (sendMail.equals("yes")) {
				EmailUtil.sendEmail(register, objContext);
			}

			}
			if (isInsert) {
				sJson = objRegistrationService.getAllRegister();
				// System.out.println("save: " + sJson);
			}
			}
		} catch (Exception e) {
			 System.out.println("Exception in RegistraionController in  saveRegister()");
		}

		return sJson;
	}

	@RequestMapping(value = "/updateRegisters")
	public @ResponseBody String updateRegisters(@ModelAttribute Register register,
			@RequestParam("jsondata") JSONObject data, HttpSession objSession, HttpServletRequest objRequest) {
		boolean isupdate = false;
		String sJson = "";
		try {
			register.setRegId(data.getString("regId"));
			register.setEmail(data.getString("email"));
			register.setMobileNo(data.getString("mobileNo"));
			register.setRegType(data.getString("regType"));
			register.setRegName(data.getString("regName"));
			//register.setPassword(data.getString("password"));
			// System.out.println("isupdateisupdateisupdateisupdate");
			isupdate = objRegistrationService.updateRegister(register);
			// System.out.println("isupdate" + isupdate);
			if (isupdate)
				sJson = objRegistrationService.getAllRegister();
			// System.out.println("update: " + sJson);
		} catch (Exception ex) {
			System.out.println("Exception in RegistraionController in  updatePurchaseInfo()");
			ex.printStackTrace();
		}
		return sJson;
	}

	@RequestMapping(value = "/deleteRegisters")
	public @ResponseBody String deleteRegisters(@RequestParam("id") String id, HttpSession objSession,
			HttpServletRequest objRequest) throws JsonGenerationException, JsonMappingException, IOException {
		boolean isDelete = false;
		String sJson = "";
		isDelete = objRegistrationService.deleteRegister(id);
		// System.out.println("1111111111" + isDelete);
		if (isDelete) {
			sJson = objRegistrationService.getAllRegister();
			// System.out.println("Delete" + sJson);
		}
		return sJson;
	}


	
}