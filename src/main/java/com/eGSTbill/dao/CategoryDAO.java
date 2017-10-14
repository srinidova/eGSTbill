package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.Category;
import com.eGSTbill.model.Product;
import com.ibatis.sqlmap.client.SqlMapClient;

public class CategoryDAO {

	public String saveCategory(Category category) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Category.saveCategory", category);
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

	@SuppressWarnings("unchecked")
	public ArrayList<Category> listCategory(){
		ArrayList<Category> lstCategorys = new ArrayList<Category>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstCategorys = (ArrayList<Category>) session.queryForList("Category.listCategorys");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!lstCategorys.equals(null)) {
			return lstCategorys;
		} else {
			return lstCategorys;
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
	public String deleteCategory(Category category){
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Category.deleteCategory", category);
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
	public String updateCategory(Category category){
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Category.updateCategory", category);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
}
