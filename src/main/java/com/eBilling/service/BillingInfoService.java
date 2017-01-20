/**
 * 
 */
package com.eBilling.service;

import java.util.List;

import com.eBilling.baseModel.BillingInfo;
import com.eBilling.baseModel.BillingInfoCart;

/**
 * @author srinu
 *
 */
public interface BillingInfoService {

	String saveBillInfo(BillingInfo billingInfo);

	String SearchBillInfo(BillingInfo billingInfo);

	String getAllBillInfo(BillingInfo billingInfo);

	List<BillingInfo> getAllBillInfoByBillNo(BillingInfo billingInfo);

}
