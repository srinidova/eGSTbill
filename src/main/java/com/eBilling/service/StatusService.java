package com.eBilling.service;

import java.util.List;

import com.eBilling.model.Product;
import com.eBilling.model.Status;


public interface StatusService {

	String populateStatus();
	/*public String populateProducts() ;

	boolean deleteProduct(String sProductId);

	boolean productSave(Product product);

	boolean updateProduct(Product product);

	List<Product> getProductByName(String sProductName);*/

	boolean statusSave(Status status);

	boolean deleteStatus(String sStatusId);

	boolean updateStatus(Status status);

	List<Status> getStatusByName(String sStatus);

}
