/**
 * 
 */
package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.baseDao.PurchaseInfoBaseDao;
import com.eBilling.baseModel.PurchaserInfo;
import com.eBilling.model.Register;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author srinu
 *
 */
@Service
public class PurchaseInfoServiceImpl implements PurchaseInfoService{
	private Logger logger = Logger.getLogger(PurchaseInfoServiceImpl.class);
	@Autowired
	PurchaseInfoBaseDao purchaseInfoBaseDao;
	@Override
	public List<PurchaserInfo> getAllPurchaseInfo() {
		List<PurchaserInfo> listPurchase = null;
		try{
			listPurchase = purchaseInfoBaseDao.getAllPurchaseInfo();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return listPurchase;
	}
	public boolean savePurchaseInfo(PurchaserInfo purchaserInfo) {
		boolean isSave = false;
		try {
			isSave = purchaseInfoBaseDao.savePurchaseInfo(purchaserInfo);
		}catch(Exception e){
			logger.error("Exception in PurchaseInfoServiceImpl in savePurchaseInfo() "+e);
			//System.out.println("Exception in BillingDetatilsCartServiceImpl in savePurchaseInfo() "+e);
		}finally{
			
		}
		return isSave;
}
	@Override
	public boolean updatePurchaseInfo(PurchaserInfo purchaserInfo) {
		boolean isSave = false;
		try {
			isSave = purchaseInfoBaseDao.updatePurchaseInfo(purchaserInfo);
		}catch(Exception e){
			logger.error("Exception in PurchaseInfoServiceImpl in updatePurchaseInfo() "+e);
			//System.out.println("Exception in BillingDetatilsCartServiceImpl in updatePurchaseInfo() "+e);
		}finally{
			
		}
		return isSave;
}
	@Override
	public boolean deletePurchaseInfo(String id) {
		boolean isDelete = true;
		try {
			isDelete = purchaseInfoBaseDao.deletePurchaseInfo(id);
		} catch (Exception e) {
			logger.error(e.getMessage());
			isDelete = false;
			logger.fatal("error in deleteCategory in PurchaseInfoServiceImpl service");
		}
		return isDelete;
	}
	@Override
	public List<PurchaserInfo> getPurchaseByName(String sPurchaseName) {
		List<PurchaserInfo> getByName = null;
		try {
			getByName = purchaseInfoBaseDao.getPurchaseByName(sPurchaseName);
		}catch(Exception e){
			logger.error("Exception in PurchaseInfoServiceImpl in getAllbillDeteailsCart() "+e);
		}finally{
			
		}
		return getByName;
	}
	@Override
	public List<PurchaserInfo> checkEmailAndMobileNo(String sEmail, String sMobileNo) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<PurchaserInfo> lstRegister = null;
		try {
			lstRegister = purchaseInfoBaseDao.checkEmailAndMobileNo(sEmail,sMobileNo);
		} catch (Exception e) {
			logger.info("Exception in getAllBillInfoByBillNo()" + e);
			System.out.println("Exception in getAllBillInfoByBillNo()"+e);
		}
		return lstRegister;
	}
	@Override
	public boolean addPurchaseInfo(JSONObject data) {
		boolean isSave = false;
		List<PurchaserInfo> lstPurchaseName=null;
		PurchaserInfo purchaserInfo =null;
		try {
			 String sPurchaserName=data.getString("purchaserName");
			 System.out.println("sName==="+sPurchaserName);
			if(sPurchaserName != ""){
				//String emailOrMobileNO = data.getString("eMail") + "" + data.getString("phone");
				String sEmail = data.getString("eMail");
				String sMobileNo= data.getString("phone");
				lstPurchaseName = checkEmailAndMobileNo( sEmail,sMobileNo);
				
				if(lstPurchaseName == null || lstPurchaseName.size() == 0){
					purchaserInfo =new PurchaserInfo();
					purchaserInfo.setName(sPurchaserName);
					purchaserInfo.setAddress(data.getString("address"));
					purchaserInfo.seteMail(data.getString("eMail"));
					purchaserInfo.setMobileNo(data.getString("phone"));
					purchaserInfo.setMobileNo(data.getString("tinNo"));
					purchaserInfo.setUpdatedBy(CommonUtils.getDate());
					purchaserInfo.setUpdatedDate(CommonUtils.getDate());
					purchaserInfo.setPurchaseId(CommonUtils.getAutoGenId());
					
					
					     savePurchaseInfo(purchaserInfo);
					     isSave =true;
				}
			}
		}catch(Exception e){
			logger.error("Exception in PurchaseInfoServiceImpl in addPurchaseInfo() "+e);
			//System.out.println("Exception in BillingDetatilsCartServiceImpl in savePurchaseInfo() "+e);
		}finally{
			
		}
		return isSave;
}	
	
	
}
