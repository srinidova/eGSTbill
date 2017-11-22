package com.eGSTbill.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Purchaser;
import com.eGSTbill.model.User;
import com.eGSTbill.model.Vendor;
import com.ibatis.sqlmap.client.SqlMapClient;

public class VendorDAO {

	
	
	public String addVendor(Vendor vendor){
		String result = "fail";
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Vendor.addVendor", vendor);
			result = "success";
		//	System.out.println("in to add Vendor dao result "+result);
		}catch(Exception e){
			
		}
		return result;
		
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Vendor> listVendor(){
		ArrayList<Vendor> lstVendor = new ArrayList<Vendor>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstVendor = (ArrayList<Vendor>) session.queryForList("Vendor.listVendors");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!lstVendor.equals(null)) {
			return lstVendor;
		} else {
			return lstVendor;
		}
		
	}
	public String deleteVendor(Vendor vendor) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Vendor.deleteVendor",  vendor);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String updateVendor(Vendor vendor) {
		String result = "fail";
		//System.out.println("in to update Vendor");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Vendor.updateVendor", vendor);
			result = "success";
			//System.out.println("in to update vendorDAO result"+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<Vendor> getVendorsByMobileNo(String sMobile,String clientId) {
		ArrayList<Vendor> lstVendors = new ArrayList<Vendor>();
		//System.out.println("in to VendorDAO "+sMobile);
		try {
			 /*SqlMapClient session = new IbatisFactory().getSession();
			 Map<String,String> param = new HashMap<>();
			 param.put("clientId", clientId);
			 param.put("mobile", sMobile);
			 System.out.println("param-----"+param);
			 lstVendors = (ArrayList<Vendor>) session.queryForList("Vendor.getVendorsByMobileNo",param);
			 System.out.println("in to get vendor by mobile number "+lstVendors);*/
			// System.out.println("in to getUsersByMobileNo      "+lstPurchasers.get(0).getMobileNo());
			 SqlMapClient session = new IbatisFactory().getSession();
			 Map<String,String> param = new HashMap<>();
			 param.put("clientId", clientId);
			 param.put("mobile", sMobile);
			 lstVendors = (ArrayList<Vendor>) session.queryForList("Vendor.getVendorsByMobileNo",param);
			// System.out.println("in to getUsersByMobileNo "+lstVendors);
			 //System.out.println("in to getUsersByMobileNo      "+lstUsers.get(0).getMobile());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstVendors;
}
}

