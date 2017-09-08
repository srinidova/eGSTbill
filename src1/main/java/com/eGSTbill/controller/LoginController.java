package com.eGSTbill.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import org.apache.commons.lang.StringUtils;
import org.bouncycastle.asn1.ocsp.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eGSTbill.model.Product;
import com.eGSTbill.model.User;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.service.SmsService;
import com.eGSTbill.service.UserService;
import com.eGSTbill.util.CommonUtils;
import com.eGSTbill.util.Sms;
import com.itextpdf.text.pdf.codec.Base64.InputStream;

import org.json.JSONObject;

@Controller
public class LoginController {

	@RequestMapping(value = "/loginHome")
	public String loginHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From loginHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {

		} catch (Exception e) {
			System.out.println("Exception in LoginController in loginHome()");
			e.printStackTrace();
		} finally {

		}
		return "loginHome";
	}
	
	@RequestMapping(value = "/login")
	public @ResponseBody String login(@RequestParam("userMobile") String userMobile,@RequestParam("userPassword") String userPassword, HttpSession objSession,
			HttpServletRequest objRequest) {
		String result ="fail";
		String sRole = null;
		String sPwd = null;
		String sLoginId = null;
		User users = null;
		HttpSession session = null;
		try{
			//System.out.println("in to login controller==="+users.getMobile());
			//System.out.println("in to login controller==="+users.getPassword());
			if (StringUtils.isNotEmpty(userMobile)) {
				UserService userService = new UserService();
				users = userService.getUserByMobile(userMobile);

				if (users != null) {
					sPwd = users.getPassword();
					//sRole = memDto.getMemberType();
					//sLoginId = memDto.getMemberId();
					
					if (userPassword.equals(sPwd)) {
						result = "success";
						System.out.println("in to login controller==="+users.getMobile());
						System.out.println("in to login controller==="+users.getPassword());
					} else {
						result = "Invalid Password";
						System.out.println("in to result==="+result);
					}
				} else {
					result = "Invalid Mobile Number";
					System.out.println("in to result invalid mobile"+result);
				}

			}
		}catch(Exception e){
			System.out.println("Exception in LoginController in login()");
			e.printStackTrace();		}
		return result;
	}
	/*@RequestMapping(value = "/forgotPassword")
	public @ResponseBody String forgotPassword(@RequestParam("userMobile") String userMobile, HttpSession objSession,ServletContext objContext,
			HttpServletRequest objRequest) {
		System.out.println("in to forgot password");
		String result = "fail";
		User user = null;
		String sRole = null;
		String sPwd = null;
		String sMessage = null;
		String sPropertyContent = null;
		boolean bSentSms = false;
		//String sPropertyContent = null;
		Properties prop = null;
		FileInputStream input = null;
		String propertiespath = null;
		try{
			 user = new User();
			JSONObject jObj = new JSONObject();
			UserService userService = new UserService();
			user = userService.getUserByMobile(userMobile);
			if (user != null ) {
				sPwd = user.getPassword();
				//sPropertyContent1 = CommonUtils.getPropertyContent(request.g, "smsPwdText")
				propertiespath = objContext.getRealPath("Resources" + File.separator + "USGFA.properties");
				prop = new Properties();
				input = new FileInputStream(propertiespath);
				prop.load(input);
				sMessage = prop.getProperty("smsPwdText");
				System.out.println("property List"+sPropertyContent);
				//sPropertyContent = CommonUtils.getPropertyContent(objRequest.getServletContext(), "smsPwdText");
				//sMessage = sPwd + " " + sPropertyContent;
				SmsService smsService =new SmsService();
				SmsService.sendMessage(objContext, user,sMessage);
				if (bSentSms) {
					jObj.put("Msg", "success");
				} else {
					jObj.put("Msg", "Error while sending SMS");
				}
			} else {
				jObj.put("Msg", "Mobile Number Not Found.");
			}
			return result;
		
		}catch(Exception e){
			
		}
		return sPropertyContent;
		
	
	}*/
	@RequestMapping(value = "/forgotPassword")
	public  @ResponseBody JSONObject forgotPassword(@Context HttpServletRequest request, @QueryParam("userMobile") String userMobile)
			throws IOException {
		System.out.println("in to forgot password");
		JSONObject jObj = new JSONObject();
		User user = null;
		//String sRole = null;
		String sPwd = null;
		String sMessage = null;
		String sPropertyContent = null;
		boolean bSentSms = false;
		Sms sms = new Sms();

		/*MemberBO memberBO = new MemberBO();
		memDto = memberBO.getMemberByMobile(loginMobile);*/
		UserService userService = new UserService();
		user = userService.getUserByMobile(userMobile);
		/*if (user != null) {
			sRole = user.getPassword();
		}*/
		if (user != null ) {
			sPwd = user.getPassword();
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsPwdText");
			System.out.println("in to forgotPassword sPropertyContent==="+sPropertyContent);
			sMessage = sPwd + " " + sPropertyContent;
			System.out.println("in to forgot password sMessage==="+sMessage);
			System.out.println("in to forgotPassword userMobile==="+userMobile);
			System.out.println("in to forgotPassword request==="+request);

			bSentSms = sms.sendMessage(request, userMobile, sMessage);
			if (bSentSms) {
				jObj.put("Msg", "success");
			} else {
				jObj.put("Msg", "Error while sending SMS");
			}
		} else {
			jObj.put("Msg", "Mobile Number Not Found.");
		}

		return jObj;
	}
	@RequestMapping(value = "/resetPassword")
	public @ResponseBody JSONObject resetPassword(@Context HttpServletRequest request, @QueryParam("userMobile") String userMobile)
			throws IOException {
		System.out.println("in to reset password");
		JSONObject jObj = new JSONObject();
		User user = null;
		String sRole = null;
		String sPin = null;
		String sMessage = null;
		String sPropertyContent = null;
		boolean bSentSms = false;
		Sms sms = new Sms();

		UserService userService = new UserService();
		user = userService.getUserByMobile(userMobile);
		/*if (memDto != null) {
			sRole = memDto.getMemberType();
		}*/

		if (user != null ) {
			sPin = CommonUtils.getPin();
			user.setPassword(sPin);
			System.out.println("in to reset password==="+sPin);

			//memDto.setPassword(sPin);
			String sPwdUpdate = userService.passwordUpdate(user);
			//String sPwdUpdate = memberBO.passwordUpdate(memDto);

			if (sPwdUpdate.equals("success")) {
				sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsUpdatePwd");
				sMessage = sPin + " " + sPropertyContent;

				bSentSms = sms.sendMessage(request, userMobile, sMessage);
				if (bSentSms) {
					jObj.put("Msg", "success");
				} else {
					jObj.put("Msg", "Error while sending SMS");
				}
			} else {
				jObj.put("Msg", "Error while Reset Password");
			}
		} else {
			jObj.put("Msg", "Mobile Number Not Found.");
		}

		return jObj;
	}
}
