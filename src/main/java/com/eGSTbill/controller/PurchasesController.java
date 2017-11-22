package com.eGSTbill.controller;

import java.io.IOException;
import java.math.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eGSTbill.model.ClientPurchases;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Purchases;
import com.eGSTbill.service.ClientPurchasesService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.service.PurchasesService;
import com.eGSTbill.service.VendorService;
import com.eGSTbill.util.CommonUtils;
import com.google.gson.JsonObject;

import org.json.JSONObject;

@Controller
public class PurchasesController {

	@RequestMapping(value = "/purchasesHome")
	public String purchasesHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From purchasesHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		String sJsonPurchases = null;
		try {
			PurchasesService ps = new PurchasesService();
			sJsonPurchases = ps.listPurchases();
			if(sJsonPurchases != null && sJsonPurchases.length()>0 ){
				objSession.setAttribute("LISTPURCHASES", sJsonPurchases);
			}
			//System.out.println("in to purchases home "+sJsonPurchases);

		} catch (Exception e) {
			//System.out.println("Exception in ExampleController in exampleHome()");
			e.printStackTrace();
		} finally {

		}
		return "purchasesHome";
	}
	
	
	@RequestMapping(value = "/listPurchases")
	public @ResponseBody String listPurchases(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From vendorHome");
		objResponce.setCharacterEncoding("UTF-8");
		String listPurchases = null;
		try {
			PurchasesService ps = new PurchasesService();
			listPurchases = ps.listPurchases();
			
		} catch (Exception e) {
			//System.out.println("Exception in PurchasesController in listPurchases()");
			e.printStackTrace();
		} finally {

		}
		return listPurchases;
	}
	
	
	
	@RequestMapping(value = "/addPurchases")
	public @ResponseBody String addPurchases (@ModelAttribute Purchases purchases, HttpSession objSession,
			HttpServletRequest objRequest){
		String resultPurchases = "fail";
		String sPurchasesId = null;
		String sJson = null;
		String resultClientPurchases = "fail";
	
		try{
			sPurchasesId = CommonUtils.getAutoGenId();
		purchases.setPurchasesId(sPurchasesId);
		purchases.setUpdatedBy(CommonUtils.getDate());
		purchases.setUpdatedDate(CommonUtils.getDate());
		
		String rate = purchases.getRate();
		String quantity = purchases.getQuantity();
		
		//String t2 = String.valueOf(Integer.parseInt(t1) * Integer.parseInt(m1)) 
		
		//String calculateAmount = String.valueOf(Integer.parseInt(rate) * Integer.parseInt(quantity)) ;
		
		
		/*int n1 = Integer.parseInt(rate);

	    int n2 = Integer.parseInt(quantity);

	    int n3 = n1 * n2;
	    
	    System.out.println("into    "+n3);*/
	    
	   // String calculateAmount = String.format("%d", n3);
		
	   // System.out.println("in to add purchases "+calculateAmount);
	    
		//String calculateAmount = String.valueOf(Float.valueOf(rate) * Float.valueOf(quantity));
		
		 int calculateAmount = Integer.parseInt(quantity)*Integer.parseInt(rate);
		 
		 //System.out.println("in to purchases cotroller calculateAmount"+calculateAmount);
		
		 double t1_num = Double.valueOf(rate);
		    double m1_num = Double.valueOf(quantity);
		    double t2_num = t1_num * m1_num;
		    
		   // System.out.println("in to purchases controller t2_num"+t2_num);
		   // String calculateAmount = String.valueOf(t2_num);
		
		    purchases.setTotalAmount(calculateAmount);
		PurchasesService ps = new PurchasesService();
		resultPurchases = ps.addPurchases(purchases);
		//System.out.println("in to add purchases "+resultPurchases);
		
		String sClientId = (String) objSession.getAttribute("CLIENTID");
		
		//System.out.println("in to purchases client "+sClientId);
		
		ClientPurchases cp = new ClientPurchases();
		cp.setClientId(sClientId);
		cp.setPurchasesId(sPurchasesId);
		ClientPurchasesService cps = new ClientPurchasesService();
		resultClientPurchases = cps.addClientPurchases(cp);
	
		
		if(StringUtils.isNotEmpty(resultPurchases)){
			if(resultPurchases.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("Status", "Error");
				json.put("Status", "Error while add purchases");
				return sJson = json.toString();
			}
		}
			
		}catch(Exception e){
			
		}
		
		
		return sJson;
	}
	
	@RequestMapping(value ="/deletePurchases")
	public @ResponseBody String deletePurchases(@RequestParam("purchasesId") String purchasesId, HttpSession objSession,
			HttpServletRequest objRequest){
		String result = "fail";
		String sJson = null;
		try{
			Purchases purchases = new Purchases();
			purchases.setPurchasesId(purchasesId);
			PurchasesService ps = new PurchasesService();
			result = ps.deletePurchases(purchases);
			
			
			
			
			if(result.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("Status", "Error");
				json.put("Status", "Error While Delete while Purchases");
				return sJson = json.toString();
				
			}
			
			sJson = ps.listPurchases();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return sJson;
	}
	@RequestMapping(value = "/updatePurchases")
	public @ResponseBody String updatePurchase(@ModelAttribute Purchases purchases, HttpSession objSession,
			HttpServletRequest objRequest){
		String result = "fail";
		String sJson = null;
		try{
			PurchasesService ps = new PurchasesService();
			purchases.setUpdatedBy(CommonUtils.getDate());
			purchases.setUpdatedDate(CommonUtils.getDate());
			
			String rate = purchases.getRate();
			String quantity = purchases.getQuantity();
			
			int calculateAmount = Integer.parseInt(rate)*Integer.parseInt(quantity);
			purchases.setTotalAmount(calculateAmount);
			
			result = ps.updatePurchases(purchases);
			/*if(result.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while update Purchases");
				return sJson = json.toString();
			}*/
		}catch(Exception e){
			e.printStackTrace();
		}
		return sJson;
		
	}
}
