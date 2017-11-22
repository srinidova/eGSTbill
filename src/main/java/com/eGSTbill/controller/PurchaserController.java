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

import com.eGSTbill.model.ClientPurchaser;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Purchaser;
import com.eGSTbill.service.ClientPurchaserService;
import com.eGSTbill.service.ClientService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.service.PurchaserService;
import com.eGSTbill.service.StateService;
import com.eGSTbill.service.UserService;
import com.eGSTbill.util.CommonUtils;

import org.json.JSONObject;

@Controller
public class PurchaserController {

	@RequestMapping(value = "/purchaserHome")
	public String purchaserHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From purchaserHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		String sState = null;

		try {

			StateService st = new StateService();
			sJson = st.getAllStates();
			if (sJson != null && sJson.length() > 0) {
				objSession.setAttribute("ALLSTATES", sJson);
			}

			ClientService cs = new ClientService();
			sJson = cs.listClients();
			if(sJson != null && sJson.length()>0){
				objSession.setAttribute("LISTCLIENTS", sJson);
			}
			
			PurchaserService ps = new PurchaserService();
			//sJson = ps.listPurchaser();
			
			String sClientId = (String) objSession.getAttribute("CLIENTID");
			System.out.println("sClientId=="+sClientId);
			sJson = ps.listPurchasersByClientId(sClientId);
			
			if (sJson != null && sJson.length() > 0) {
				objSession.setAttribute("LISTPURCHASERS", sJson);
			}

			

		} catch (Exception e) {
			//System.out.println("Exception in PurchaserController in purchaserHome()");
			e.printStackTrace();
		} finally {

		}
		return "purchaserHome";
	}

	@RequestMapping(value = "/addPurchase")
	public @ResponseBody String addPurchase(@ModelAttribute Purchaser purchaser, String clientId,HttpSession objSession,
			HttpServletRequest objRequest) {
		// //System.out.println("inside java");
		String resultAdd = "fail";
		String sJson = null;
		String sPurchaserId = null;
		String resultAddCliPur = "fail";
		String result = "fail";
		//String sJson = null;
		try {
			/*String sClientId = (String) objSession.getAttribute("CLIENTID");
			System.out.println("in to add purchaser "+sClientId);
		//	System.out.println("in to purcahser controller mobile number exist ");
			String sMobileNo = purchaser.getMobileNo();
			System.out.println("in to add purchaser "+sMobileNo);
			PurchaserService us = new PurchaserService();
			boolean bMobileExist = us.getPurchasersByMobileNo(sMobileNo,sClientId);
			System.out.println("in to purcahser controller bMobileExist "+bMobileExist);
			if(bMobileExist){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", sMobileNo + " already exists. Please choose another Mobile Number");
				return sJson = json.toString();
			}*/
			String sMobileNo = purchaser.getMobileNo();
			//System.out.println("sMobileNo....."+sMobileNo);
			PurchaserService us = new PurchaserService();
			//boolean bMobileExist = us.getUserByMobile(sMobileNo);
			String sClientId = (String) objSession.getAttribute("CLIENTID");
		//	System.out.println("sMobileNo....."+sMobileNo+"----CLIENT--"+sClientId);
			boolean bMobileExist = us.getPurchasersByMobileNo(sMobileNo,sClientId);
			//System.out.println(bMobileExist);
			if(bMobileExist){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", sMobileNo + " already exists. Please choose another Mobile Number");
				return sJson = json.toString();
			}
			
			String sCmpnyName = purchaser.getCompanyName();
			//System.out.println("pannumber==========" + purchaser.getPanNumber());

			PurchaserService ps = new PurchaserService();
			sPurchaserId = CommonUtils.getAutoGenId();

			purchaser.setPurchaserId(sPurchaserId);
			// purchaser.setUpdatedBy(CommonUtils.ge);.setUpdatedBy(CommonUtils.getDate());
			purchaser.setUpdatedDate(CommonUtils.getDate());
			 result = ps.addPurchase(purchaser);
			
			ClientPurchaser clientPurchaser = new ClientPurchaser();
			clientPurchaser.setClientId(clientId);
			clientPurchaser.setPurchaserId(sPurchaserId);
			ClientPurchaserService cpbo = new ClientPurchaserService();
			resultAddCliPur = cpbo.addClientPurchaser(clientPurchaser);

			//System.out.println("result========" + result);
			sJson = ps.listPurchaser();
			//System.out.println(" final result in service========" + sJson);

		} catch (Exception e) {
			//System.out.println("Exception in ProductController in addProduct()");
			e.printStackTrace();
		}
		return sJson;
	}

	@RequestMapping(value = "/deletePurchaser")
	public @ResponseBody String deletePurchaser(@RequestParam("purchaserId") String purchaserId, HttpSession objSession,
			HttpServletRequest objRequest) {
		String result = "fail";
		String sJson = null;
		try {
			Purchaser purchaser = new Purchaser();
			purchaser.setPurchaserId(purchaserId);
			PurchaserService bo = new PurchaserService();
			result = bo.deletePurchaser(purchaser);
			if (result.equals("fail")) {
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while delete product");
				return sJson = json.toString();
			}
			sJson = bo.listPurchaser();

		} catch (Exception e) {
			//System.out.println("Exception in ProductController in deleteProduct()");
			e.printStackTrace();
		}
		return sJson;
	}

	@RequestMapping(value = "/updatePurchaser")
	public @ResponseBody String updatePurchase(@ModelAttribute Purchaser newPurchaser, HttpSession objSession,
			HttpServletRequest objRequest) {
		//System.out.println("inside update java");
		String resultUpdate = "fail";
		String sJson = null;
		try {

			String sCmpnyName = newPurchaser.getCompanyName();
			//System.out.println(" purchaser id  in update controller============" + newPurchaser.getPurchaserId()+"----newPurchaser.getPanNumber-----"+newPurchaser.getPanNumber());
			PurchaserService ps = new PurchaserService();

			//newPurchaser.setPurchaserId(CommonUtils.getAutoGenId());
			// purchaser.setUpdatedBy(CommonUtils.ge);.setUpdatedBy(CommonUtils.getDate());
			newPurchaser.setUpdatedDate(CommonUtils.getDate());
			String result = ps.updatePurchaser(newPurchaser);

			//System.out.println("updateresult========" + result);
			sJson = ps.listPurchaser();
			//System.out.println(" final result in updateservice========" + sJson);

		} catch (Exception e) {
			//System.out.println("Exception in ProductController in addProduct()");
			e.printStackTrace();

		}
		return sJson;
	}
	
	@RequestMapping(value = "/getPurchasersByClientId")
	public @ResponseBody String getPurchasersByClientId(@RequestParam("sClientId") String sClientId, HttpSession objSession,
			HttpServletRequest objRequest) {
		//System.out.println("inside update java");
		String sJson = null;
		try {

			//System.out.println(" sClientId============" + sClientId);
			PurchaserService ps = new PurchaserService();

			sJson = ps.listPurchasersByClientId(sClientId);
			//System.out.println(" final result in getPurchasersByClientId========" + sJson);

		} catch (Exception e) {
			//System.out.println("Exception in ProductController in getPurchasersByClientId()");
			e.printStackTrace();

		}
		return sJson;
	}
}
