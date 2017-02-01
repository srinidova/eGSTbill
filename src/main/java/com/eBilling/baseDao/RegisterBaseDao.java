package com.eBilling.baseDao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.model.Register;

public class RegisterBaseDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO register( regName, mobileNo,email,regType,password,regId,emailCode) values (?,?,?,?,?,?,?)";

	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public boolean saveRegister(final Register register) {
		boolean isSave = false;
		try{
		
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] {  register.getRegName(),
						register.getMobileNo(),register.getEmail(),register.getRegType(),register.getPassword(),register.getRegId(),register.getEmailCode()  });
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}

	public boolean updateRegister(Register register) {
		boolean isUpdate = false;
		try {
			String sql = "UPDATE register  set regName = ?, mobileNo = ?, email = ?, regType= ? where regId = ? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] {register.getRegName() ,
							register.getMobileNo(),register.getEmail(),
							register.getRegType(),register.getRegId()
							 });
			System.out.println("update111==="+update);
			System.out.println(sql);
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdate;
	}
	public boolean updateResetPassword(Register register) {
		boolean isUpdate = false;
		try {
			String sql = "UPDATE register  set  password =? where email = ? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] {register.getPassword(),register.getEmail()
							 });
			System.out.println("update111==="+update);
			System.out.println(sql);
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdate;
	}

	public boolean deleteRegister(String id) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM register WHERE regId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { id });
			System.out.println("delete row"+delete);
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}

		return isDelete;
	}

	public List<Register> getRegister(int id) {
		List<Register> retlist = null;
		try {
			String sql = "SELECT * from events where regName = ? ";
			retlist = jdbcTemplate.query(sql, new Object[] {id},
					ParameterizedBeanPropertyRowMapper
							.newInstance(Register.class));
			if (retlist.size() > 0)
				return retlist;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public Register getRegister1(int id) {
		List<Register> retlist = null;
		try {
			String sql = "SELECT * from events where eventId = ? ";
			retlist = jdbcTemplate.query(sql, new Object[] {id},
					ParameterizedBeanPropertyRowMapper
							.newInstance(Register.class));
			if (retlist.size() > 0)
				return retlist.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public List<Register> getAllRegister() {
		List<Register> retlist = null;
		try {
			String sql = "SELECT * from register";
			retlist = jdbcTemplate.query(sql,
					ParameterizedBeanPropertyRowMapper
							.newInstance(Register.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	public List<Register> checkEmailAndMobileNo(String sEmailOrMobileNo) {
		List<Register> retlist = null;
		try {
			String sql = "SELECT * from register where email = ? and mobileNo";
			System.out.println("query----"+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {StringUtils.trim(sEmailOrMobileNo)},new BeanPropertyRowMapper<Register>(Register.class));
			
			System.out.println("retlist----"+retlist.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	public List<Register> getAllBillEmailAndMobileNo( String sEmailOrMobileNo){
		List<Register> finalList = null;  
		
		if(org.apache.commons.validator.EmailValidator.getInstance().isValid(sEmailOrMobileNo) ){
			System.out.println("emailOrMobile==="+sEmailOrMobileNo);
			String sql= "SELECT * FROM register where email = ? ";
			System.out.println("sql===="+sql);
			finalList =	 jdbcTemplate.query(sql, new Object [] {StringUtils.trim(sEmailOrMobileNo)}, new BeanPropertyRowMapper<Register>(Register.class));
			System.out.println("finalList===="+finalList);
		}else{
			String sql= "SELECT * FROM register where mobileNo = ? ";
			System.out.println("sql===="+sql);
			finalList =	 jdbcTemplate.query(sql, new Object [] {StringUtils.trim(sEmailOrMobileNo)}, new BeanPropertyRowMapper<Register>(Register.class));
			System.out.println("finalList===="+finalList);
		   }
		
		/*if(finalList != null && finalList.size() == 1){
			return  finalList.get(0);
	     }*/
		
		return finalList;

	}

}

