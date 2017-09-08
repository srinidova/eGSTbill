package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.BillDetailsCart;
import com.eGSTbill.model.Product;
import com.ibatis.sqlmap.client.SqlMapClient;

public class BillDetailsCartDAO {

	public String addBillDetailsCart(BillDetailsCart billDetailsCart) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("BillDetailsCart.addBillDetailsCart", billDetailsCart);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<BillDetailsCart> listBillDetailsCart() {
		ArrayList<BillDetailsCart> lstBillDetailsCart = new ArrayList<BillDetailsCart>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstBillDetailsCart = (ArrayList<BillDetailsCart>) session.queryForList("BillDetailsCart.listBillDetailsCart");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!lstBillDetailsCart.equals(null)) {
			return lstBillDetailsCart;
		} else {
			return lstBillDetailsCart;
		}
	}

	public String deleteBillDetailsCart(BillDetailsCart billDetailsCart) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("BillDetailsCart.deleteBillDetailsCart", billDetailsCart);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<BillDetailsCart> getBillDetailsCartByProductName(String sProductName) {
		ArrayList<BillDetailsCart> lstBillDetailsCarts = new ArrayList<BillDetailsCart>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstBillDetailsCarts = (ArrayList<BillDetailsCart>) session.queryForList("BillDetailsCart.getBillDetailsCartByProductName", sProductName);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstBillDetailsCarts;
	}

	public String updateBillDetailsCart(BillDetailsCart billDetailsCart) {
		String result = "fail";
		System.out.println("in to update BillDetailsCart");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("BillDetailsCart.updateBillDetailsCart", billDetailsCart);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<BillDetailsCart> getBillDetailsCartByBillId(String sBillId) {
		ArrayList<BillDetailsCart> lstBillDetailsCarts = new ArrayList<BillDetailsCart>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstBillDetailsCarts = (ArrayList<BillDetailsCart>) session.queryForList("BillDetailsCart.getBillDetailsCartByBillId", sBillId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstBillDetailsCarts;
	}
	
}
