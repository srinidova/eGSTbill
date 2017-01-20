package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.dao.ProductDao;
import com.eBilling.model.Product;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class ProductPopulateServiceImpl implements ProductPopulateService{
	
	@Autowired
	ProductDao productDao;
	private Logger objLogger = Logger.getLogger(ProductPopulateServiceImpl.class);
	@Override
	public String populateProducts() {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Product> lstProductModel = null;
		try {
			lstProductModel = productDao.getAllProduct();
			if (lstProductModel != null && lstProductModel.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstProductModel);
			}
		} catch (Exception e) {
			objLogger.info("Exception in ProductPopulateServiceImpl in populateProducts()" + e);
			System.out.println("Exception in Product Controller in  getAllProducts()");
		}
		return sJson;
	}
	@Override
	public boolean productSave(Product product) {
		boolean isSave = false;
		try {
			isSave = productDao.productSave(product);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
			
		}finally{
			
		}
		return isSave;
	}
	
	@Override
	public boolean updateProduct(Product product) {
		boolean isSave = false;
		try {
			isSave = productDao.updateProduct(product);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
		}finally{
			
		}
		return isSave;
	}
	@Override
	public List<Product> getProductByName(String sProductName) {
		List<Product> getByName = null;
		try {
			getByName = productDao.getProductByName(sProductName);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
		}finally{
			
		}
		return getByName;
	}
	
	@Override
	public boolean deleteProduct(String sProductId) {
		boolean isDelete = true;
		try {
			isDelete = productDao.deleteProduct(sProductId);
		} catch (Exception e) {
			objLogger.error(e.getMessage());
			isDelete = false;
			objLogger.fatal("error in deleteCategory in category service");
		}
		return isDelete;
	}

}
