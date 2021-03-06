package com.eGSTbill.dao;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.BillCart;
import com.eGSTbill.model.BillDetailsCart;
import com.eGSTbill.model.Product;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.fasterxml.jackson.databind.ObjectMapper;

public class BillCartDAO {

	public String addBillCart(BillCart billCart) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("BillCart.addBillCart", billCart);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<BillCart> listBillCart() {
		ArrayList<BillCart> lstBillCart = new ArrayList<BillCart>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstBillCart = (ArrayList<BillCart>) session.queryForList("BillCart.listBillCart");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!lstBillCart.equals(null)) {
			return lstBillCart;
		} else {
			return lstBillCart;
		}
	}

	public String deleteBillCart(BillCart billCart) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("BillCart.deleteBillCart", billCart);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<BillCart> getBillCart(BillCart billCart) {
		ArrayList<BillCart> lstBillCart = new ArrayList<BillCart>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstBillCart = (ArrayList<BillCart>) session.queryForList("BillCart.getBillCart", billCart);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstBillCart;
	}

	public String updateBillCart(BillCart billCart) {
		String result = "fail";
		////System.out.println("in to update BillCart");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("BillCart.updateBillCart", billCart);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<BillCart> listBillCartByBillId(String sBillId) {
		ArrayList<BillCart> lstBillCart = new ArrayList<BillCart>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstBillCart = (ArrayList<BillCart>) session.queryForList("BillCart.listBillCartByBillId", sBillId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!lstBillCart.equals(null)) {
			return lstBillCart;
		} else {
			return lstBillCart;
		}
	}
	@SuppressWarnings("unchecked")
	public String  searchUnBilled(BillCart billCart) {
		ArrayList<BillCart> billcart = new ArrayList<BillCart>();
		boolean bAnd = false;
		String sQuery = null;
		ObjectMapper objectMapper=null;
		String sJson = null;
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			
			String sBillno = billCart.getBillNo();
			
			//System.out.println("in to searchUnBilled sBillno-------------"+sBillno);
			
			

			billcart = (ArrayList<BillCart>) session.queryForList("BillCart.searchUnBilled", billCart);
			//System.out.println("billcart     "+billcart);
			if (billcart == null || billcart.size() > 0) {
				objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(billcart);
					
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return sJson;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<BillCart> generateBill(String sBillId) {
		ArrayList<BillCart> lstBillCart = new ArrayList<BillCart>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstBillCart = (ArrayList<BillCart>) session.queryForList("BillCart.generateBill", StringUtils.trim(sBillId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!lstBillCart.equals(null)) {
			return lstBillCart;
		} else {
			return lstBillCart;
		}
	}
}
