package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.dao.DamageDao;
import com.eBilling.dao.ProductDao;
import com.eBilling.model.Damage;
import com.eBilling.model.Product;
import com.eBilling.model.ProductStock;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class DamageServiceImpl implements DamageService{
	
	@Autowired
	DamageDao damageDao;
	private Logger objLogger = Logger.getLogger(DamageServiceImpl.class);
	@Override
	public String populateDamage() {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Damage> lstDamage = null;
		try {
			lstDamage = damageDao.getAllDamage();
			//lstDamage = productDao.getAllProduct();
			if (lstDamage != null && lstDamage.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstDamage);
			}
		} catch (Exception e) {
			objLogger.info("Exception in DamageServiceImpl in populateProducts()" + e);
			System.out.println("Exception in Damage Controller in  getAllProducts()");
		}
		return sJson;
	}
	@Override
	public boolean damageSave(Damage damage) {
		boolean isSave = false;
		try {
			isSave = damageDao.damageSave(damage);
			//isSave = productDao.productSave(product);
		}catch(Exception e){
			objLogger.error("Exception in DamageServiceImpl in getAllbillDeteailsCart() "+e);
			
		}finally{
			
		}
		return isSave;
	}
	
	@Override
	public boolean updateDamage(Damage damage) {
		boolean isSave = false;
		try {
			isSave = damageDao.updateDamage(damage);
			//isSave = productDao.updateProduct(product);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
			System.out.println("erroor in updateDamage() "+e);
		}finally{
			
		}
		return isSave;
	}
	@Override
	public List<Damage> getDamageById(String sDamageId) {
		List<Damage> getById = null;
		try {
			getById = damageDao.getDamageById(sDamageId);
			//getById = damageDao.getDamageById(sDamageId);
			//getByName = productDao.getProductByName(sDamageId);
		}catch(Exception e){
			objLogger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
		}finally{
			
		}
		return getById;
	}
	
	@Override
	public boolean deleteDamage(String sDamageId) {
		boolean isDelete = true;
		try {
			isDelete = damageDao.deleteDamage(sDamageId);
			//isDelete = productDao.deleteProduct(sProductId);
		} catch (Exception e) {
			objLogger.error(e.getMessage());
			isDelete = false;
			objLogger.fatal("error in deleteCategory in category service");
		}
		return isDelete;
	}
	public String getAllDamage() {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<Damage> lstDamage = null;
		try {
			lstDamage = damageDao.getAllDamage();
			if (lstDamage != null && lstDamage.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstDamage);
			}
		} catch (Exception e) {
			objLogger.info("Exception in RegistrationServiceImpl in populateProducts()" + e);
			System.out.println("Exception getAllDamage()"+e);
		}
		return sJson;
	}
}
