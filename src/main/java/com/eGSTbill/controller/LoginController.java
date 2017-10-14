package com.eGSTbill.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eGSTbill.model.Client;
import com.eGSTbill.model.ClientProduct;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Purchaser;
import com.eGSTbill.model.User;
import com.eGSTbill.service.ClientProductService;
import com.eGSTbill.service.ClientService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.service.UserService;
import com.eGSTbill.util.CommonUtils;
import com.eGSTbill.util.Sms;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class LoginController {

	@RequestMapping(value = "/loginHome")
	public String loginHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From loginHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			objSession.setAttribute("LOGINROLE", null);
			objSession.setAttribute("CLIENTID", null);
			objSession.setAttribute("USER", null);
			objSession.setAttribute("PURCHASERID", null);
			
		} catch (Exception e) {
			//System.out.println("Exception in LoginController in loginHome()");
			e.printStackTrace();
		} finally {

		}
		return "loginHome";
	}
	
	@RequestMapping(value = "/login")
	public @ResponseBody String login(@RequestParam("userMobile") String userMobile,
			@RequestParam("userPassword") String userPassword, HttpSession objSession, HttpServletRequest objRequest) {
		String sJson = null;
		User user = null;
		String sPwd = null;
		//System.out.println("in to login controler userMobile==" + userMobile);
		//System.out.println("in to login controler userPassword==" + userPassword);
		JSONObject json = new JSONObject();

		try {

			if (StringUtils.isNotEmpty(userMobile)) {
				UserService userService = new UserService();
				user = userService.getUserByMobile(userMobile);

				if (user != null) {
					sPwd = user.getPassword();
					if (userPassword.equals(sPwd)) {
						//System.out.println("a. in to login controller===" + user.getMobile());
						//System.out.println("b. in to login controller===" + user.getPassword());

						String sUsrRole = user.getRole();
						objSession.setAttribute("LOGINROLE", sUsrRole);

						ClientService cs = new ClientService();
						String sUserId = user.getUserId();
						Client client = cs.getClientByUserId(sUserId);
						ObjectMapper objectMapper=new ObjectMapper();
						String sClient=objectMapper.writeValueAsString(client);
						objSession.setAttribute("CLIENTINFO", sClient);
						
						String sClientId = client.getClientId();
						objSession.setAttribute("CLIENTID", sClientId);

						user.setClientId(sClientId);
						user.setClient(client);
						objSession.setAttribute("USER", user);

						json.put("status", "success");

					} else {
						json.put("status", "ERROR");
						json.put("message", "Invalid Password");
					}
				} else {
					json.put("status", "ERROR");
					json.put("message", "Invalid Mobile Number");
				}

			}
			sJson = json.toString();
			//System.out.println("sJson==" + sJson);
		} catch (Exception e) {
			//System.out.println("Exception in LoginController in login()");
			e.printStackTrace();
		}
		return sJson;
	}

	@RequestMapping(value = "/forgotPassword")
	public  @ResponseBody String forgotPassword(@Context HttpServletRequest request, @QueryParam("userMobile") String userMobile)
			throws IOException {
		//System.out.println("in to forgot password");
		JSONObject jObj = new JSONObject();
		String sJson = null;
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
			//System.out.println("in to forgotPassword sPropertyContent==="+sPropertyContent);
			sMessage = sPwd + " " + sPropertyContent;
			/*System.out.println("in to forgot password sMessage==="+sMessage);
			System.out.println("in to forgotPassword userMobile==="+userMobile);
			System.out.println("in to forgotPassword request==="+request);*/

			bSentSms = sms.sendMessage(request, userMobile, sMessage);
			
			if (bSentSms == true) {
				jObj.put("Msg", "success");
				jObj.put("message", "Password sent to your Mobile. Please Re Login.");
			} else {
				jObj.put("Msg", "Error while sending SMS");
			}
		} else {
			jObj.put("Msg", "Mobile Number Not Found.");
		}
		
		sJson = jObj.toString();

		//return String.valueOf(jObj);
		return sJson;
	}
	@RequestMapping(value = "/resetPassword")
	public @ResponseBody String resetPassword(@Context HttpServletRequest request, @QueryParam("userMobile") String userMobile)
			throws IOException {
		//System.out.println("in to reset password");
		JSONObject jObj = new JSONObject();
		String sJson = null;
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
			//System.out.println("in to reset password==="+sPin);

			//memDto.setPassword(sPin);
			String sPwdUpdate = userService.passwordUpdate(user);
			//String sPwdUpdate = memberBO.passwordUpdate(memDto);

			if (sPwdUpdate.equals("success")) {
				sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsUpdatePwd");
				sMessage = sPin + " " + sPropertyContent;

				bSentSms = sms.sendMessage(request, userMobile, sMessage);
				if (bSentSms) {
					jObj.put("Msg", "success");
					jObj.put("message", "OTP sent to your Mobile. Please Re Login.");
				} else {
					jObj.put("Msg", "Error while sending SMS");
				}
			} else {
				jObj.put("Msg", "Error while Reset Password");
			}
		} else {
			jObj.put("Msg", "Mobile Number Not Found.");
		}
		sJson = jObj.toString();

		return sJson;
	}

}
