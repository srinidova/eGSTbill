package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.Client;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.Purchases;
import com.ibatis.sqlmap.client.SqlMapClient;

public class PurchasesDAO {

	public String addPurchases(Purchases purchases) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Purchases.addPurchases", purchases);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Purchases> listPurchases(){
		ArrayList<Purchases> lstPurchases = new ArrayList<Purchases>();
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			lstPurchases = (ArrayList<Purchases>) session.queryForList("Purchases.listPurchases");
		}catch(Exception e){
			e.printStackTrace();
		}
		if(!lstPurchases.equals(null)){
			return lstPurchases;
		}else{
			return lstPurchases;
		}
		
	}
	public String deletePurchases(Purchases purchases){
		String result = "fail";
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("Purchases.deletePurchases", purchases);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public String updatePurchases(Purchases purchases){
		String result = "fail";
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Purchases.updatePurchases", purchases);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
}
