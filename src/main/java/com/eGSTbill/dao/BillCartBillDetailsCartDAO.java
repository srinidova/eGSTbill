package com.eGSTbill.dao;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.ibatis.sqlmap.client.SqlMapClient;

public class BillCartBillDetailsCartDAO {

	public String addBillCartBillDetailsCart(BillCartBillDetailsCart billCartBillDetailsCart) {
		String result = "fail";
		try {
			//System.out.println("in to BillCartBillDetailsCartDAO");
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("BillCartBillDetailsCart.addBillCartBillDetailsCart", billCartBillDetailsCart);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}
