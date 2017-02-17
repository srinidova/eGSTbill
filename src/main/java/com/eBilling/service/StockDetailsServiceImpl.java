package com.eBilling.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.dao.StockDetailsDao;
import com.eBilling.model.ProductStock;
import com.eBilling.model.StockDetails;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class StockDetailsServiceImpl implements StockDetailsService{
	
	@Autowired
	StockDetailsDao stockDetailsDao;
	@Autowired
	BillingDetatilsCartService objBillingDetatilsCartService;
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
	 @Override
		public boolean addStockDetails(String sProductId, String sBilledQty, String sBillId, String sTransactionTpye,String sNewStock,String sOldStock) {
			boolean isAdd = false;
			 StockDetails stockDetails =null;
			try {
				
				
				stockDetails =new StockDetails();
				stockDetails.setStockDetailsId(CommonUtils.getAutoGenId());
				stockDetails.setProductId(sProductId);
				stockDetails.setQuantity(sBilledQty);
				stockDetails.setTransactionId(sBillId);
				stockDetails.setTransactionDate(CommonUtils.getDate());
				stockDetails.setTransactionType(sTransactionTpye);
				stockDetails.setNewQuantity(sNewStock);
				stockDetails.setOldQuantity(sOldStock);
				boolean isInsert = stockDetailsDao.saveStockDetails(stockDetails);
				if(isInsert){
					isAdd =true;
				}
				
			}catch(Exception e){
				objLogger.error("Exception in ProductStockServiceImpl in addStockDetails() "+e);
				e.printStackTrace();
			}finally{
				
			}
			return isAdd;
		}
	 
	 @Override
		public List<StockDetails> getProductStockDetailsByProductId(String sProductId) {
			ObjectMapper objectMapper = null;
			String sJson = null;
			List<StockDetails> productStockDetails = null;
			try {
				productStockDetails = stockDetailsDao.getProductStockDetailsByProductId(sProductId);
				
			} catch (Exception e) {
				//objLogger.info("Exception in getAllProductStockByProductId()" + e);
				System.out.println("Exception in getAllProductStockByProductId()");
			}
			return productStockDetails;
		}
	 @Override
		public boolean addSaveStockDetails(String sBillId,ProductStock oStock) {
			boolean isAdd = false;
			 StockDetails stockDetails =null;
			 List<BillingDetailsCart> listBillingDetails = null;
			try {
					listBillingDetails = objBillingDetatilsCartService.getAllbillDeteailsCart(sBillId);
					for(BillingDetailsCart billingdetailsC :listBillingDetails){
						List<StockDetails> lstStockDeatails =getStockDetailsByProductId(billingdetailsC.getProductId());
						stockDetails=lstStockDeatails.get(0);
						
						  String sNewStock=oStock.getNewStock();
						  String sOldStock = oStock.getOldStock();
						
					String sSale="Cart";
					stockDetails.setQuantity( billingdetailsC.getQuantity());
					stockDetails.setTransactionId(sBillId);
					stockDetails.setTransactionType(sSale);
					stockDetails.setTransactionDate(CommonUtils.getDate());
					stockDetails.setStockDetailsId(CommonUtils.getAutoGenId());
					stockDetails.setProductId(billingdetailsC.getProductId());
					stockDetails.setNewQuantity(sNewStock);
					stockDetails.setOldQuantity(sOldStock);
					
					boolean isInsert = stockDetailsDao.saveStockDetails(stockDetails);
					
					}
				
			}catch(Exception e){
				objLogger.error("Exception in ProductStockServiceImpl in addStockDetails() "+e);
				e.printStackTrace();
			}finally{
				
			}
			return isAdd;
		}

}
