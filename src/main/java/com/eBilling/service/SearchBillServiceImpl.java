package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.eBilling.baseModel.BillingInfo;
import com.eBilling.model.Product;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class SearchBillServiceImpl {

	
	private Logger logger = Logger.getLogger(ProductPopulateServiceImpl.class);
	/*@Override
	public String getAllBillInfo() {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingInfo> lstBillingInfo = null;
		try {
			lstBillingInfo = productDao.getAllProduct();
			if (lstBillingInfo != null && lstBillingInfo.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstBillingInfo);
			}
		} catch (Exception e) {
			logger.info("Exception in ProductPopulateServiceImpl in populateProducts()" + e);
			System.out.println("Exception in Product Controller in  getAllProducts()");
		}
		return sJson;
	}*/
}
