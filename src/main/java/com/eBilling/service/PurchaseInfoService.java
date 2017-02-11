/**
 * 
 */
package com.eBilling.service;

import java.util.List;

import com.eBilling.baseModel.PurchaserInfo;

/**
 * @author srinu
 *
 */
public interface PurchaseInfoService {
	public List<PurchaserInfo> getAllPurchaseInfo();

	boolean deletePurchaseInfo(String id);

	boolean updatePurchaseInfo(PurchaserInfo purchaserInfo);
	boolean savePurchaseInfo(PurchaserInfo purchaserInfo);

	List<PurchaserInfo> getPurchaseByName(String sPurchaseName);

	List<PurchaserInfo> checkEmailAndMobileNo(String sEmailOrMobileNo);
}
