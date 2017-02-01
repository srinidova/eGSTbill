package com.eBilling.service;

import java.util.List;

import org.json.JSONObject;

import com.eBilling.model.Damage;
import com.eBilling.model.ProductStock;


public interface DamageService {

	boolean damageSave(Damage damage);

	boolean deleteDamage(String sDamageId);

	boolean updateDamage(Damage damage);

	//String populateDamage();

	String populateDamage();

	List<Damage> getDamageById(String sDamageId);


	boolean updatedStock(ProductStock productStock, JSONObject data, List<ProductStock> lstProductstock);

	//boolean updateStock111(ProductStock productStock, JSONObject data, List<ProductStock> lstProductstock);
	boolean addDeletedStock(ProductStock productStock, JSONObject data, List<ProductStock> lstProductstock);

	boolean checkInQuantity(Damage damage, List<Damage> lstDamage);

	List<Damage> updateProductQuantity(Damage damage, List<Damage> lstDamage);
	
}
