package com.eBilling.service;

import java.util.List;
import java.util.Map;

import com.eBilling.model.Product;
import com.eBilling.model.Register;

public interface RegistrationService {

	

	boolean saveRegister(Register register);

	boolean updateRegister(Register register);

	String getAllRegister();

	//boolean deleteCategory(String sCategoryId);

	boolean deleteRegister(String id);

	List<Register> getAllBillEmailAndMobileNo(String sEmailOrMobileNo);

	boolean updateResetPassword(Register register);

	List<Register> checkEmailAndMobileNo(String sEmail, String sMobileNo);

	//boolean deleteRegister(String id);

}
