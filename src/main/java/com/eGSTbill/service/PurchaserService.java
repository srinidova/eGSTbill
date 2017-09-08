package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.PurchaserDAO;
import com.eGSTbill.model.Purchaser;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PurchaserService {

	public String addPurchase(Purchaser newPurchaser) {
		//System.out.println("result in service====getCompanyName===="+newPurchaser.getCompanyName());
		PurchaserDAO dao = new PurchaserDAO();
		return dao.addPurchaser(newPurchaser);
	}

	public String listPurchaser() {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<Purchaser> lstPurchasers = null;
		PurchaserDAO dao = new PurchaserDAO();
		lstPurchasers = dao.listPurchaser();
		//System.out.println("lstPurchasers size==========="+lstPurchasers.size());
		if (lstPurchasers == null || lstPurchasers.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstPurchasers);
				//System.out.println("result String list======"+sJson);
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

	public String updatePurchaser(Purchaser newPurchaser) {
		PurchaserDAO dao = new PurchaserDAO();
		return dao.updatePurchaser(newPurchaser);
	}
	
	public String listPurchasersByClientId(String sClientId) {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<Purchaser> lstPurchasers = null;
		PurchaserDAO dao = new PurchaserDAO();
		lstPurchasers = dao.listPurchasersByClientId(sClientId);
		//System.out.println("lstPurchasers size==========="+lstPurchasers.size());
		if (lstPurchasers == null || lstPurchasers.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstPurchasers);
				//System.out.println("result String list======"+sJson);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}
}
