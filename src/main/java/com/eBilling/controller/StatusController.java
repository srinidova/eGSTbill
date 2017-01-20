package com.eBilling.controller;

import java.io.IOException;
import java.util.List;

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

import com.eBilling.dao.StatusDao;
import com.eBilling.model.Status;
import com.eBilling.service.StatusServiceImpl;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
public class StatusController {

	@Autowired
	StatusServiceImpl objStatusServiceImpl;
	
	  @Autowired 
	 StatusDao statusDao;
	 
	

	@RequestMapping(value = "/statusHome")
	public String statusHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From Status Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			sJson = objStatusServiceImpl.populateStatus();
			objSession.setAttribute("allStatus", sJson);
			/*sJson = objPopulateService.populateProducts();
			objSession.setAttribute("allProducts", sJson);*/
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "statusHome";
	}

	@RequestMapping(value = "/statusSave")
	public @ResponseBody String statusSave(@ModelAttribute Status status, HttpSession objSession,
			HttpServletRequest objRequest) {
		boolean isInsert = false;
		String sJson = "";
		List<Status> lstStatus = null;
		try {
			String sStatus = status.getStatus();
			/*String sPurchaseName = purchaserInfo.getName();
			 lstPurchaseName = purchaseInfoService.getPurchaseByName(sPurchaseName);*/
			  lstStatus = objStatusServiceImpl.getStatusByName(sStatus);
			 System.out.println("lstStatusname======="+lstStatus.size());
			 if(lstStatus == null || lstStatus.size() == 0){
				 status.setStatusId(CommonUtils.getAutoGenId());

	                isInsert = objStatusServiceImpl.statusSave(status);
	           if(isInsert){
	        	   sJson = objStatusServiceImpl.populateStatus();
	           }
	                
			 }else{
				 JSONObject json = new JSONObject();
					json.put("status", "ERROR");
					json.put("message", "Product Already Exist");
					sJson = json.toString();
			 }
			 /*if(lstStatus.size() == 0)
			 {*/
				
			/* }else
			 {
				 JSONObject json = new JSONObject();
					json.put("status", "ERROR");
					json.put("message", "Status Already Exist");
					sJson = json.toString();
			 }*/
		} catch (Exception e) {
			System.out.println("Exception in Status Controller in statusSave()");
		}
		return sJson;
	}

	@RequestMapping(value = "/statusUpdate")
	public @ResponseBody String statusUpdate(@ModelAttribute Status status,
			@RequestParam("jsondata") JSONObject data, HttpSession objSession, HttpServletRequest objRequest) {
		boolean isUpdate = false;
		String sJson = "";
		boolean toUpdate = false;
		List<Status> lstStatus = null;
		try {
			System.out.println("data===="+data);
			//String sStatus = data.getString("status");
			//lstStatus = objStatusServiceImpl.getClass();
			//lstStatus = objPopulateService.getProductByName(sProductName);
			status.setStatusId(data.getString("statusId"));
			status.setStatus(data.getString("status"));
			status.setDescription(data.getString("description"));
			status.setStatusPriority(data.getString("statusPriority"));
			
			isUpdate = objStatusServiceImpl.updateStatus(status);
			System.out.println("isUpdate"+isUpdate);
			/*isupdate = objRegistrationService.updateRegister(register);
			System.out.println("isupdate"+isupdate);
*/
			sJson = objStatusServiceImpl.populateStatus();
		} catch (Exception ex) {
			System.out.println("Exception in status Controller in  statusUpdate()");
		}
		return sJson;
	}

	@RequestMapping(value = "/deleteStatusData")
	public @ResponseBody String deleteStatusData(@RequestParam("id") String sStatusId, HttpSession objSession,
			HttpServletRequest objRequest) throws JsonGenerationException, JsonMappingException, IOException {
		boolean isDelete = false;
		String sJson = "";
        isDelete = objStatusServiceImpl.deleteStatus(sStatusId);
		//isDelete = objPopulateService.deleteProduct(sProductId);

		if (isDelete) {
			sJson = objStatusServiceImpl.populateStatus();
			//sJson = objPopulateService.populateProducts();
		}
		return sJson;

	}

}
