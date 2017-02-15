package com.eBilling.controller;

import java.io.InputStream;
import java.util.List;

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
import com.eBilling.service.SmsService;

@Controller
public class SendSmsController {

	/*
	 * @Autowired sendSms objSendSms;
	 */
	@Autowired
	RegisterDao registerDao;
	@Autowired
	RegistrationService objRegistrationService;
	@Autowired
	ServletContext objContext;
	@Autowired
	SmsService  smsservice;

	@RequestMapping(value = "/sendSmsHome")
	public String sendSmsHome(@ModelAttribute Register register, HttpServletResponse objResponce, HttpSession objSession,
			HttpServletRequest objRequest) {

		 System.out.println("From sendSmsHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			objSession.setAttribute("tabActive", "sendSms");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return "sendSmsHome";
	}

	@RequestMapping(value = "/sendSms")
	public @ResponseBody String sendSms(@ModelAttribute SendSms sendSms,@RequestParam("jsondata") JSONObject data, HttpSession objSession,
			HttpServletRequest objRequest) {
		boolean isInsert = false;
		String sJson = "";
		InputStream input = null;
		SendSms Objsmsbean = null;
		String sOtp = null;
		try {
			String sMessage=data.getString("message");
			System.out.println("sMessage"+sMessage);
			isInsert=smsservice.smsToPurchase(sMessage);
			System.out.println("sJson"+isInsert);
			if(isInsert){
				//JSONObject json=new JSONObject();
				data.put("status", "ERRORMASSAGE");
				data.put("message", "Send Sucessfully");
				sJson = data.toString();
				return sJson;
			}
		} catch (Exception e) {
			 System.out.println("Exception in SendSmsController in  saveRegister()");
		}

		return sJson;
	}

	
}