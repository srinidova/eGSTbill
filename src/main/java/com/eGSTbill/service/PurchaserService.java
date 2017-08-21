package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.PurchaserDAO;
import com.eGSTbill.model.Purchaser;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PurchaserService {

	public String addPurchase(Purchaser newPurchaser) {
		System.out.println("result in service====getCompanyName===="+newPurchaser.getCompanyName());
		PurchaserDAO dao = new PurchaserDAO();
		return dao.addPurchaser(newPurchaser);
	}

	public String listPurchaser() {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<Purchaser> lstPurchasers = null;
		PurchaserDAO dao = new PurchaserDAO();
		lstPurchasers = dao.listPurchaser();
		System.out.println("lstPurchasers size==========="+lstPurchasers.size());
		if (lstPurchasers == null || lstPurchasers.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstPurchasers);
				System.out.println("result String list======"+sJson);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}

	public String deletePurchaser(Purchaser newPurchaser) {
		PurchaserDAO dao = new PurchaserDAO();
		return dao.deletePurchaser(newPurchaser);
	}

	/*public boolean getPurchaserByName(String sCmpnyName) {
		boolean bPurchaserExist = false;
		ArrayList<Purchaser> lstPurchaser = null;
		PurchaserDAO dao = new PurchaserDAO();
		//lstPurchaser = dao.getPurchaserByName(sCmpnyName);
		if (lstPurchaser == null || lstPurchaser.size() > 0) {
			bPurchaserExist = true;
		}
		return bPurchaserExist;
	}

	public boolean checkProductByName(String sProductName, String sProductId) {
		boolean bProductExist = false;
		ArrayList<Product> lstProducts = null;
		ProductDAO dao = new ProductDAO();
		lstProducts = dao.getProductByName(sProductName);
		if (lstProducts == null || lstProducts.size() > 0) {
			for(Product product : lstProducts){
				String sProdIdExst = product.getProductId();
				String sProdNameExst = product.getProductName();
					if(!StringUtils.equals(sProductId, sProdIdExst)){
						bProductExist = true;
						break;
					}
				
			}
		}
		return bProductExist;
	}*/
	
	public String updatePurchaser(Purchaser newPurchaser) {
		PurchaserDAO dao = new PurchaserDAO();
		return dao.updatePurchaser(newPurchaser);
	}
}
