package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.dao.StatusDao;
import com.eBilling.model.Status;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class StatusServiceImpl implements StatusService
{
	
	@Autowired
	StatusDao statusDao;
	//ProductDao productDao;
	private Logger objLogger = Logger.getLogger(StatusServiceImpl.class);
	@Override
	public String populateStatus() {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Status> lstStatus = null;
		try {
			lstStatus = statusDao.getAllStatus();
			if (lstStatus != null && lstStatus.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstStatus);
			}
		} catch (Exception e) {
			objLogger.info("Exception in ProductPopulateServiceImpl in populateProducts()" + e);
			System.out.println("Exception in Product Controller in  getAllProducts()");
		}
		return sJson;
	}
	@Override
	public boolean statusSave(Status status) {
		boolean isSave = false;
		try {
			isSave = statusDao.statusSave(status);
			//isSave = productDao.productSave(product);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
			
		}finally{
			
		}
		return isSave;
	}
	
	@Override
	public boolean updateStatus(Status status) {
		boolean isSave = false;
		try {
			isSave = statusDao.updateStatus(status);
			//isSave = productDao.updateProduct(product);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
		}finally{
			
		}
		return isSave;
	}
	@Override
	public List<Status> getStatusByName(String sStatus) {
		List<Status> getByName = null;
		try {
			getByName = statusDao.getStatusByName(sStatus);
			//getByName = productDao.getProductByName(sProductName);
		}catch(Exception e){
			objLogger.error("Exception in StatusServiceImpl in getAllbillDeteailsCart() "+e);
		}finally{
			
		}
		return getByName;
	}
	
	@Override
	public boolean deleteStatus(String sStatusId) {
		boolean isDelete = true;
		try {
			isDelete = statusDao.deleteStatus(sStatusId);
			//isDelete = productDao.deleteProduct(sProductId);
		} catch (Exception e) {
			objLogger.error(e.getMessage());
			isDelete = false;
			objLogger.fatal("error in deleteCategory in category service");
		}
		return isDelete;
	}
	
	

}
