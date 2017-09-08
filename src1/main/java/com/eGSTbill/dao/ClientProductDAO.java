package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.ClientProduct;
import com.eGSTbill.model.PurchaserShipping;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ClientProductDAO {

	public String addClientProduct(ClientProduct clientProduct) {
		String result = "fail";
		try {
			System.out.println("in to ClientProductDAO");
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("ClientProduct.addClientProduct", clientProduct);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}
