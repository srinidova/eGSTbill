package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.ClientUserDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.model.ClientUser;
import com.eGSTbill.model.Product;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ClientUserService {

	public String addClientUser(ClientUser clientUser) {
		ClientUserDAO dao = new ClientUserDAO();
		return dao.addClientUSer(clientUser);
	}

	
}
