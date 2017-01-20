package com.eBilling.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.baseModel.BillingInfo;
import com.eBilling.dao.ProductDao;
import com.eBilling.model.Product;
import com.eBilling.service.BillingInfoService;
import com.eBilling.service.ProductPopulateService;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class PrintBillController {
	
	@Autowired
	  BillingInfoService objBillingInfoService;
	@Autowired
	ProductDao productDao;

	@RequestMapping(value = "/printBill")
	public String printBill(HttpServletResponse objResponce,BillingInfo billingInfo,
			HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		System.out.println("From printBill Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			sJson = objBillingInfoService.getAllBillInfo(billingInfo);
			System.out.println("sJson==============================" + sJson);
			objSession.setAttribute("allPrintBill", sJson);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "printBill";
	}

	
}
