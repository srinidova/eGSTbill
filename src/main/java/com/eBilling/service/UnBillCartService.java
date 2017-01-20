package com.eBilling.service;

import com.eBilling.baseModel.BillingInfoCart;

public interface UnBillCartService {

	String getAllBillInfoCart();

	String unBillInfoCart(BillingInfoCart billingInfoCart);

}
