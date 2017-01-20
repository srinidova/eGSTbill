package com.eBilling.service;

import java.util.List;

import com.eBilling.model.Damage;
import com.eBilling.model.Product;


public interface DamageService {

	boolean damageSave(Damage damage);

	boolean deleteDamage(String sDamageId);

	boolean updateDamage(Damage damage);

	//String populateDamage();

	String populateDamage();

	List<Damage> getDamageById(String sDamageId);

	//List<Product> getDamageById(String sDamageId);

	//boolean saveDamage(Damage damage);
	/*public String populateProducts() ;

	boolean deleteProduct(String sProductId);

	boolean productSave(Product product);

	boolean updateProduct(Product product);

	List<Product> getProductByName(String sProductName);*/

	//boolean damageSave(Damage damage);
}
