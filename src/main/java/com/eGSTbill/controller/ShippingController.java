package com.eGSTbill.controller;

import java.io.IOException;
import java.util.ArrayList;

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
import com.eGSTbill.model.Purchaser;
import com.eGSTbill.model.PurchaserShipping;
import com.eGSTbill.model.Shipping;
import com.eGSTbill.model.User;
import com.eGSTbill.service.ClientService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.service.PurchaserService;
import com.eGSTbill.service.PurchaserShippingService;
import com.eGSTbill.service.ShippingService;
import com.eGSTbill.service.UserService;
import com.eGSTbill.util.CommonUtils;

import org.json.JSONObject;

@Controller
public class ShippingController {

	@RequestMapping(value = "/shippingHome")
	public String shippingHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From shippingHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			ShippingService bo = new ShippingService();
			sJson = bo.listShipping();
			if (sJson != null && sJson.length() > 0) {
				objSession.setAttribute("LISTSHIPPING", sJson);
			}
			System.out.println("in to shipping controller==="+sJson);

		} catch (Exception e) {
			System.out.println("Exception in ShippingController in shippingHome()");
			e.printStackTrace();
		} finally {

		}
		return "shippingHome";
	}
	
	@RequestMapping(value = "/addShipping")
	public @ResponseBody String addShipping(@ModelAttribute Shipping shipping,String purchaserId,String companyName, HttpSession objSession,
		HttpServletRequest objRequest){
		String resultAdd ="fail";
		String sJson = null;
		String sShippingId = null;
		String resultAddPurShi = "fail";
		System.out.println("in to addShipping controller");
		try{
			sShippingId = CommonUtils.getAutoGenId();
			shipping.setShippingId(sShippingId);
			shipping.setPurchaserName(companyName);
			ShippingService bo = new ShippingService();
			resultAdd = bo.addShipping(shipping);
			
			
				PurchaserShipping purchaserShipping = new PurchaserShipping();
				PurchaserShippingService psbo = new PurchaserShippingService();
				purchaserShipping.setPurchaserId(purchaserId);
				purchaserShipping.setShippingId(sShippingId);
				resultAddPurShi = psbo.addPurchaserShipping(purchaserShipping);
				
			
				if(StringUtils.isNotEmpty(resultAdd)){
					if(resultAdd.equals("fail")){
						JSONObject json = new JSONObject();
						json.put("status", "ERROR");
						json.put("message", "Error while add Shipping");
						return sJson = sJson.toString();
					}
				}
		}catch(Exception e){
			System.out.println("Exception in ShippingController in addShipping()");
			e.printStackTrace();
		}
		return sJson;
		
	}
	@RequestMapping(value = "/deleteShipping")
	public @ResponseBody String deleteShipping(@RequestParam("shippingId") String shippingId, HttpSession objSession,
			HttpServletRequest objRequest) {
		String result ="fail";
		String sJson = null;
		System.out.println("in to delete Shipping");
		try{
			Shipping shipping = new Shipping();
			shipping.setShippingId(shippingId);
			/*Product product = new Product();
			product.setProductId(productId);*/
			ShippingService bo = new ShippingService();
			result = bo.deleteShipping(shipping);
			if(result.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while delete Shipping");
				return sJson = json.toString();
			}
			sJson =  bo.listShipping();
				
		}catch(Exception e){
			System.out.println("Exception in ShippingController in deleteShipping()");
			e.printStackTrace();		}
		return sJson;
	}
	
	@RequestMapping(value = "/updateShipping")
	public @ResponseBody String updateShipping(@ModelAttribute Shipping shipping, HttpSession objSession,
			HttpServletRequest objRequest) {
		String resultUpdate ="fail";
		String sJson = null;
		try{
			System.out.println("in to update Shipping");
			ShippingService bo = new ShippingService();
			
			resultUpdate = bo.updateShipping(shipping);
			/*if(resultUpdate.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while update Client");
				return sJson = json.toString();
			}

			bo = new ClientService();
			sJson = bo.listClients();*/
		}catch(Exception e){
			System.out.println("Exception in ClientController in updateClient()");
			e.printStackTrace();
		}
		return sJson;
	}
	
	
	@RequestMapping(value = "/listShippings")
	public @ResponseBody String listShippings(@RequestParam("purchaserId") String purchaserId,PurchaserShipping purchaserShipping, HttpSession objSession,
			HttpServletRequest objRequest) {
		String resultUpdate ="fail";
		String sJson = null;
		try{
			System.out.println("in to listShippings shipping.purchaserId=="+purchaserId);
			ShippingService bo = new ShippingService();
			PurchaserShippingService psbo = new PurchaserShippingService();
			
			// Hear needs to get list of Shippings by purchaser id
			//sJson = psbo.getShippingDetailsBypurchaserId(purchaserShipping);
			sJson = bo.listShipping();
			System.out.println("in to shipping controller==="+sJson);
		}catch(Exception e){
			System.out.println("Exception in ShippingController in listShippings()");
			e.printStackTrace();
		}
		return sJson;
	}
}
