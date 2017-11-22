package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.BillCartBillDetailsCartDAO;
import com.eGSTbill.dao.ClientPurchaserDAO;
import com.eGSTbill.dao.ClientPurchasesDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.PurchaserShippingDAO;
import com.eGSTbill.dao.ShippingDAO;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.ClientPurchaser;
import com.eGSTbill.model.ClientPurchases;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.PurchaserShipping;
import com.eGSTbill.model.Shipping;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ClientPurchasesService {

	public String addClientPurchases(ClientPurchaser clientPurchaser) {
		//System.out.println("in to ClientPurchaserService");
		ClientPurchaserDAO dao = new ClientPurchaserDAO();
		return dao.addClientPurchaser(clientPurchaser);
	}

	public String addClientPurchases(ClientPurchases clientPurchases){
		ClientPurchasesDAO dao = new ClientPurchasesDAO();
		return dao.addClientPurchases(clientPurchases);
		
	}

}
