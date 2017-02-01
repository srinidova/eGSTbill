package com.eBilling.service;

import java.util.List;

import org.json.JSONObject;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.model.ProductStock;


public interface ProductStockService {



	boolean saveProductStock(ProductStock objProductStock);

	boolean updateProductStock(ProductStock objProductStock);

	boolean deleteProductStock(String id);

	String getAllProductStock();

	List<ProductStock> getAllProductStockByProductId(String sProductId);


	boolean updatedStock(ProductStock productStock, BillingDetailsCart billingdetailsCart,
			List<ProductStock> lstProductstock, JSONObject data);

	/*boolean updateStock(ProductStock productStock, BillingDetailsCart billingdetailsCart,
			List<ProductStock> lstProductstock, JSONObject data);*/


	boolean updatingStock(ProductStock productStock, BillingDetailsCart billingdetailsCart,
			List<ProductStock> lstProductstock, JSONObject data);

	Boolean checkStock(String sProductId, String sBilledQty);

	boolean deductStock(String sProductId, String sBilledQty, String sBillId);

	boolean addStock(ProductStock productStock);

	boolean updateProductStock(String sProductId, String sBilledQty);

	//boolean updateStock(ProductStock productStock);

	
}
