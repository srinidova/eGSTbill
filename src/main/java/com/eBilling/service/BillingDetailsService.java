package com.eBilling.service;

import java.util.List;

import com.eBilling.model.BillingDetails;

public interface BillingDetailsService {


	List<BillingDetails> getAllBillDetailsByBillNo(String sBillId);

	boolean deleteBillDetailsCart(String billId);

	String saveBillDetails(BillingDetails billingdetails);

}
