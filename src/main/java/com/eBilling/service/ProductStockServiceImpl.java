package com.eBilling.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.dao.ProductDao;
import com.eBilling.dao.ProductStockDao;
import com.eBilling.model.ProductStock;
import com.eBilling.model.Product;
import com.eBilling.model.ProductStock;
import com.eBilling.model.ProductStock;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class ProductStockServiceImpl implements ProductStockService{
	
	@Autowired
	ProductStockDao productStockDao;
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
	/*@Override
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
	}*/
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
	/*@Override
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
