package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.ClientUserDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.UserDAO;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.ClientUser;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.User;
import com.eGSTbill.util.CommonUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

public class UserService {

	public String addUser(User user) {
		UserDAO dao = new UserDAO();
		return dao.addUser(user);
	}

	public String listusers() {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<User> lstUsers = null;
		UserDAO dao = new UserDAO();

		lstUsers = dao.listUsers();
		if (lstUsers == null || lstUsers.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstUsers);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}

	public String deleteUser(User user) {
		//System.out.println("in to delete user service");
		UserDAO dao = new UserDAO();
		return dao.deleteUser(user);
	}

	public boolean getProductByName(String sProductName) {
		boolean bProductExist = false;
		ArrayList<Product> lstProducts = null;
		ProductDAO dao = new ProductDAO();
		lstProducts = dao.getProductByName(sProductName);
		if (lstProducts == null || lstProducts.size() > 0) {
			bProductExist = true;
		}
		return bProductExist;
	}

	public boolean checkProductByName(String sProductName, String sProductId) {
		boolean bProductExist = false;
		ArrayList<Product> lstProducts = null;
		ProductDAO dao = new ProductDAO();
		lstProducts = dao.getProductByName(sProductName);
		if (lstProducts == null || lstProducts.size() > 0) {
			for(Product product : lstProducts){
				String sProdIdExst = product.getProductId();
				String sProdNameExst = product.getProductName();
					if(!StringUtils.equals(sProductId, sProdIdExst)){
						bProductExist = true;
						break;
					}
				
			}
		}
		return bProductExist;
	}
	
	public String updateUser(User user) {
		UserDAO dao = new UserDAO();
		return dao.updateUser(user);
	}
	
	public String user(User user,String sClientId){
		
		String sUserId = null;
		
		ClientUserDAO dao = new ClientUserDAO();
		ClientUser clientUser = new ClientUser();
		sUserId = CommonUtils.getDate();
		clientUser.setUserId(sUserId);
		clientUser.setClientId(sClientId);
		
		ClientUserService cu = new ClientUserService();
		//System.out.println("in to Client User");
		ClientUser clientuser = new ClientUser();
		clientuser.setClientId(sClientId);
		clientuser.setUserId(sUserId);
		/*billCartBillDetailsCart.setBillCartId(sBillCartId);
		billCartBillDetailsCart.setBillDetailsCartId(sBillDetCartId);*/
		
		String sClientUser = cu.addClientUser(clientuser);
		
		//String sResBcBilDetCart = bcbdc.addBillCartBillDetailsCart(billCartBillDetailsCart);
		
		
		
		
		
		//String addClientUser = clientUser.
		return dao.addClientUSer(clientUser);
	}
	public User getUserByMobile(String sMobileNo) {
		//System.out.println("in to user service");
		User userExst = null;
		User user = new User();
		user.setMobile(sMobileNo);
		//memberDto.setMobile(sMobileNo);
		UserDAO dao = new UserDAO();
		ArrayList<User> lstUsers = dao.getUserByMobile(user);
		if (lstUsers != null && lstUsers.size() > 0) {
			for (int i = 0; i < lstUsers.size(); i++) {
				userExst = lstUsers.get(i);
			}
		}

		return userExst;
	}
	
	
	public String passwordUpdate(User user) {
		UserDAO dao = new UserDAO();
		return dao.passwordUpdate(user);
	}
	
	public String listUsersByClientId(String clientId) {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<User> lstUsers = null;
		UserDAO dao = new UserDAO();
		lstUsers = dao.listUsersByClientId(clientId);
		//System.out.println("lstProducts size==========="+lstUsers.size());
		if (lstUsers == null || lstUsers.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstUsers);
				//System.out.println("result String list======"+sJson);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}
	/*public ArrayList<User> getUsersByMobileNo(String sClientId) {
		User bMobileNoExist = null;;
		ArrayList<User> lstUsers = null;
		UserDAO dao = new UserDAO();
		bMobileNoExist = dao.getUsersByMobileNo(sClientId);
		
		return bMobileNoExist;
	}*/
	
	public boolean getUsersByMobileNo(String sMobileNo,String clientId) {
		boolean bMobileNoExist = false;
		ArrayList<User> lstUsers = null;
		UserDAO dao = new UserDAO();
		lstUsers = dao.getUsersByMobileNo(sMobileNo,clientId);
		System.out.println(lstUsers.size());
		if (lstUsers != null && lstUsers.size() >= 1) {
			bMobileNoExist = true;
		}
		return bMobileNoExist;
	}
	public boolean checkUserByMobileNo(String sMobileNo, String clientId) {
		boolean bMobileExist = false;
		ArrayList<User> lstUsers = null;
		UserDAO dao = new UserDAO();
		//lstUsers = dao.getUsersByMobileNo(sMobileNo);
		lstUsers = dao.getUsersByMobileNo(sMobileNo, clientId);
		if (lstUsers == null || lstUsers.size() > 0) {
			for(User user : lstUsers){
				String sUserIdExst = user.getUserId();
				//String sMobileNoExst = product.getProductName();
					if(!StringUtils.equals(clientId, sUserIdExst)){
						bMobileExist = true;
						break;
					}
				
			}
		}
		return bMobileExist;
	}
}
