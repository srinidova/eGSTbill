/**
 * 
 */
package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.baseModel.BillingInfo;
import com.eBilling.baseModel.BillingInfoCart;
import com.eBilling.dao.BillingDetailsCartDao;
import com.eBilling.dao.BillingDetailsDao;
import com.eBilling.dao.BillingInfoCartDao;
import com.eBilling.dao.BillingInfoDao;
import com.eBilling.model.BillingDetails;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author srinu
 *
 */
@Service
public class BillingDetatilsCartServiceImpl implements BillingDetatilsCartService{
	@Autowired
	BillingDetailsDao billingDetailsDao;
	@Autowired
	BillingDetailsCartDao billingDetailsCartDao;
	@Autowired
	BillingInfoDao billingInfoDao;
	@Autowired
	BillingInfoCartDao billingInfoCartDao;
	
	Logger objLogger = Logger.getLogger(BillingDetatilsCartServiceImpl.class); 
	@Override
	public List<BillingDetailsCart>  getAllbillDeteailsCart(String sBillId) {
		List<BillingDetailsCart> lstProductModel = null;
		try {
			lstProductModel = billingDetailsCartDao.getAllBillDetailsByBillId(sBillId);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
		}finally{
			
		}
		return lstProductModel;
	}
	
	@Override
	public boolean saveBillDetailsCart(BillingDetailsCart billingdetailsCart) {
		boolean isSave = false;
		try {
			isSave = billingDetailsCartDao.saveBillDetailsCart(billingdetailsCart);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl in saveBillDetailsCart() "+e);
		}finally{
			
		}
		return isSave;
	}
	
	
	public BillingInfoCart calculateTotal(List<BillingDetailsCart> listBillCart  ,BillingInfoCart objBillingInfoCart) {
		try {
			if (listBillCart != null && listBillCart.size() > 0) {
				int iTotalQuantity = 0;
				int iTotalMrp = 0;
				int iTotalRate = 0;
				int iTotalAmount = 0;
				String sBillId = null;
				for (int i = 0; i < listBillCart.size(); i++) {
					BillingDetailsCart billingCart = listBillCart
							.get(i);
					int iQuantity = Integer.parseInt(billingCart.getQuantity());
					iTotalQuantity = iTotalQuantity + iQuantity;
					int iMrp = Integer.parseInt(billingCart.getMrp());
					iTotalMrp = iTotalMrp + iMrp;
					int iRate = Integer.parseInt(billingCart.getRate());
					iTotalRate = iTotalRate + iRate;
					int iAmount = Integer.parseInt(billingCart.getAmount());
					iTotalAmount = iTotalAmount + iAmount;
					sBillId = billingCart.getBillId();
				}
				if(objBillingInfoCart == null){
					objBillingInfoCart  = new BillingInfoCart();
				}
				objBillingInfoCart.setBillId(sBillId);
				objBillingInfoCart.setTotalQuantity(String
						.valueOf(iTotalQuantity));
				objBillingInfoCart.setTotalMrp(String.valueOf(iTotalMrp));
				objBillingInfoCart.setTotalRate(String.valueOf(iTotalRate));
				objBillingInfoCart.setTotalAmount(String
						.valueOf(iTotalAmount));
			}
		} catch (Exception e) {

			System.out
					.println("Exception in BillingDetatilsCartServiceImpl in  calculateTotal()");
		}
		return objBillingInfoCart;
	}
	@Override
	public boolean deleteBillDetailsCart(String sBillId) {
		boolean isDelete = true;
		try {
			isDelete =billingDetailsCartDao.deleteBillDetailsCart(sBillId);
		} catch (Exception e) {
			objLogger.error(e.getMessage());
			isDelete = false;
			objLogger.fatal("error in deleteCategory in category service");
		}
		return isDelete;
	}
	@Override
	public boolean deleteBillingDetailsCart(String sBillDeatailsId) {
		boolean isDelete = true;
		try {
			isDelete =billingDetailsCartDao.deleteBillingDetailsCart(sBillDeatailsId);
		} catch (Exception e) {
			objLogger.error(e.getMessage());
			isDelete = false;
			objLogger.fatal("error in deleteCategory in category service");
		}
		return isDelete;
	}
	@Override
	public boolean checkInCart(BillingDetailsCart billingdetailsCart, List<BillingDetailsCart> listBillingDetails) {
		String sNewProductId = null;
		boolean isExist = false;
		try {
			 sNewProductId = billingdetailsCart.getProductId();
			 for(int i=0;i<listBillingDetails.size();i++){
				 BillingDetailsCart existBillingDetailsCart = listBillingDetails.get(i);
				 if(existBillingDetailsCart.getProductId().equals(sNewProductId)){
					// System.out.println("in----------checkInCart---------------sNewProductId=="+sNewProductId+"--------------existBillingDetailsCart.getProductId()==="+existBillingDetailsCart.getProductId());
					 isExist = true;
					 break;
				 }
				 
			 }
			
			
		} catch (Exception e) {

			System.out
					.println("Exception in checkInCart()");
		}
		return isExist;
	}

	@Override
	public List<BillingDetailsCart> updateProductQuantity(BillingDetailsCart billingdetailsCart,
			List<BillingDetailsCart> listBillingDetails) {
		String sNewProductId = null;
		try {
			sNewProductId = billingdetailsCart.getProductId();
			for (int i = 0; i < listBillingDetails.size(); i++) {
				
				BillingDetailsCart existBillingDetailsCart = listBillingDetails.get(i);
				if (existBillingDetailsCart.getProductId().equals(sNewProductId)) {
					//System.out.println("in----------updateProductQuantity---------------sNewProductId=="+sNewProductId+"--------------existBillingDetailsCart.getProductId()==="+existBillingDetailsCart.getProductId());
					int existQty = Integer.parseInt(existBillingDetailsCart.getQuantity());
					int newQty = Integer.parseInt(billingdetailsCart.getQuantity());
					int existAmount = Integer.parseInt(existBillingDetailsCart.getAmount());
					int newAmount = Integer.parseInt(billingdetailsCart.getAmount());
					//System.out.println("existQty=="+existQty+"--------------newQty==="+newQty);
					existBillingDetailsCart.setQuantity(String.valueOf(existQty + newQty));
					existBillingDetailsCart.setAmount(String.valueOf(existAmount + newAmount));
					
					 billingDetailsDao.updateBillDetails(existBillingDetailsCart);
					break;
				}

			}

		} catch (Exception e) {

			System.out.println("Exception in updateProductQuantity in  calculateTotal()");
		}
		return listBillingDetails;
	}
	@Override
	public List<BillingDetailsCart> getAllBillDetailsCartByBillId(String sBillId) {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<BillingDetailsCart> billingDetails = null;
		try {
			billingDetails = billingDetailsCartDao.getAllBillDetailsCartByBillId(sBillId);
			
		} catch (Exception e) {
			//objLogger.info("Exception in getAllBillInfoByBillNo()" + e);
			System.out.println("Exception in getAllBillInfoByBillNo()");
		}
		return billingDetails;
	}

}
