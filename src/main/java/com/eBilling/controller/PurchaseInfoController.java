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

import com.eBilling.baseDao.PurchaseInfoBaseDao;
import com.eBilling.baseModel.PurchaserInfo;
import com.eBilling.model.Product;
import com.eBilling.service.PurchaseInfoService;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class PurchaseInfoController {
	
	
	
	@Autowired
	PurchaseInfoService purchaseInfoService;
	
	@RequestMapping(value = "/purchaseInfoHome")
	public String purchaseInfoHome(HttpServletResponse objResponce,
			HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From Prodcut Home");
		objResponce.setCharacterEncoding("UTF-8");
		List<PurchaserInfo> sJson = null;
		String purchaseLst = null;
		try {
			
			sJson = purchaseInfoService.getAllPurchaseInfo();
			if (sJson != null && sJson.size() > 0) {
			ObjectMapper objMapper = new ObjectMapper();
				purchaseLst = objMapper.writeValueAsString(sJson);
				objSession.setAttribute("allPurchaseInfo", purchaseLst);
				System.out.println("From Prodcut Home=="+purchaseLst);
				objSession.setAttribute("tabActive", "purchaser");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "purchaseInfoHome";
	}

	@RequestMapping(value = "/savePurchaseInfo")
	public @ResponseBody
	String savePurchaseInfo(@ModelAttribute PurchaserInfo purchaserInfo,
			HttpSession objSession, HttpServletRequest objRequest) {
		boolean isInsert = false;
		List<PurchaserInfo> sJson = null;
		String purchaseLst = null;
		List<PurchaserInfo> lstPurchaseName = null;
		try {		
			String sEmail = purchaserInfo.geteMail();
			String sMobileNo= purchaserInfo.getMobileNo();
			lstPurchaseName =purchaseInfoService.checkEmailAndMobileNo(sEmail,sMobileNo);
					String sPurchaseName = purchaserInfo.getName();
					if(lstPurchaseName.size()==0){
					 lstPurchaseName = purchaseInfoService.getPurchaseByName(sPurchaseName);
					System.out.println("saveLstPurchaseName==="+lstPurchaseName+"sPurchaseName=="+sPurchaseName);
					if(lstPurchaseName == null || lstPurchaseName.size() == 0){
						
					
					purchaserInfo.setPurchaseId(CommonUtils.getAutoGenId());
				isInsert = purchaseInfoService.savePurchaseInfo(purchaserInfo);
				
				if (isInsert){
					sJson = purchaseInfoService.getAllPurchaseInfo();
				if (sJson != null && sJson.size() > 0) {
					ObjectMapper objMapper = new ObjectMapper();
						purchaseLst = objMapper.writeValueAsString(sJson);
					}
				}
					} else {

						JSONObject json = new JSONObject();
						json.put("status", "ERRORS");
						json.put("message", "Product Already Exist");
						purchaseLst = json.toString();
					}
					}else{
						JSONObject json = new JSONObject();
						json.put("status", "ERROR");
						json.put("message", "Same email and mobileNo already exist.");
						purchaseLst = json.toString();
					}
		} catch (Exception e) {
			System.out
					.println("Exception in Product Controller in savePurchaseInfo()");
		}
		return purchaseLst;
	}

	@RequestMapping(value = "/updatePurchaseInfo")
	public @ResponseBody
	String updatePurchaseInfo(@ModelAttribute PurchaserInfo purchaserInfo,
			@RequestParam("jsondata") JSONObject data, HttpSession objSession,
			HttpServletRequest objRequest) {
		boolean isUpdate = false;
		List<PurchaserInfo> sJson = null;
		boolean toUpdate = false;
		String purchaseLst = null;
		List<PurchaserInfo> lstPurchaseName = null;
		try {
			
			String sPurchaseName = data.getString("name");
			 lstPurchaseName = purchaseInfoService.getPurchaseByName(sPurchaseName);
			System.out.println("saveLstPurchaseName==="+lstPurchaseName+"sPurchaseName=="+sPurchaseName);
			if(lstPurchaseName != null && lstPurchaseName.size() > 0){
			
				for (int i = 0; i < lstPurchaseName.size(); i++) {
					PurchaserInfo purChaseExist = lstPurchaseName.get(i);

					if (purChaseExist.getPurchaseId().equals(data.get("purchaseId"))) {
						toUpdate = true;
					} else {
						System.out.println("----else---");
						JSONObject json = new JSONObject();
						json.put("status", "ERROR");
						json.put("message", "Product Already Exist");
						purchaseLst = json.toString();
					}
					break;
				}
			} else {
				toUpdate = true;
			}
			if (toUpdate) {
				System.out.println("productUpdate");
				System.out.println("isUpdateisUpdateisUpdateisUpdatet");
				purchaserInfo.setPurchaseId(data.getString("purchaseId"));
				purchaserInfo.setName(data.getString("name"));
				purchaserInfo.setMobileNo(data.getString("mobileNo"));
				purchaserInfo.setAddress(data.getString("address"));
				purchaserInfo.seteMail(data.getString("eMail"));
				purchaserInfo.setTinNo(data.getString("tinNo"));
					isUpdate = purchaseInfoService.updatePurchaseInfo(purchaserInfo);
				if (isUpdate) {
					sJson = purchaseInfoService.getAllPurchaseInfo();
					if (sJson != null && sJson.size() > 0) {
						ObjectMapper objMapper = new ObjectMapper();
							purchaseLst = objMapper.writeValueAsString(sJson);
					}
				}
			}
			
		} catch (Exception ex) {
			System.out
			.println("Exception in Product Controller in  updatePurchaseInfo()");
		}
		return purchaseLst;
	}

	@RequestMapping(value = "/deletePurchaseInfo")
	public @ResponseBody
	List<PurchaserInfo> deletePurchaseInfo(@RequestParam("id") String id,
			HttpSession objSession, HttpServletRequest objRequest)
			throws JsonGenerationException, JsonMappingException, IOException {
		boolean isDelete = false;
		List<PurchaserInfo> sJson = null;
		isDelete = purchaseInfoService.deletePurchaseInfo(id);
		sJson = purchaseInfoService.getAllPurchaseInfo();
		return sJson;

	}
	
}
