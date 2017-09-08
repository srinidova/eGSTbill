package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.BillCartBillDetailsCartDAO;
import com.eGSTbill.dao.ClientProductDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.PurchaserShippingDAO;
import com.eGSTbill.dao.ShippingDAO;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.ClientProduct;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.PurchaserShipping;
import com.eGSTbill.model.Shipping;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ClientProductService {

	public String addClientProduct(ClientProduct clientProduct) {
		System.out.println("in to ClientProductService");
		ClientProductDAO dao = new ClientProductDAO();
		return dao.addClientProduct(clientProduct);
	}

	

}
