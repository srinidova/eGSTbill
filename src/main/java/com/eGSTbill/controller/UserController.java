package com.eGSTbill.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eGSTbill.model.Client;
import com.eGSTbill.model.ClientUser;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.User;
import com.eGSTbill.service.ClientService;
import com.eGSTbill.service.ClientUserService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.service.UserService;
import com.eGSTbill.util.CommonUtils;

import org.json.JSONObject;

@Controller
public class UserController {

	@RequestMapping(value = "/userHome")
	public String userHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From userHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			UserService bo = new UserService();
			//sJson = bo.listusers();
			String sClientId = (String) objSession.getAttribute("CLIENTID");
			
			//System.out.println("sClientId=="+sClientId);
			sJson = bo.listUsersByClientId(sClientId);
			if(sJson != null && sJson.length()>0){
				objSession.setAttribute("LISTUSERS", sJson);
			}
			
			ClientService co = new ClientService();
			sJson = co.listClients();
			if (sJson != null && sJson.length() > 0) {
				objSession.setAttribute("LISTCLIENTS", sJson);
			}
			
			

		} catch (Exception e) {
			//System.out.println("Exception in UserController in userHome()");
			e.printStackTrace();
		} finally {

		}
		return "userHome";
	}
	@RequestMapping(value = "/addUser")
	public @ResponseBody String addUser(@ModelAttribute User user,String clientId, HttpSession objSession,
		HttpServletRequest objRequest){
		String resultAdd ="fail";
		String resultClientUser ="fail";
		String sUserId = null;
		//System.out.println("in to addClient controller");
		try{
			sUserId = CommonUtils.getAutoGenId();
			
			user.setUserId(sUserId);
			user.setUpdatedBy(CommonUtils.getDate());
			user.setUpdatedOn(CommonUtils.getDate());
			user.setPassword("pass@123");
			UserService bo = new UserService();
			resultAdd = bo.addUser(user);
			
			ClientUser clientUser = new ClientUser();
			//if(resultAdd == "success"){
				ClientUserService cubo = new ClientUserService();
				clientUser.setUserId(sUserId);
				clientUser.setClientId(clientId);
				resultClientUser = cubo.addClientUser(clientUser);
			//}
			
			
			
			
			/*ClientUser clientUser = new ClientUser();
			clientUser.setClientId(clientId);
			clientUser.setUserId(userId);*/
		}catch(Exception e){
			//System.out.println("Exception in UserController in addUser()");
			e.printStackTrace();
		}
		return resultClientUser;
		
	}
	@RequestMapping(value = "/deleteUser")
	public @ResponseBody String deleteUser(@RequestParam("userId") String userId, HttpSession objSession,
			HttpServletRequest objRequest) {
		String result ="fail";
		String sJson = null;
		//System.out.println("in to delete user");
		try{
			User user = new User();
			user.setUserId(userId);
			/*Product product = new Product();
			product.setProductId(productId);*/
			UserService bo = new UserService();
			result = bo.deleteUser(user);
			if(result.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while delete User");
				return sJson = json.toString();
			}
			sJson = bo.listusers();
				
		}catch(Exception e){
			//System.out.println("Exception in UserController in deleteUser()");
			e.printStackTrace();		}
		return sJson;
	}
	@RequestMapping(value = "/updateUser")
	public @ResponseBody String updateUser(@ModelAttribute User user, HttpSession objSession,
			HttpServletRequest objRequest) {
		String resultUpdate ="fail";
		String sJson = null;
		try{
			//System.out.println("in to update user");
			UserService bo = new UserService();
			user.setUpdatedBy(CommonUtils.getDate());
			user.setUpdatedOn(CommonUtils.getDate());
			/*client.setUpdatedBy(CommonUtils.getDate());
			client.setUpdatedOn(CommonUtils.getDate());*/
			
			resultUpdate = bo.updateUser(user);
			if(resultUpdate.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while update User");
				return sJson = json.toString();
			}

			sJson = bo.listusers();
		}catch(Exception e){
			//System.out.println("Exception in ClientController in updateClient()");
			e.printStackTrace();
		}
		return sJson;
	}
}
