package com.eBilling.controller;

import java.io.IOException;
import java.util.List;

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

import com.eBilling.baseModel.BillingInfo;
import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.model.Product;
import com.eBilling.service.BillingInfoService;
import com.eBilling.service.UnBillCartService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UnBillCartController {
	@Autowired
	BillingInfoService objBillingInfoService;
	@Autowired
	UnBillCartService unBillCartService;
	@RequestMapping(value = "/unBillCart")
	public String unBillCart(HttpServletResponse objResponce,
			@ModelAttribute("productCmd") BillingInfo billingInfo,
			HttpSession session, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From unBillCart Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = "";
		try {
			sJson = unBillCartService.getAllBillInfoCart();
			System.out.println("sJson==============================" + sJson);
			objRequest.setAttribute("allunBillCart", sJson);
			session.setAttribute("tabActive", "unBill");
			// getAllProducts(objRequest);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "unBillCart";
	}


	@RequestMapping(value = "/unBillInfoCart")
	public @ResponseBody
	String unBillInfoCart(@ModelAttribute BillingInfoCart billingInfoCart,
			HttpSession objSession, @RequestParam("jsondata") JSONObject data,
			HttpServletRequest objRequest) {
		ObjectMapper objectMapper = null;
		String lstBillingInfo = null;
		String sJson = null;
		String billNo = null;
		String phone = null;
		String name = null;
		try { 
			billNo = data.getString("billNo");
			phone = data.getString("phone");
			name = data.getString("name");
			
			if (StringUtils.isNotBlank(billNo)) {
				billingInfoCart.setBillNo(data.getString("billNo"));
			}
			if (StringUtils.isNotBlank(phone)) {
				billingInfoCart.setPhone(data.getString("phone"));
			}
			if (StringUtils.isNotBlank(name)) {
				billingInfoCart.setName(data.getString("name"));
			}
			if(StringUtils.isNotBlank(billNo) || StringUtils.isNotBlank(name) || StringUtils.isNotBlank(phone))
			    lstBillingInfo = unBillCartService.unBillInfoCart(billingInfoCart);
			else
				lstBillingInfo = unBillCartService.getAllBillInfoCart();
			if (lstBillingInfo != null && lstBillingInfo !="") {
			    objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstBillingInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			System.out
					.println("Exception in Product Controller in  getSearchBillInfo()");
		}
		return sJson;
	}
}
