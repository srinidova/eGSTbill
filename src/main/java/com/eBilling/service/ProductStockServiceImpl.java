package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.dao.BillingDetailsCartDao;
import com.eBilling.dao.ProductStockDao;
import com.eBilling.model.ProductStock;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class ProductStockServiceImpl implements ProductStockService{
	
	@Autowired
	ProductStockDao productStockDao;
	@Autowired
	BillingDetailsCartDao billingDetailsCartDao;
	private Logger objLogger = Logger.getLogger(ProductStockServiceImpl.class);
	
	@Override
	public boolean saveProductStock(ProductStock objProductStock) {
		boolean isSave = false;
		try {
			isSave = productStockDao.saveProductStock(objProductStock);
		}catch(Exception e){
			objLogger.error("Exception in ProductStockServiceImpl in saveProductStock() "+e);
			
		}finally{
			
		}
		return isSave;
	}
	@Override
	public boolean updateProductStock(ProductStock objProductStock) {
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
	public boolean updateStock(ProductStock productStock,BillingDetailsCart billingdetailsCart,List<ProductStock> lstProductstock,JSONObject data) {
		boolean isUpdate = false;
		 String sProductId ="";
		try {
			
			sProductId = data.getString("productId");
			lstProductstock = productStockDao.getAllProductStockByProductId(sProductId);
			for(int i=0;i<lstProductstock.size();i++){
				productStock=lstProductstock.get(i);
				
			}
			int sNewStock = Math.abs(Integer.parseInt(productStock.getStock()) - Integer.parseInt( data.getString("quantity")));
			 productStock.setStock(String.valueOf(sNewStock));
			 productStockDao.updateProductStock(productStock);
		}catch(Exception e){
			objLogger.error("Exception in ProductStockServiceImpl in updateProductStock() "+e);
			e.printStackTrace();
		}finally{
			
		}
		return isUpdate;
	}
	@Override
	public boolean updatingStock(ProductStock productStock,BillingDetailsCart billingdetailsCart,List<ProductStock> lstProductstock,JSONObject data) {
		boolean isUpdate = false;
		 String sProductId ="";
		 BillingDetailsCart existBillingDetailsCart =null;
		 List<BillingDetailsCart> listBillingDetails =null;
		try {
			
			sProductId = data.getString("productId");
			lstProductstock = productStockDao.getAllProductStockByProductId(sProductId);
			for(int i=0;i<lstProductstock.size();i++){
				productStock=lstProductstock.get(i);
				
			}
			listBillingDetails = billingDetailsCartDao.getAllBillDetailsByProductId(sProductId);
			for(int i=0;i<listBillingDetails.size();i++){
				existBillingDetailsCart=listBillingDetails.get(i);
				
			}if(existBillingDetailsCart.getProductId().equals(sProductId)){
				int stock =Math.abs(Integer.parseInt(existBillingDetailsCart.getQuantity())-Integer.parseInt(data.getString("quantity")));
				int sNewStock = Math.abs(Integer.parseInt(productStock.getStock()) - Integer.parseInt( String.valueOf(stock)));
				 productStock.setStock(String.valueOf(sNewStock));
				 productStockDao.updateProductStock(productStock);
			}
			
			
		}catch(Exception e){
			objLogger.error("Exception in ProductStockServiceImpl in updateProductStock() "+e);
			e.printStackTrace();
		}finally{
			
		}
		return isUpdate;
	}
	@Override
	public boolean updatedStock(ProductStock productStock,BillingDetailsCart billingdetailsCart,List<ProductStock> lstProductstock,JSONObject data) {
		boolean isUpdate = false;
		 String sProductId ="";
		try {
			
			sProductId = data.getString("productId");
			lstProductstock = productStockDao.getAllProductStockByProductId(sProductId);
			for(int i=0;i<lstProductstock.size();i++){
				productStock=lstProductstock.get(i);
				
			}
					int sNewStock = Math.abs(Integer.parseInt(productStock.getStock()) + Integer.parseInt(  data.getString("quantity")));
					System.out.println("sNewStock::::"+sNewStock);
					 productStock.setStock(String.valueOf(sNewStock));
			 productStockDao.updateProductStock(productStock);
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
	

}
