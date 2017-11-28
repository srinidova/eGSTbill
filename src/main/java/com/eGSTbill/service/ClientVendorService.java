package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.BillCartBillDetailsCartDAO;
import com.eGSTbill.dao.ClientPurchaserDAO;
import com.eGSTbill.dao.ClientVendorDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.PurchaserShippingDAO;
import com.eGSTbill.dao.ShippingDAO;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.ClientPurchaser;
import com.eGSTbill.model.ClientVendor;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.PurchaserShipping;
import com.eGSTbill.model.Shipping;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ClientVendorService {

	public String addClientVendor(ClientVendor clientVendor) {
		//System.out.println("in to ClientVendorService");
		ClientVendorDAO dao = new ClientVendorDAO();
		return dao.addClientVendor(clientVendor);
	}

	

}