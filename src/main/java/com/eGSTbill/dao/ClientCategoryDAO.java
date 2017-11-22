package com.eGSTbill.dao;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.Category;
import com.eGSTbill.model.ClientCategory;
import com.eGSTbill.model.ClientProduct;
import com.eGSTbill.model.PurchaserShipping;
import com.eGSTbill.model.Shipping;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ClientCategoryDAO {

	public String addClientCategory(ClientCategory clientCategory) {
		String result = "fail";
		try {
			//System.out.println("in to ClientProductDAO");
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("ClientCategory.addClientCategory", clientCategory);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Category> getCategoryByclientId(String sClientId){
		ArrayList<Category> lstCategory = new ArrayList<Category>();
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			ClientCategory cc = new ClientCategory();
			//System.out.println("From DAO sPurchaserId=="+sPurchaserId);
			if(StringUtils.isNotEmpty(sClientId)){
				cc.setClientId(sClientId);
			}
			lstCategory = (ArrayList<Category>) session.queryForList("ClientCategory.getCategoryByclientId", cc);
		}catch(Exception e){
			e.printStackTrace();
		}
		if (!lstCategory.equals(null)) {
			return lstCategory;
		} else {
			return lstCategory;
		}
	}	
}
