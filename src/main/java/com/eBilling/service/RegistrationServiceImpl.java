package com.eBilling.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.baseModel.BillingInfo;
import com.eBilling.dao.RegisterDao;
import com.eBilling.model.Register;
import com.fasterxml.jackson.databind.ObjectMapper;
@Service
public class RegistrationServiceImpl implements RegistrationService {
	@Autowired
	RegisterDao registerDao;
	private Logger logger = Logger.getLogger(RegistrationServiceImpl.class);
	
	@Override
	public boolean saveRegister(Register register) {
		boolean isSave = false;
		try {
			isSave = registerDao.saveRegister(register);
		}catch(Exception e){
			//objLogger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
			e.printStackTrace();
		}finally{
			
		}
		return isSave;
}

@Override
public boolean updateRegister(Register register) {
	boolean isUpdate = false;
	try {
		isUpdate = registerDao.updateRegister(register);
	}catch(Exception e){
		logger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
		e.printStackTrace();
	}finally{
		
	}
	return isUpdate;
}
@Override
public boolean deleteRegister(String id) {
	boolean isDelete = true;
	try {
		isDelete = registerDao.deleteRegister(id);
	} catch (Exception e) {
		logger.error(e.getMessage());
		isDelete = false;
		logger.fatal("error in deleteCategory in category service");
	}
	return isDelete;
}

@Override
public String getAllRegister() {
	ObjectMapper objectMapper = null;
	String sJson = null;
	List<Register> lstRegisterModel = null;
	try {
		lstRegisterModel = registerDao.getAllRegister();
		if (lstRegisterModel != null && lstRegisterModel.size() > 0) {
			objectMapper = new ObjectMapper();
			sJson = objectMapper.writeValueAsString(lstRegisterModel);
		}
	} catch (Exception e) {
		logger.info("Exception in RegistrationServiceImpl in populateProducts()" + e);
		//System.out.println("Exception in Register Controller in  getAllProducts()");
	}
	return sJson;
}
@Override
public List<Register> getAllBillEmailAndMobileNo(String sEmailOrMobileNo) {
	ObjectMapper objectMapper = null;
	String sJson = null;
	List<Register> lstRegister = null;
	try {
		lstRegister = registerDao.getAllBillEmailAndMobileNo(sEmailOrMobileNo);
	} catch (Exception e) {
		logger.info("Exception in getAllBillInfoByBillNo()" + e);
		System.out.println("Exception in getAllBillInfoByBillNo()"+e);
	}
	return lstRegister;
}
public List<Register> checkEmailAndMobileNo(String sEmail, String sMobileNo) {
	ObjectMapper objectMapper = null;
	String sJson = null;
	List<Register> lstRegister = null;
	try {
		lstRegister = registerDao.checkEmailAndMobileNo(sEmail,sMobileNo);
	} catch (Exception e) {
		logger.info("Exception in getAllBillInfoByBillNo()" + e);
		System.out.println("Exception in getAllBillInfoByBillNo()"+e);
	}
	return lstRegister;
}
@Override
public boolean updateResetPassword(Register register) {
	boolean isUpdate = false;
	try {
		isUpdate = registerDao.updateResetPassword(register);
	}catch(Exception e){
		logger.error("Exception in BillingDetatilsCartServiceImpl in getAllbillDeteailsCart() "+e);
		e.printStackTrace();
	}finally{
		
	}
	return isUpdate;
}

}

