package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.dao.ProductStockDao;
import com.eBilling.dao.StockDetailsDao;
import com.eBilling.model.ProductStock;
import com.eBilling.model.StockDetails;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class StockDetailsServiceImpl implements StockDetailsService{
	
	@Autowired
	StockDetailsDao stockDetailsDao;
	private Logger objLogger = Logger.getLogger(StockDetailsServiceImpl.class);
	
	@Override
	public boolean saveStockDetails(StockDetails stockDetails) {
		boolean isSave = false;
		try {
			isSave = stockDetailsDao.saveStockDetails(stockDetails);
		}catch(Exception e){
			objLogger.error("Exception in StockDetailsServiceImpl in saveStockDetails() "+e);
			
		}finally{
			
		}
		return isSave;
	}
	 @Override
	public boolean updateStockDetails(StockDetails stockDetails) {
		boolean isUpdate = false;
		try {
			isUpdate = stockDetailsDao.updateStockDetails(stockDetails);
		}catch(Exception e){
			objLogger.error("Exception in ProductStockServiceImpl in updateProductStock() "+e);
			e.printStackTrace();
		}finally{
			
		}
		return isUpdate;
	}
	 @Override
		public List<StockDetails> getStockDetailsByProductId(String sProductId) {
			ObjectMapper objectMapper = null;
			String sJson = null;
			List<StockDetails> lstStockDetails = null;
			try {
				lstStockDetails = stockDetailsDao.getStockDetailsByProductId(sProductId);
				
			} catch (Exception e) {
				//objLogger.info("Exception in getAllProductStockByProductId()" + e);
				System.out.println("Exception in getAllProductStockByProductId()");
			}
			return lstStockDetails;
		}
/*	@Override
	public boolean updateNewProductStock(ProductStock objProductStock) {
		boolean isUpdate = false;
		try {
			isUpdate = productStockDao.updateProductStock(objProductStock);
		}catch(Exception e){
			objLogger.error("Exception in ProductStockServiceImpl in updateProductStock() "+e);
			e.printStackTrace();
		}finally{
			
		}
		return isUpdate;
	}
	@Override
	public boolean deleteProductStock(String id) {
		boolean isDelete = true;
		try {
			isDelete = productStockDao.deleteProductStock(id);
		} catch (Exception e) {
			objLogger.error(e.getMessage());
			isDelete = false;
			objLogger.fatal("error in ProductStockServiceImpl in deleteProductStock()");
		}
		return isDelete;
	}
	@Override
	public String getAllProductStock() {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<ProductStock> lstRegisterModel = null;
		try {
			lstRegisterModel = productStockDao.getAllProductStock();
			if (lstRegisterModel != null && lstRegisterModel.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstRegisterModel);
			}
		} catch (Exception e) {
			objLogger.info("Exception in RegistrationServiceImpl in populateProducts()" + e);
			//System.out.println("Exception in Register Controller in  getAllProducts()");
		}
		return sJson;
	}
	@Override
	public List<ProductStock> getAllProductStockByProductId(String sProductId) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<ProductStock> productStocks = null;
		try {
			productStocks = productStockDao.getAllProductStockByProductId(sProductId);
			
		} catch (Exception e) {
			//objLogger.info("Exception in getAllProductStockByProductId()" + e);
			System.out.println("Exception in getAllProductStockByProductId()");
		}
		return productStocks;
	}
	@Override
	public List<BillingDetailsCart> updateProductStock(BillingDetailsCart billingdetailsCart,
			List<BillingDetailsCart> listBillingDetails) {
		String sNewProductId = null;
		try {
			sNewProductId = billingdetailsCart.getProductId();
			lstProductstock = productStockService.getAllProductStockByProductId(sProductId);
			for (int i = 0; i < listBillingDetails.size(); i++) {
				
				BillingDetailsCart existBillingDetailsCart = listBillingDetails.get(i);
				if (existBillingDetailsCart.getProductId().equals(sNewProductId)) {
					//System.out.println("in----------updateProductQuantity---------------sNewProductId=="+sNewProductId+"--------------existBillingDetailsCart.getProductId()==="+existBillingDetailsCart.getProductId());
					int existQty = Integer.parseInt(existBillingDetailsCart.getQuantity());
					int newQty = Integer.parseInt(billingdetailsCart.getQuantity());
					int existAmount = Integer.parseInt(existBillingDetailsCart.getAmount());
					int newAmount = Integer.parseInt(billingdetailsCart.getAmount());
					//System.out.println("existQty=="+existQty+"--------------newQty==="+newQty);
					existBillingDetailsCart.setQuantity(String.valueOf(existQty + newQty));
					existBillingDetailsCart.setAmount(String.valueOf(existAmount + newAmount));
					break;
				}

			}

		} catch (Exception e) {

			System.out.println("Exception in updateProductQuantity in  calculateTotal()");
		}
		return listBillingDetails;
	}*/

}
