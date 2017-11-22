package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.ClientDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.PurchasesDAO;
import com.eGSTbill.model.Client;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Purchases;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PurchasesService {

	public String addPurchases(Purchases purchases){
		PurchasesDAO dao = new PurchasesDAO();
		return dao.addPurchases(purchases);
		
	}
	
	public String listPurchases(){
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<Purchases> lstPurchases = null;
		PurchasesDAO dao = new PurchasesDAO();
		lstPurchases = dao.listPurchases();
		
		if(lstPurchases == null || lstPurchases.size()>0){
			objectMapper = new ObjectMapper();
			try{
				sJson = objectMapper.writeValueAsString(lstPurchases);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return sJson;
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
	
	
	public String deletePurchases(Purchases purchases){
		PurchasesDAO dao = new PurchasesDAO();
		return dao.deletePurchases(purchases);
	}
	public String updatePurchases(Purchases purchases){
		PurchasesDAO dao = new PurchasesDAO();
		return dao.updatePurchases(purchases);
	}
	
	
	
	
	
	
}
