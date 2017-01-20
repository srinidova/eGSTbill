/**
 * 
 */
package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.baseDao.BillingInfoBaseDao;
import com.eBilling.baseModel.BillingInfo;
import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.dao.BillingInfoDao;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author srinu
 *
 */

@Service
public class BillingInfoServiceImpl implements BillingInfoService {
	@Autowired
	BillingInfoBaseDao objBillingInfoBaseDao;
	Logger objLogger = Logger.getLogger(BillingInfoServiceImpl.class);
	@Autowired
	BillingInfoDao billingInfoDao;
	
	@Override
	public String saveBillInfo(BillingInfo billingInfo) {
		String isSave = null;
		try {
			isSave = billingInfoDao.saveBillInfo1(billingInfo);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl inupdateBillInfo() "+e);
		}finally{
			
		}
		return isSave;
	}
	@Override
	public String SearchBillInfo(BillingInfo billingInfo) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingInfo> lstBillingInfo = null;
		try {
			lstBillingInfo = billingInfoDao.searchBillInfo(billingInfo);
			if (lstBillingInfo != null && lstBillingInfo.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstBillingInfo);
			}
		} catch (Exception e) {
			objLogger.info("Exception in ProductPopulateServiceImpl in populateProducts()" + e);
			System.out.println("Exception in Product Controller in  getAllProducts()");
		}
		return sJson;
	}
	@Override
	public String getAllBillInfo(BillingInfo billingInfo) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingInfo> lstBillingInfo = null;
		try {
			lstBillingInfo = billingInfoDao.getAllBillInfo(billingInfo);
			System.out.println("lstBillingInfo==="+lstBillingInfo);
			if (lstBillingInfo != null && lstBillingInfo.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstBillingInfo);
			}
		} catch (Exception e) {
			objLogger.info("Exception in ProductPopulateServiceImpl in populateProducts()" + e);
			System.out.println("Exception in Product Controller in  getAllProducts()");
		}
		return sJson;
	}
	
	@Override
	public List<BillingInfo> getAllBillInfoByBillNo(BillingInfo billingInfo) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingInfo> lstBillingInfo = null;
		try {
			lstBillingInfo = billingInfoDao.getAllBillInfoByBillNo(billingInfo);
		} catch (Exception e) {
			objLogger.info("Exception in getAllBillInfoByBillNo()" + e);
			System.out.println("Exception in getAllBillInfoByBillNo()");
		}
		return lstBillingInfo;
	}
	

}
