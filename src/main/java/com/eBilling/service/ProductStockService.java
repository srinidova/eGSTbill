package com.eBilling.service;

import java.util.List;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.model.ProductStock;


public interface ProductStockService {



	boolean saveProductStock(ProductStock objProductStock);

	boolean updateProductStock(ProductStock objProductStock);

	boolean deleteProductStock(String id);

	String getAllProductStock();

	List<ProductStock> getAllProductStockByProductId(String sProductId);

	
}
