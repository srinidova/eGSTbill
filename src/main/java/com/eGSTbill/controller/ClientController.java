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
import com.eGSTbill.model.Product;
import com.eGSTbill.service.ClientService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.util.CommonUtils;

import org.json.JSONObject;

@Controller
public class ClientController {

	@RequestMapping(value = "/clientHome")
	public String clientHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From clientHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			ClientService bo = new ClientService();
			sJson = bo.listClients();
			if (sJson != null && sJson.length() > 0) {
				objSession.setAttribute("LISTCLIENTS", sJson);
			}

		} catch (Exception e) {
			System.out.println("Exception in ClientController in clientHome()");
			e.printStackTrace();
		} finally {

		}
		return "clientHome";
	}
	@RequestMapping(value = "/addClient")
	public @ResponseBody String addClient(@ModelAttribute Client client, HttpSession objSession,
		HttpServletRequest objRequest){
		String resultAdd ="fail";
		String sJson = null;
		System.out.println("in to addClient controller");
		try{
			System.out.println("in to client controller==="+client.getAccountNumber());
			System.out.println("in to client controller==="+client.getBank());
			System.out.println("in to client controller==="+client.getBranch());
			System.out.println("in to client controller==="+client.getIfsc());
			client.setClientId(CommonUtils.getAutoGenId());
			client.setUpdatedBy(CommonUtils.getDate());
			client.setUpdatedOn(CommonUtils.getDate());
			ClientService bo = new ClientService();
			resultAdd = bo.addClient(client);
			
			sJson = bo.listClients();
			System.out.println(" sJson ========" + sJson);
		}catch(Exception e){
			System.out.println("Exception in ClientController in addClient()");
			e.printStackTrace();
		}
		return sJson;
		
	}
	@RequestMapping(value = "/deleteClient")
	public @ResponseBody String deleteClient(@RequestParam("clientId") String clientId, HttpSession objSession,
			HttpServletRequest objRequest) {
		String result ="fail";
		String sJson = null;
		try{
			System.out.println("in to deleteClient controller");
			Client client = new Client();
			client.setClientId(clientId);
			ClientService bo = new ClientService();
			result = bo.deleteClient(client);
			if(result.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while delete client");
				return sJson = json.toString();
			}
			sJson = bo.listClients();
				
		}catch(Exception e){
			System.out.println("Exception in ClientController in deleteClient()");
			e.printStackTrace();		}
		return sJson;
	}
	
	
	@RequestMapping(value = "/updateClient")
	public @ResponseBody String updateClient(@ModelAttribute Client client, HttpSession objSession,
			HttpServletRequest objRequest) {
		String resultUpdate ="fail";
		String sJson = null;
		try{
			System.out.println("in to update client");
			ClientService bo = new ClientService();
			client.setUpdatedBy(CommonUtils.getDate());
			client.setUpdatedOn(CommonUtils.getDate());
			
			resultUpdate = bo.updateClient(client);
			if(resultUpdate.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while update Client");
				return sJson = json.toString();
			}

			bo = new ClientService();
			sJson = bo.listClients();
		}catch(Exception e){
			System.out.println("Exception in ClientController in updateClient()");
			e.printStackTrace();
		}
		return sJson;
	}
}
