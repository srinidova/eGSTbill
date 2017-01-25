package com.eBilling.service;

import java.util.List;

import org.json.JSONObject;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.model.ProductStock;
import com.eBilling.model.StockDetails;

public interface StockDetailsService {

	boolean saveStockDetails(StockDetails stockDetails);

	boolean updateStockDetails(StockDetails stockDetails);

	List<StockDetails> getStockDetailsByProductId(String sProductId);


	boolean updatedStockDetails(ProductStock productStock, BillingDetailsCart billingdetailsCart,
			List<ProductStock> lstProductstock, JSONObject data);



	

	
}
