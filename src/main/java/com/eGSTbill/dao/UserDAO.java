package com.eGSTbill.dao;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.ClientProduct;
import com.eGSTbill.model.ClientUser;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.User;
import com.ibatis.sqlmap.client.SqlMapClient;

public class UserDAO {

	public String addUser(User user) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("User.addUser", user);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<User> listUsers() {
		ArrayList<User> lstUsers = new ArrayList<User>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstUsers = (ArrayList<User>) session.queryForList("User.listUsers");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!lstUsers.equals(null)) {
			return lstUsers;
		} else {
			return lstUsers;
		}
	}

	public String deleteUser(User user) {
		String result = "fail";
		//System.out.println("in to delete user DAO");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("User.deleteUser", user);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Product> getProductByName(String sProductName) {
		ArrayList<Product> lstProducts = new ArrayList<Product>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstProducts = (ArrayList<Product>) session.queryForList("Product.getProductByName", sProductName);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstProducts;
	}

	public String updateUser(User user) {
		String result = "fail";
		//System.out.println("in to update user");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("User.updateUser", user);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<User> getUserByMobile(User user) {
		ArrayList<User> users = new ArrayList<User>();
		try {
			//System.out.println("in to getUserByMobile dao");
			SqlMapClient session = new IbatisFactory().getSession();

			String sMobile = user.getMobile();
			users = (ArrayList<User>) session.queryForList("User.getUserByMobile", sMobile);
			//System.out.println("in to getUserByMobile==="+user);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	public String passwordUpdate(User user) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("User.passwordUpdate", user);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}	
	
	@SuppressWarnings("unchecked")
	public ArrayList<User> listUsersByClientId(String sClientId) {
		ArrayList<User> lstUsers = new ArrayList<User>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			ClientUser cu = new ClientUser();
			////System.out.println("sClientId=="+sClientId);
			if (StringUtils.isNotEmpty(sClientId)) {
				cu.setClientId(sClientId);
			}
			lstUsers = (ArrayList<User>) session.queryForList("User.listUsersByClientId", cu);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstUsers;
	}
}
