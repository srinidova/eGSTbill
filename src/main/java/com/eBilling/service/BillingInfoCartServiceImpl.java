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
import com.eBilling.dao.BillingInfoCartDao;
import com.eBilling.dao.BillingInfoDao;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author srinu
 *
 */

@Service
public class BillingInfoCartServiceImpl implements BillingInfoCartService {
	@Autowired
	BillingInfoBaseDao objBillingInfoBaseDao;
	Logger objLogger = Logger.getLogger(BillingInfoCartServiceImpl.class);
	@Autowired
	BillingInfoDao billingInfoDao;
	@Autowired
	BillingInfoCartDao billingInfoCartDao;
	
	@Override
	public List<BillingInfoCart> getAllBillInfoCartByBillId(BillingInfoCart billingInfoCart) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingInfoCart> lstBillingInfoCart = null;
		try {
			lstBillingInfoCart = billingInfoCartDao.getAllBillInfoCartByBillId(billingInfoCart);
		} catch (Exception e) {
			objLogger.info("Exception in getAllBillInfoCartByBillId()" + e);
			System.out.println("Exception in getAllBillInfoCartByBillId()");
		}
		return lstBillingInfoCart;
	}
	@Override
	public List<BillingInfoCart> getAllBillInfoCartByNewBillId(String sNewbillId) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingInfoCart> lstBillingInfoCart = null;
		try {
			lstBillingInfoCart = billingInfoCartDao.getAllBillInfoCartByNewBillId(sNewbillId);
		} catch (Exception e) {
			objLogger.info("Exception in getAllBillInfoCartByNewBillId()" + e);
			System.out.println("Exception in getAllBillInfoCartByNewBillId()");
		}
		return lstBillingInfoCart;
	}
	@Override
	public boolean saveBillInfoCart(BillingInfoCart billingInfoCart) {
		boolean isSave = false;
		try {
			isSave = billingInfoCartDao.saveBillInfoCart(billingInfoCart);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl inupdateBillInfo() "+e);
		}finally{
			
		}
		return isSave;
	}
	
	@Override
	public boolean updateBillInfoCart(BillingInfoCart billingInfoCart) {
		boolean isSave = false;
		try {
			isSave = billingInfoCartDao.updateBillInfoCart(billingInfoCart);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl inupdateBillInfo() "+e);
		}finally{
			
		}
		return isSave;
	}
	@Override
	public boolean deleteBillInfoCart(String sBillId) {
		boolean isDelete = true;
		try {
			isDelete = billingInfoCartDao.deleteBillInfoCart(sBillId);
		} catch (Exception e) {
			objLogger.error(e.getMessage());
			isDelete = false;
			objLogger.fatal("error in deleteCategory in category service");
		}
		return isDelete;
	}
	@Override
	public List<BillingInfoCart> getAllBillInfoByBillNo(BillingInfoCart billingInfoCart) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingInfoCart> lstBillingInfoCart = null;
		try {
			lstBillingInfoCart = billingInfoCartDao.getAllBillInfoByBillNo(billingInfoCart);
		} catch (Exception e) {
			objLogger.info("Exception in getAllBillInfoByBillNo()" + e);
			System.out.println("Exception in getAllBillInfoByBillNo()");
		}
		return lstBillingInfoCart;
	}
	

}
