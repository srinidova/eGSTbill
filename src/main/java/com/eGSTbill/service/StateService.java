package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.StateDAO;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.State;
import com.fasterxml.jackson.databind.ObjectMapper;

public class StateService {

	
	public String getAllStates(State state){
		StateDAO dao = new StateDAO();
		return dao.getAllStates(state);
		
	}
}
