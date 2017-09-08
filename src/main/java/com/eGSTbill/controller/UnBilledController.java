package com.eGSTbill.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eGSTbill.model.BillCart;
import com.eGSTbill.model.Client;
import com.eGSTbill.service.BillCartService;
import com.eGSTbill.service.BillDetailsCartService;
import com.eGSTbill.service.ClientService;

@Controller
public class UnBilledController {

	@RequestMapping(value = "/unbilledHome")
	public String unbilledHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From unbilledHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			BillCartService billcart = new BillCartService();
			sJson = billcart.listBillCart();
			if(sJson != null && sJson.length()>0){
				objRequest.setAttribute("BILLCART", sJson);
			}
		} catch (Exception e) {
			//System.out.println("Exception in UnBilledController in unbilledHome()");
			e.printStackTrace();
		} finally {

		}
		return "unbilledHome";
	}
	
	@RequestMapping(value = "/searchUnbilled")
	public @ResponseBody String searchUnBilled(@RequestParam("searchBillno") String searchBillno, 
			@RequestParam("searchBillDate") String searchBillDate, HttpSession objSession,
			HttpServletRequest objRequest) {
		String result = null;
		String sJson = null;
		try {
			//System.out.println("in to UnBilledController ");
			BillCart billcart = new BillCart();
			billcart.setBillNo(searchBillno);
			billcart.setBillDate(searchBillDate);
			
			
			
			BillCartService billcartservice = new BillCartService();
			result = billcartservice.searchUnBilled(billcart);
			//System.out.println("in to unbilled "+billcart.getBillNo());
			//System.out.println("in to unbilled "+billcart.getBillDate());
			
			//System.out.println("in to searchUnbilled controller result "+result);
			
			
			if (result.equals("fail")) {
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while search unbilled");
				return sJson = json.toString();
			}
			sJson = billcartservice.listBillCart();
			//System.out.println("in to searchUnBilled "+sJson);

		} catch (Exception e) {
			//System.out.println("Exception in UnBilledController in searchUnBilled()");
			e.printStackTrace();
		}
		return result;
	}
	
}
