package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.BillCartBillDetailsCartDAO;
import com.eGSTbill.dao.ClientPurchaserDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.PurchaserShippingDAO;
import com.eGSTbill.dao.ShippingDAO;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.ClientPurchaser;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.PurchaserShipping;
import com.eGSTbill.model.Shipping;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ClientPurchaserService {

	public String addClientPurchaser(ClientPurchaser clientPurchaser) {
		System.out.println("in to ClientPurchaserService");
		ClientPurchaserDAO dao = new ClientPurchaserDAO();
		return dao.addClientPurchaser(clientPurchaser);
	}

	/*public ArrayList<PurchaserShipping> getShippingDetailsBypurchaserId(PurchaserShipping purchaserShipping) {
		PurchaserShippingDAO  purchaserShippingDAO = new PurchaserShippingDAO();
		return purchaserShippingDAO.getShippingDetailsBypurchaserId(purchaserShipping);
	}*/
	
	/*public ArrayList<PurchaserShipping> getShippingDetailsBypurchaserId(PurchaserShipping purchaserShipping) {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<PurchaserShipping> lstPurchaserShipping = null;
		PurchaserShippingDAO dao = new PurchaserShippingDAO();

		lstPurchaserShipping = dao.getShippingDetailsBypurchaserId(purchaserShipping);
		if (lstPurchaserShipping == null || lstPurchaserShipping.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstPurchaserShipping);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return lstPurchaserShipping;
	}*/

}
