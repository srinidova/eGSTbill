package com.eBilling.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.model.ProductStock;


public interface ProductStockService {



	boolean saveProductStock(ProductStock objProductStock);

	boolean updateProductStock(ProductStock objProductStock);

	boolean deleteProductStock(String id);

	String getAllProductStock();

	List<ProductStock> getAllProductStockByProductId(String sProductId);


	boolean updatedStock(String sBillId,HttpSession objSession);

	/*boolean updateStock(ProductStock productStock, BillingDetailsCart billingdetailsCart,
			List<ProductStock> lstProductstock, JSONObject data);*/


	boolean updatingStock(ProductStock productStock, BillingDetailsCart billingdetailsCart,
			List<ProductStock> lstProductstock, JSONObject data);

	Boolean checkStock(String sProductId, String sBilledQty);


	boolean addStock(ProductStock productStock);

	boolean updateProductStock(String sProductId, String sBilledQty,HttpSession objSession);

	//boolean deductStock(String sProductId, String sBilledQty);

	boolean deductProductStock(String sProductId, String sBilledQty);

	boolean deductStock(String sProductId, String sBilledQty, HttpSession objSession);

	boolean addNewStock(ProductStock productStock);

	boolean deductedStock(String sProductId, String sBilledQty, HttpSession objSession);

	//boolean updateStock(ProductStock productStock);

	
}
