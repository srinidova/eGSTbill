package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.AutoIncrement;
import com.eGSTbill.model.Client;
import com.eGSTbill.model.Product;
import com.ibatis.sqlmap.client.SqlMapClient;

public class AutoIncrementDAO {

	
	
	@SuppressWarnings("unchecked")
	public ArrayList<AutoIncrement> getBillNo() {
		ArrayList<AutoIncrement> lstAutoIncrement= new ArrayList<AutoIncrement>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstAutoIncrement = (ArrayList<AutoIncrement>) session.queryForList("AutoIncrement.getBillNo");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstAutoIncrement;
	}
	public String updateBillNo(AutoIncrement autoIncrement) {
		String result = "fail";
		System.out.println("in to update AutoIncrementDAO dao----");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("AutoIncrement.updateBillNo", autoIncrement);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/*public String getBillNo(AutoIncrement autoIncrement) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("AutoIncrement.getBillNo", autoIncrement);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}*/
}
