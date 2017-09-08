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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eGSTbill.model.Client;
import com.eGSTbill.model.Purchaser;
import com.eGSTbill.model.User;
import com.eGSTbill.service.ClientService;
import com.eGSTbill.service.UserService;
import com.eGSTbill.util.CommonUtils;
import com.eGSTbill.util.Sms;

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
	public @ResponseBody String login(@RequestParam("userMobile") String userMobile,@RequestParam("userPassword") String userPassword, HttpSession objSession,
			HttpServletRequest objRequest) {
		String result ="fail";
		String sRole = null;
		String sPwd = null;
		String sLoginId = null;
		User user = null;
		Purchaser purchaser = null;
		HttpSession session = null;
		//System.out.println("in to login controler");
		try{
			//System.out.println("in to login controller==="+users.getMobile());
			//System.out.println("in to login controller==="+users.getPassword());
			if (StringUtils.isNotEmpty(userMobile)) {
				UserService userService = new UserService();
				user = userService.getUserByMobile(userMobile);

				if (user != null) {
					sPwd = user.getPassword();
					//sRole = memDto.getMemberType();
					//sLoginId = memDto.getMemberId();
					
					if (userPassword.equals(sPwd)) {
						//System.out.println("a. in to login controller==="+user.getMobile());
						//System.out.println("b. in to login controller==="+user.getPassword());
						
						String sUsrRole = user.getRole();
						//System.out.println("c. in to login sUsrRole==="+sUsrRole);
						objSession.setAttribute("LOGINROLE", sUsrRole);
						
						ClientService cs = new ClientService();
						String sUserId = user.getUserId();
						//System.out.println("d. in to login sUserId==="+sUserId);
						
					
						/*String sPurchaserId = purchaser.getPurchaserId();
						ShippingService ss = new ShippingService();
						String shipping = ss.getShippingsBypurchaserId(sPurchaserId);
						
						objSession.setAttribute("PURCHASERIDS", sPurchaserId);*/
						
						Client client = cs.getClientByUserId(sUserId);
						if(client != null){
							
						
						//System.out.println("e. in to login client==="+client.toString());
						String sClientId = client.getClientId();
						//System.out.println("f. in to login sClientId==="+sClientId);
						objSession.setAttribute("CLIENTID", sClientId);
						
						user.setClientId(sClientId);
						user.setClient(client);
						//System.out.println("in to login controler"+user.getClient());
						objSession.setAttribute("USER", user);
						
						//System.out.println("in to login user"+user);
						
						//PurchaserService ps = new PurchaserService();
						 /* String sPurchaserId = purchaser.getPurchaserId();
						 * 						Purchaser purchaser = ps.*/
						//Purchaser purchaser = ps.listPurchasersByClientId(sClientId)
						/*Purchaser purchaser = new Purchaser();
						String sPurchaserId = purchaser.getPurchaserId();*/
						
						//objSession.setAttribute("PURCHASERID", sPurchaserId);
						
						/*PurchaserService ps = new PurchaserService();
						String sPurchaserId = purchaser.
						Purchaser purchaser = ps.
						//String sUserId1  = user.getUserId();
						System.out.println("i.in to login purchaser===="+purchaser.toString());
						String sPurchaserId = purchaser.listPurchasersByClientId(sClientId);
						*/
						result = "newBillHome";
						return result;
						}else{
							//System.out.println("g. in to login sClientId=null==");
							JSONObject json = new JSONObject();
							json.put("status", "ERROR");
							json.put("message", "Error while login");
							result = json.toString();
							//System.out.println("h. in to login result==="+result);
							return result ;
						}
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
			//System.out.println("Exception in LoginController in login()");
			e.printStackTrace();		}
		return result;
	}
	/*@RequestMapping(value = "/login")
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
	}*/
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
		//System.out.println("in to forgot password");
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
			//System.out.println("in to forgotPassword sPropertyContent==="+sPropertyContent);
			sMessage = sPwd + " " + sPropertyContent;
			/*System.out.println("in to forgot password sMessage==="+sMessage);
			System.out.println("in to forgotPassword userMobile==="+userMobile);
			System.out.println("in to forgotPassword request==="+request);*/

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
		//System.out.println("in to reset password");
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
