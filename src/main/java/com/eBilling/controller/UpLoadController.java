package com.eBilling.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.baseModel.PurchaserInfo;
import com.eBilling.dao.ProductStockDao;
import com.eBilling.model.LoginInfo;
import com.eBilling.model.Product;
import com.eBilling.model.ProductStock;
import com.eBilling.service.ProductPopulateService;
import com.eBilling.service.PurchaseInfoService;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UpLoadController {
	@Autowired
	ProductPopulateService productPopulateService;
	@Autowired
	PurchaseInfoService purchaseInfoService;
	@Autowired
	ProductStockDao productStockDao;
	
	
	@RequestMapping(value = "/uploadHome")
	public String uploadHome(HttpServletResponse objResponce,
			@ModelAttribute LoginInfo loginInfo,
			HttpSession session, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From uploadHome Home");
		objResponce.setCharacterEncoding("UTF-8");
			String sJson = null;
		try {
			session.setAttribute("tabActive", "upload");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "uploadHome";
	}
	
	@RequestMapping(value = "/importCSV")
	public @ResponseBody String importCSV(@ModelAttribute Product product, ModelMap model,
			HttpServletRequest request) {
		String sJson = "";
		boolean isInsert = false;	
		List<Product> lstProductModel = null;
		ProductStock productStock =null;
		try{			
			
		System.out.println("inside the controller");
		
		String s = request.getParameter("jso");
		JSONArray array = new JSONArray(s);
		System.out.println("arrayLength"+array.length());
		
		for (int i = 0; i < array.length(); i++) {
			JSONObject a = (JSONObject) array.get(i);
			
			System.out.println("productName===="+a.getString("productName"));
			
			String sProductName = a.getString("productName");
			lstProductModel = productPopulateService.getProductByName(sProductName);
			
			if (lstProductModel == null || lstProductModel.size() == 0) {
				product.setProductId(CommonUtils.getAutoGenId());
				product.setProductName(a.getString("productName"));
				product.setProductType(a.getString("productType"));
				product.setMrp(a.getString("mrp"));
				product.setUpdatedBy(CommonUtils.getDate());
				product.setUpdatedDate(CommonUtils.getDate());
				
				isInsert = productPopulateService.productSave(product);
				productStock =new ProductStock();
				productStock.setStockId(CommonUtils.getAutoGenId());
				productStock.setProductId(product.getProductId());
				productStock.setOldStock(a.getString("stock"));
				productStock.setNewStock("0");
				int iOldStock=Integer.parseInt(productStock.getOldStock());
				int iNewStock=Integer.parseInt(productStock.getNewStock());
				int iStock=iOldStock+iNewStock;
				productStock.setStock(String.valueOf(iStock));
				
					productStockDao.saveProductStock(productStock);
			} else {

				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Product Already Exist");
				sJson = json.toString();
			}
			
			
			
			
			//productPopulateService.productSave(product);
		}
		}catch(Exception e){
			e.printStackTrace();
		}

		return sJson;
	}
	@RequestMapping(value = "/importPurchase")
	public @ResponseBody String importPurchase(@ModelAttribute PurchaserInfo purchaserInfo, ModelMap model,
			HttpServletRequest request) {
		String sJson = "";
		boolean isInsert = false;
		List<PurchaserInfo> lstPurchaseName = null;
		
		try{
			
		System.out.println("inside the importPurchase controller");
		String s = request.getParameter("jso");

		JSONArray array = new JSONArray(s);
		System.out.println("arrayLength"+array.length());
		for (int i = 0; i < array.length(); i++) {
			
			JSONObject a = (JSONObject) array.get(i);
			System.out.println("name===="+a.getString("name"));
			
			String sPurchaseName = a.getString("name");
			 lstPurchaseName = purchaseInfoService.getPurchaseByName(sPurchaseName);
			
			 if(lstPurchaseName == null || lstPurchaseName.size() == 0){
					
					
					purchaserInfo.setPurchaseId(CommonUtils.getAutoGenId());
					purchaserInfo.setName(a.getString("name"));
					purchaserInfo.seteMail(a.getString("eMail"));
					purchaserInfo.setMobileNo(a.getString("mobileNo"));
					purchaserInfo.setAddress(a.getString("address"));
					purchaserInfo.setUpdatedBy(CommonUtils.getDate());
					purchaserInfo.setUpdatedDate(CommonUtils.getDate());
					
				isInsert = purchaseInfoService.savePurchaseInfo(purchaserInfo);
				
				
					} else {

						JSONObject json = new JSONObject();
						json.put("status", "ERROR");
						json.put("message", "Product Already Exist");
						sJson = json.toString();
					}
		}
		}catch(Exception e){
			e.printStackTrace();
		}

		return sJson;
	}
	
	
}
