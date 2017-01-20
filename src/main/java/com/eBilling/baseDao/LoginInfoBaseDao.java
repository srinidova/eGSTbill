package com.eBilling.baseDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.registry.infomodel.EmailAddress;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.Validate;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.impl.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;

import com.eBilling.model.LoginInfo;
import com.eBilling.model.Register;

public class LoginInfoBaseDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO login( loginId,name, password ) values (?,?,?)";
	
	public boolean saveBillInfo(LoginInfo loginInfo) {
		int update = 0;
		boolean isSave = false;
		try {
			update = jdbcTemplate.update(INSERT_SQL, new Object[] {
					 loginInfo.getLoginId(),loginInfo.getName(),loginInfo.getPassword()
					 });
				System.out.println("update==="+update+"INSERT_SQL"+INSERT_SQL);
			if (update > 0) {
				isSave = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isSave;
	}
	public Register getPersonalData( String emailOrMobile){
		List<Register> finalList = null;  
		
		if(org.apache.commons.validator.EmailValidator.getInstance().isValid(emailOrMobile) ){
			System.out.println("emailOrMobile==="+emailOrMobile);
			String sql= "SELECT * FROM register where email = ? ";
			System.out.println("sql===="+sql);
			finalList =	 jdbcTemplate.query(sql, new Object [] {StringUtils.trim(emailOrMobile)}, new BeanPropertyRowMapper<Register>(Register.class));
			System.out.println("finalList===="+finalList);
		}else{
			String sql= "SELECT * FROM register where mobileNo = ? ";
			finalList =	 jdbcTemplate.query(sql, new Object [] {StringUtils.trim(emailOrMobile)}, new BeanPropertyRowMapper<Register>(Register.class));
			System.out.println("sql===="+sql);
		   }
		
		if(finalList != null && finalList.size() == 1){
			return finalList.get(0);
	     }
		
		return null;

	}
	
}