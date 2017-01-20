package com.eBilling.service;

import java.util.List;

import com.eBilling.model.Product;


public interface ProductPopulateService {
	public String populateProducts() ;

	boolean deleteProduct(String sProductId);

	boolean productSave(Product product);

	boolean updateProduct(Product product);

	List<Product> getProductByName(String sProductName);
}
