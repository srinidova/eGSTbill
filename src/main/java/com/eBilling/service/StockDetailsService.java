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


	boolean addStockDetails(String sProductId, String sBilledQty, String sBillId, String sTransactionTpye);



	

	
}
