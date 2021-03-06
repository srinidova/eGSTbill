package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.ClientDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.model.Client;
import com.eGSTbill.model.Product;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ClientService {

	public String addClient(Client client) {
		ClientDAO dao = new ClientDAO();
		return dao.addClient(client);
	}

	public String listClients() {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<Client> lstClients = null;
		ClientDAO dao = new ClientDAO();

		lstClients = dao.listClients();
		if (lstClients == null || lstClients.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstClients);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}
	public String deleteClient(Client client){
		////System.out.println("in to deleteClient service");
		ClientDAO dao = new ClientDAO();
		return dao.deleteClient(client);
		
	}
	
	public String updateClient(Client client) {
		ClientDAO dao = new ClientDAO();
		return dao.updateClient(client);
	}
	
	public Client getClientByUserId(String sUserId) {
		Client client = null;
		ArrayList<Client> lstClients = null;
		ClientDAO dao = new ClientDAO();
		lstClients = dao.getClientByUserId(sUserId);
		for(Client clientExst : lstClients){
			client = clientExst;
		}

		return client;
	}
	public boolean getProductByName(String sProductName) {
		boolean bProductExist = false;
		ArrayList<Product> lstProducts = null;
		ProductDAO dao = new ProductDAO();
		lstProducts = dao.getProductByName(sProductName);
		if (lstProducts == null || lstProducts.size() > 0) {
			bProductExist = true;
		}
		return bProductExist;
	}
	
	
	public boolean getClientByMobileNo(String sMobile){
		boolean bMobileExist = false;
		ArrayList<Client> lstClients = null;
		ClientDAO dao = new ClientDAO();
		lstClients = dao.getClientByMobileNo(sMobile);
		if(lstClients == null || lstClients.size()>0){
			bMobileExist = true;
		}
		return bMobileExist;
	}
}
