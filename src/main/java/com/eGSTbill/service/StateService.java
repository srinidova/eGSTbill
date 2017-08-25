package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.ShippingDAO;
import com.eGSTbill.dao.StateDAO;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Shipping;
import com.eGSTbill.model.State;
import com.fasterxml.jackson.databind.ObjectMapper;

public class StateService {

	
	public String getAllStates() {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<State> lstStates = null;
		StateDAO dao = new StateDAO();

		lstStates = dao.getAllStates();
		if (lstStates == null || lstStates.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstStates);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}
}
