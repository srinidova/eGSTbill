package com.eBilling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.baseModel.BillingInfo;
import com.eBilling.dao.BillingDetailsDao;
import com.eBilling.model.BillingDetails;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class BillingDeteailsServicesImpl implements BillingDetailsService {
	@Autowired
	BillingDetailsDao billingDetailsDao;
	@Override
	public List<BillingDetails> getAllBillDetailsByBillNo(String sBillId) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingDetails> billingDetails = null;
		try {
			billingDetails = billingDetailsDao.getAllBillDetailsByBillNo(sBillId);
			
		} catch (Exception e) {
			//objLogger.info("Exception in getAllBillInfoByBillNo()" + e);
			System.out.println("Exception in getAllBillInfoByBillNo()");
		}
		return billingDetails;
	}
	@Override
	public boolean deleteBillDetailsCart(String billId) {
		boolean isDelete = true;
		try {
			isDelete = billingDetailsDao.deleteBillDetails(billId);;
		} catch (Exception e) {
			System.out.println("isDelete=="+isDelete);
			//objLogger.error(e.getMessage());
			isDelete = false;
			//objLogger.fatal("error in deleteCategory in category service");
			System.out.println("error in deleteBillDetailsCart in category service");
		}
		return isDelete;
	}
	@Override
	public String saveBillDetails(BillingDetails billingdetails) {
		String isSave = null;
		try {
			isSave = billingDetailsDao.saveBillDetails(billingdetails);
		}catch(Exception e){
			//objLogger.error("Exception in BillingDetatilsCartServiceImpl in saveBillDetails() "+e);
		}finally{
			
		}
		return isSave;
	}
}
