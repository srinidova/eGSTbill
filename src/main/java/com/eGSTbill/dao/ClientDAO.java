package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.Client;
import com.eGSTbill.model.Product;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ClientDAO {

	public String addClient(Client client) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Client.addClient", client);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<Client> listClients() {
		ArrayList<Client> lstClients = new ArrayList<Client>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstClients = (ArrayList<Client>) session.queryForList("Client.listClients");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!lstClients.equals(null)) {
			return lstClients;
		} else {
			return lstClients;
		}
	}
	
	
	public String deleteClient(Client client){
		String result ="fail";
		try{
			System.out.println("in to deleteClient dao");
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Client.deleteClient", client);
			result = "success";
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
		
		
	}
	
	public String updateClient(Client client) {
		String result = "fail";
		System.out.println("in to update Client dao");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Client.updateClient", client);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
