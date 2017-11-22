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

import com.eGSTbill.model.Client;
import com.eGSTbill.model.ClientVendor;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Purchaser;
import com.eGSTbill.model.PurchaserShipping;
import com.eGSTbill.model.Shipping;
import com.eGSTbill.model.Vendor;
import com.eGSTbill.service.ClientService;
import com.eGSTbill.service.ClientVendorService;
import com.eGSTbill.service.ProducService;
import com.eGSTbill.service.PurchaserShippingService;
import com.eGSTbill.service.ShippingService;
import com.eGSTbill.service.VendorService;
import com.eGSTbill.util.CommonUtils;

import org.json.JSONObject;

@Controller
public class VendorController {

	@RequestMapping(value = "/vendorHome")
	public String vendorHome(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From vendorHome");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		String vendorList = null;
		try {
			VendorService vs = new VendorService();
			vendorList = vs.listVendors();
			if(vendorList != null && vendorList.length()>0){
				objSession.setAttribute("LISTVENDORS", vendorList);
			}

		} catch (Exception e) {
			//System.out.println("Exception in VendorController in vendorHome()");
			e.printStackTrace();
		} finally {

		}
		return "vendorHome";
	}
	
	
	
	@RequestMapping(value = "/vendorList")
	public @ResponseBody String listVendors(HttpServletResponse objResponce, HttpSession objSession, HttpServletRequest objRequest)
			throws IOException {
		//System.out.println("From vendorHome");
		objResponce.setCharacterEncoding("UTF-8");
		String vendorList = null;
		try {
			VendorService vs = new VendorService();
			vendorList = vs.listVendors();
			
		} catch (Exception e) {
			//System.out.println("Exception in VendorController in vendorHome()");
			e.printStackTrace();
		} finally {

		}
		return vendorList;
	}
	
	@RequestMapping(value = "/addVendor")
	public @ResponseBody String addVendor(@ModelAttribute Vendor vendor, String clientId,HttpSession objSession,
			HttpServletRequest objRequest){
		//System.out.println("in to add vendor");
		String resultAdd = "fail";
		String sVendorId = null;
		String sJson = null;
		String resultclientVendor = null;
		
		try{
			
			String sMobile = vendor.getMobile();
			
			VendorService vss = new VendorService();
			String sClientId = (String) objSession.getAttribute("CLIENTID");
			//System.out.println("sMobileNo....."+sMobile+"----CLIENT--"+sClientId);
			
			boolean bMobileExist = vss.getVendorsByMobileNo(sMobile, sClientId);
			//System.out.println(bMobileExist);
			if(bMobileExist){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", sMobile + " already exists. Please choose another Mobile Number");
				return sJson = json.toString();
			}
			
		sVendorId = CommonUtils.getAutoGenId();
		vendor.setVendorId(sVendorId);
		vendor.setUpdatedBy(CommonUtils.getDate());
		vendor.setUpdatedDate(CommonUtils.getDate());
		VendorService vs = new VendorService();
		resultAdd = vs.addVendor(vendor);
		//System.out.println("control---"+resultAdd);
		
		ClientVendorService cvs = new ClientVendorService();
		ClientVendor clientVendor = new ClientVendor();
		clientVendor.setClientId(clientId);
		clientVendor.setVendorId(sVendorId);
		resultclientVendor = cvs.addClientVendor(clientVendor);
		
		
		if(StringUtils.isNotEmpty(resultAdd)){
			if(resultAdd.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while add Vendor");
				 return sJson = json.toString();
			}else{
				JSONObject json = new JSONObject();
				json.put("status", "sucess");
				json.put("message", "sucess");
				sJson = json.toString();
			}
		}
		}catch(Exception e){
			
		}
		return sJson;
	}
	@RequestMapping(value = "/deleteVendor")
	public @ResponseBody String deleteVendor(@RequestParam("vendorId") String vendorId, HttpSession objSession,
			HttpServletRequest objRequest) {
		String result ="fail";
		String sJson = null;
		//System.out.println("in to delete Vendor");
		try{
			Vendor vendor = new Vendor();
			vendor.setVendorId(vendorId);
			
			VendorService bo = new VendorService();
			result = bo.deleteVendor(vendor);
			if(result.equals("fail")){
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while delete Shipping");
				return sJson = json.toString();
			}
			sJson =  bo.listVendors();
				
		}catch(Exception e){
			//System.out.println("Exception in VendorController in deleteVendor()");
			e.printStackTrace();		}
		return sJson;
	}
	@RequestMapping(value = "/updateVendor")
	public @ResponseBody String updateVendor(@ModelAttribute Vendor vendor, HttpSession objSession,
			HttpServletRequest objRequest) {
		String resultUpdate = "fail";
		String sJson = null;
		//System.out.println("in to update vendor ");
		try {
			//System.out.println("in to update client");
			VendorService bo = new VendorService();
			vendor.setUpdatedBy(CommonUtils.getDate());
			vendor.setUpdatedDate(CommonUtils.getDate());

			resultUpdate = bo.updateVendor(vendor);
			//System.out.println("in to update vendor resultUpdate   "+resultUpdate);
			/*if (resultUpdate.equals("fail")) {
				JSONObject json = new JSONObject();
				json.put("status", "ERROR");
				json.put("message", "Error while update Vendor");
				return sJson = json.toString();
			}
*/
			bo = new VendorService();
			sJson = bo.listVendors();
			//System.out.println("in to update vendor sJson "+sJson);
		} catch (Exception e) {
			//System.out.println("Exception in VendorController in updateVendor()");
			e.printStackTrace();
		}
		return sJson;
	}
}
