package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.State;
import com.ibatis.sqlmap.client.SqlMapClient;

public class StateDAO {

	/*public String getAllStates(State state) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("State.getAllStates", state);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}*/

	@SuppressWarnings("unchecked")
	public ArrayList<State> getAllStates() {
		ArrayList<State> lstStates = new ArrayList<State>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstStates = (ArrayList<State>) session.queryForList("State.getAllStates");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!lstStates.equals(null)) {
			return lstStates;
		} else {
			return lstStates;
		}
	}

	/*public String deleteProduct(Product newProduct) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Product.deleteProduct", newProduct);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Product> getProductByName(String sProductName) {
		ArrayList<Product> lstProducts = new ArrayList<Product>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstProducts = (ArrayList<Product>) session.queryForList("Product.getProductByName", sProductName);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstProducts;
	}

	public String updateProduct(Product newProduct) {
		String result = "fail";
		System.out.println("in to update product");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Product.updateProduct", newProduct);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}*/
}
