
package com.eBilling.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.eBilling.baseDao.LoginInfoBaseDao;
import com.eBilling.model.LoginInfo;




@Repository(value = "LoginInfoDao")
public class LoginInfoDao extends LoginInfoBaseDao
{
	
	@Autowired
	public JdbcTemplate jdbcTemplate;
/*public Boolean saveloginInfo(LoginInfo loginInfo){
	String sql= "insert into login (name, password) values(?,?)";
	jdbcTemplate.update(sql, new Object [] { loginInfo.getName(),loginInfo.getPassword()});
	return null;*/
//}


public List<LoginInfo> getPersonalData(LoginInfo loginInfo){
	List<LoginInfo> finalList = null;  
	String sql= "select * from login ";
	// dbList  = jdbcTemplate.query(sql, new Object [] { personalInfo.getName(),personalInfo.getPassword()}, new BeanPropertyRowMapper<LoginInfo>(LoginInfo.class));
	
	return null;
}
}

