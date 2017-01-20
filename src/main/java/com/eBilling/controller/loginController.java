package com.eBilling.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.model.LoginInfo;
import com.eBilling.model.Register;
import com.eBilling.service.ClientService;
import com.eBilling.service.LoginService;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class loginController {
	@Autowired
	LoginService loginService;
	
	@Autowired
	ClientService clientService;
	
	@RequestMapping(value = "/loginHome")
	public String loginHome(HttpServletResponse objResponce,
			@ModelAttribute LoginInfo loginInfo,
			HttpSession session, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From loginHome Home");
		objResponce.setCharacterEncoding("UTF-8");
			String sJson = null;
		try {
			sJson = clientService.getAllClient();
			session.setAttribute("clientInfo", sJson);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "loginHome";
	}
	
	@RequestMapping(value = "/validateLogin")
	public @ResponseBody String validateLogin(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletRequest objRequest) {
		boolean isInsert = false;
		String sJson = "";
		String userInfo = null;
		Register register = null;
		try {
			
			System.out.println("email, =="+email+"password"+password);
			if (StringUtils.isNotBlank(email) && StringUtils.isNotBlank(password)) {
				 register  = loginService.validateUser(email, password);
				 System.out.println("registerModel: "+register);
				if(register != null){
					HttpSession session = objRequest.getSession(true);
					ObjectMapper objMapper = new ObjectMapper();
					 userInfo = objMapper.writeValueAsString(register);
					session.setAttribute("userInfo", register);
					return userInfo;
				}else {
					
					System.out.println("Invalid Username and Pwd");
					return "Invalid Username and Pwd";
				}
				} 
			
		
		} catch (Exception e) {
			//log.error("Exception in validateLogin()", e);
			e.printStackTrace();
		}
		return "Unable to login";
	}
	
	@RequestMapping(value = "/logOut")
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute("register");
			session.invalidate();
		}
		return "redirect:loginHome";
	}
}
