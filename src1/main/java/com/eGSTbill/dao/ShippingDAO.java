package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.PurchaserShipping;
import com.eGSTbill.model.Shipping;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ShippingDAO {

	public String addShipping(Shipping shipping) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Shipping.addShipping", shipping);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
	
	@SuppressWarnings("unchecked")
	public ArrayList<Shipping> listShipping(){
		ArrayList<Shipping> lstShipping = new ArrayList<Shipping>();
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			lstShipping = (ArrayList<Shipping>) session.queryForList("Shipping.listShipping");
		}catch(Exception e){
			e.printStackTrace();
		}
		if (!lstShipping.equals(null)) {
			return lstShipping;
		} else {
			return lstShipping;
		}
	}

	public String deleteShipping(Shipping shipping) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Shipping.deleteShipping", shipping);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	public String updateShipping(Shipping shipping) {
		String result = "fail";
		System.out.println("in to update Shipping");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Shipping.updateShipping", shipping);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
}
