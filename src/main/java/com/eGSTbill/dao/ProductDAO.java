package com.eGSTbill.dao;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.ClientProduct;
import com.eGSTbill.model.ClientPurchaser;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Purchaser;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ProductDAO {

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
		////System.out.println("in to update product");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Product.updateProduct", newProduct);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Product> listProductsByClientId(String sClientId) {
		ArrayList<Product> lstProducts = new ArrayList<Product>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			ClientProduct cp = new ClientProduct();
			//////System.out.println("sClientId=="+sClientId);
			if (StringUtils.isNotEmpty(sClientId)) {
				cp.setClientId(sClientId);
			}
			lstProducts = (ArrayList<Product>) session.queryForList("Product.listProductsByClientId", cp);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstProducts;
	}
}
