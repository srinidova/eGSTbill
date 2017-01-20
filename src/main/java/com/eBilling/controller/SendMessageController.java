package com.eBilling.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.baseModel.PurchaserInfo;
import com.eBilling.model.LoginInfo;
import com.eBilling.model.Product;
import com.eBilling.model.Register;
import com.eBilling.model.SendSms;
import com.eBilling.service.ProductPopulateService;
import com.eBilling.service.PurchaseInfoService;
import com.eBilling.util.CommonUtils;
import com.eBilling.util.Sms;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class SendMessageController {
	@Autowired
	ProductPopulateService productPopulateService;
	@Autowired
	PurchaseInfoService purchaseInfoService;
	@Autowired
	ServletContext objContext;

	@RequestMapping(value = "/sendMessageHome")
	public String sendMessageHome(HttpServletResponse objResponce, @ModelAttribute LoginInfo loginInfo,
			HttpSession session, HttpServletRequest objRequest) throws IOException {
		// System.out.println("From sendMessageHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return "sendMessageHome";
	}

	@RequestMapping(value = "/sendMessage")
	public @ResponseBody String sendMessage(@RequestParam("jsondata") JSONObject data, HttpSession objSession,
			HttpServletRequest objRequest) {
		List<PurchaserInfo> lstPurchase = null;
		PurchaserInfo purchaserInfo = null;
		InputStream input = null;
		SendSms Objsmsbean = null;
		try {
			// System.out.println("in sendMessage.... ");

			String sNewMsg = data.getString("sendAaddress");
			// System.out.println("sNewMsg.... " + sNewMsg);
			lstPurchase = purchaseInfoService.getAllPurchaseInfo();

			// System.out.println("purchase Details.... " + lstPurchase.size());
			if (lstPurchase != null && lstPurchase.size() > 0) {
				StringBuffer sBuffPur = new StringBuffer();

				for (int i = 0; i < lstPurchase.size(); i++) {
					purchaserInfo = lstPurchase.get(i);

					if (sBuffPur.length() > 0)
						sBuffPur.append(",");

					sBuffPur.append("91" + purchaserInfo.getMobileNo());
				}
				// System.out.println("sBuffPur==" + sBuffPur.toString());

				Properties prop = new Properties();
				String propertiespath = objContext.getRealPath("Resources" + File.separator + "DataBase.properties");
				input = new FileInputStream(propertiespath);
				// load a properties file
				prop.load(input);
				String sendSms = prop.getProperty("sendSms");
				if (sendSms.equals("yes")) {
					String smsOtpText = prop.getProperty("smsOtpText");
					// System.out.println("smsOtpText = " + smsOtpText);

					Objsmsbean = new SendSms();
					Objsmsbean.setSendTo(sBuffPur.toString());
					Objsmsbean.setMessage(sNewMsg);
					// System.out.println("before sendSms");
					Sms.sendMessage(objContext, Objsmsbean);
					// System.out.println("after sendSms");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

}
