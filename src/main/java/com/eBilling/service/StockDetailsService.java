package com.eBilling.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.eBilling.model.ProductStock;
import com.eBilling.model.StockDetails;

public interface StockDetailsService {

	boolean saveStockDetails(StockDetails stockDetails);

	boolean updateStockDetails(StockDetails stockDetails);

	List<StockDetails> getStockDetailsByProductId(String sProductId);


	//boolean addStockDetails(String sProductId, String sBilledQty, String sBillId, String sTransactionTpye);

	List<StockDetails> getProductStockDetailsByProductId(String sProductId);

	boolean addSaveStockDetails(String sBillId,ProductStock oStock);


	boolean addStockDetails(String sProductId, String sBilledQty, String sBillId, String sTransactionTpye,
			String sNewStock, String sOldStock);



	

	
}
