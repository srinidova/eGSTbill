package com.eBilling.service;

import com.eBilling.model.Client;

public interface ClientService {

	boolean saveClient(Client client);

	boolean updateClient(Client client);

	boolean deleteClient(String clientId);

	String getAllClient();

	

}
