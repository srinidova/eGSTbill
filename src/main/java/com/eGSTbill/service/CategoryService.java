package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.CategoryDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.model.Category;
import com.eGSTbill.model.Product;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CategoryService {

	public String addProduct(Product newProduct) {
		ProductDAO dao = new ProductDAO();
		return dao.addProduct(newProduct);
	}
	
	public String saveCategory(Category category){
		
		CategoryDAO CategoryDAO = new CategoryDAO();
		
		return CategoryDAO.saveCategory(category);
		
	}

	public String listProducts() {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<Product> lstProducts = null;
		ProductDAO dao = new ProductDAO();

		lstProducts = dao.listProducts();
		if (lstProducts == null || lstProducts.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstProducts);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}
	
	public String listCategory(){
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<Category> lstCategorys = null;
		CategoryDAO categoryDAO = new CategoryDAO();
		lstCategorys = categoryDAO.listCategory();
		if (lstCategorys == null || lstCategorys.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstCategorys);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}

	public String deleteProduct(Product newProduct) {
		ProductDAO dao = new ProductDAO();
		return dao.deleteProduct(newProduct);
	}
	public String deleteCategory(Category category){
		CategoryDAO dao = new CategoryDAO();
		return dao.deleteCategory(category);
	}

	public boolean getProductByName(String sProductName) {
		boolean bProductExist = false;
		ArrayList<Product> lstProducts = null;
		ProductDAO dao = new ProductDAO();
		lstProducts = dao.getProductByName(sProductName);
		if (lstProducts == null || lstProducts.size() > 0) {
			bProductExist = true;
		}
		return bProductExist;
	}

	public boolean checkProductByName(String sProductName, String sProductId) {
		boolean bProductExist = false;
		ArrayList<Product> lstProducts = null;
		ProductDAO dao = new ProductDAO();
		lstProducts = dao.getProductByName(sProductName);
		if (lstProducts == null || lstProducts.size() > 0) {
			for(Product product : lstProducts){
				String sProdIdExst = product.getProductId();
				String sProdNameExst = product.getProductName();
					if(!StringUtils.equals(sProductId, sProdIdExst)){
						bProductExist = true;
						break;
					}
				
			}
		}
		return bProductExist;
	}
	
	public String updateProduct(Product newProduct) {
		ProductDAO dao = new ProductDAO();
		return dao.updateProduct(newProduct);
	}
	
	public String updateCategory(Category category){
		CategoryDAO dao = new CategoryDAO();
		return dao.updateCategory(category);
		
	}
}
