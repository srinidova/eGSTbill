package com.eBilling.service;

import java.util.List;

import com.eBilling.model.StockDetails;

public interface StockDetailsService {

	boolean saveStockDetails(StockDetails stockDetails);

	boolean updateStockDetails(StockDetails stockDetails);

	List<StockDetails> getStockDetailsByProductId(String sProductId);



	

	
}
