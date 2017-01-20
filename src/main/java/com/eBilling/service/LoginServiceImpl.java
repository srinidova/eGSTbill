package com.eBilling.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eBilling.baseModel.BillingInfo;
import com.eBilling.dao.LoginInfoDao;
import com.eBilling.model.LoginInfo;
import com.eBilling.model.Register;

@Service
public class LoginServiceImpl implements LoginService {
	private Logger logger = Logger.getLogger(LoginServiceImpl.class);
	@Autowired
	LoginInfoDao loginInfoDao;
	
	
	@Override
	public boolean saveloginInfo(LoginInfo loginInfo) {
		boolean isSave = false;
		try {
			isSave = loginInfoDao.saveBillInfo(loginInfo);
		}catch(Exception e){
			logger.error("Exception in BillingDetatilsCartServiceImpl inupdateBillInfo() "+e);
		}finally{
			
		}
		return isSave;
	}


	/* (non-Javadoc)
	 * Username takes emailId or MobileNo
	 * @see com.eBilling.service.LoginService#validateUser(java.lang.String, java.lang.String)
	 */
	@Override
	public Register validateUser(String userName, String password) {
		Register register = null;
		try{
			register = loginInfoDao.getPersonalData(userName);
			if(register != null && register.getPassword().equals(password)){
				System.out.println("registerModel: "+register.toString());
				return register;
			}
		}catch(Exception e){
			System.out.println("Exception in BillingDetatilsCartServiceImpl validateUser()"+e);
			
		}
		
		return null;
	}
}
