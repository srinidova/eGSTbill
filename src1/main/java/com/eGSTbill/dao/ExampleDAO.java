package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.Product;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ExampleDAO {

	public String addProduct(Product newProduct) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Product.addProduct", newProduct);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Product> listProducts() {
		ArrayList<Product> lstProducts = new ArrayList<Product>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstProducts = (ArrayList<Product>) session.queryForList("Product.listProducts");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!lstProducts.equals(null)) {
			return lstProducts;
		} else {
			return lstProducts;
		}
	}

	public String deleteProduct(Product newProduct) {
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
	}
}
