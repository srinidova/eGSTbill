package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.ClientPurchaser;
import com.eGSTbill.model.PurchaserShipping;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ClientPurchaserDAO {

	public String addClientPurchaser(ClientPurchaser clientPurchaser) {
		String result = "fail";
		try {
			//System.out.println("in to ClientPurchaserDAO");
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("ClientPurchaser.addClientPurchaser", clientPurchaser);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}
