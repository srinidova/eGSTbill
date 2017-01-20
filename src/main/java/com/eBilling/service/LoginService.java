package com.eBilling.service;

import com.eBilling.model.LoginInfo;
import com.eBilling.model.Register;

public interface LoginService  {

	boolean saveloginInfo(LoginInfo loginInfo);
	Register validateUser(String userName,String password);

}
