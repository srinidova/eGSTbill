package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.PurchaserDAO;
import com.eGSTbill.dao.VendorDAO;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Purchaser;
import com.eGSTbill.model.Vendor;
import com.fasterxml.jackson.databind.ObjectMapper;

public class VendorService {

	
	
	public String addVendor(Vendor vendor){
		VendorDAO dao = new VendorDAO();
		return dao.addVendor(vendor);
		
	}
	
	public String listVendors(){
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<Vendor> lstVendors = null;
		VendorDAO dao = new VendorDAO();
		lstVendors = dao.listVendor();
		if (lstVendors == null || lstVendors.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstVendors);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}
	public String deleteVendor(Vendor vendor) {
		VendorDAO dao = new VendorDAO();
		return dao.deleteVendor(vendor);
	}
	
	public String updateVendor(Vendor vendor){
		VendorDAO dao = new VendorDAO();
		return dao.updateVendor(vendor);
	}
	
	public boolean getVendorsByMobileNo(String sMobile,String clientId) {
		boolean bMobileNoExist = false;
		ArrayList<Vendor> lstVendors = null;
		VendorDAO dao = new VendorDAO();
		lstVendors = dao.getVendorsByMobileNo(sMobile, clientId);
		//System.out.println(lstVendors.size());
		if (lstVendors != null && lstVendors.size() >= 1) {
			bMobileNoExist = true;
		}
		return bMobileNoExist;
	}
}
