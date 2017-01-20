package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.dao.ClientDao;
import com.eBilling.model.Client;
import com.fasterxml.jackson.databind.ObjectMapper;
@Service
public class ClientServiceImpl implements ClientService {
	@Autowired
	ClientDao clientDao;
	private Logger logger = Logger.getLogger(ClientServiceImpl.class);
	
	@Override
	public boolean saveClient(Client client) {
		boolean isSave = false;
		try {
			isSave = clientDao.saveClient(client);
		}catch(Exception e){
			logger.error("Exception in ClientServiceImpl in getAllbillDeteailsCart() "+e);
		}finally{
			
		}
		return isSave;
}

@Override
public boolean updateClient(Client client) {
	boolean isUpdate = false;
	try {
		isUpdate = clientDao.updateClient(client);
	}catch(Exception e){
		logger.error("Exception in ClientServiceImpl in updateClient() "+e);
		e.printStackTrace();
	}finally{
		
	}
	return isUpdate;
}
@Override
public boolean deleteClient(String clientId) {
	boolean isDelete = true;
	try {
		isDelete = clientDao.deleteClient(clientId);
	} catch (Exception e) {
		logger.error(e.getMessage());
		isDelete = false;
		logger.fatal("error in ClientServiceImpl in getAllClient()");
	}
	return isDelete;
}

@Override
public String getAllClient() {
	ObjectMapper objectMapper = null;
	String sJson = null;
	List<Client> lstRegisterModel = null;
	try {
		lstRegisterModel = clientDao.getAllClient();
		if (lstRegisterModel != null && lstRegisterModel.size() > 0) {
			objectMapper = new ObjectMapper();
			sJson = objectMapper.writeValueAsString(lstRegisterModel);
		}
	} catch (Exception e) {
		logger.info("Exception in ClientServiceImpl in getAllClient()" + e);
		//System.out.println("Exception in Register Controller in  getAllProducts()");
	}
	return sJson;
}

}

