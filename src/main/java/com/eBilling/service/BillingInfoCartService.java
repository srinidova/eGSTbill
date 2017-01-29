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
public interface BillingInfoCartService {
	

	List<BillingInfoCart> getAllBillInfoCartByBillId(BillingInfoCart billingInfoCart);

	List<BillingInfoCart> getAllBillInfoCartByNewBillId(String sNewbillId);

	boolean saveBillInfoCart(BillingInfoCart billingInfoCart);

	boolean updateBillInfoCart(BillingInfoCart billingInfoCart);

	boolean deleteBillInfoCart(String sBillId);

	List<BillingInfoCart> getAllBillInfoByBillNo(BillingInfoCart billingInfoCart);

}
