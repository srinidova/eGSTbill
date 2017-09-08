package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.PurchaserShippingDAO;
import com.eGSTbill.dao.ShippingDAO;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.PurchaserShipping;
import com.eGSTbill.model.Shipping;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ShippingService {

	public String addShipping(Shipping shipping) {
		ShippingDAO dao = new ShippingDAO();
		return dao.addShipping(shipping);
	}

	public String listShipping() {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<Shipping> lstShipping = null;
		ShippingDAO dao = new ShippingDAO();

		lstShipping = dao.listShipping();
		if (lstShipping == null || lstShipping.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstShipping);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}

	public String deleteShipping(Shipping shipping) {
		ShippingDAO dao = new ShippingDAO();
		return dao.deleteShipping(shipping);
	}

	
	public String updateShipping(Shipping shipping) {
		ShippingDAO dao = new ShippingDAO();
		return dao.updateShipping(shipping);
	}
	
	
}
