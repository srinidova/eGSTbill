/**
 * 
 */
package com.eBilling.service;

import java.util.List;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.baseModel.BillingInfo;
import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.model.BillingDetails;

/**
 * @author srinu
 *
 */

public interface BillingDetatilsCartService {
	public List<BillingDetailsCart>  getAllbillDeteailsCart(String sBillId);
	public boolean saveBillDetailsCart(BillingDetailsCart billingdetailsCart );
	public BillingInfoCart calculateTotal(List<BillingDetailsCart> listBillCart  ,BillingInfoCart objBillingInfoCart) ;
	boolean deleteBillDetailsCart(String sBillId);
	List<BillingDetailsCart> updateProductQuantity(BillingDetailsCart billingdetailsCart,
			List<BillingDetailsCart> listBillingDetails);
	boolean checkInCart(BillingDetailsCart billingdetailsCart, List<BillingDetailsCart> listBillingDetails);
	boolean deleteBillingDetailsCart(String sBillDeatailsId);
	List<BillingDetailsCart> getAllBillDetailsCartByBillId(String sBillId);
}
