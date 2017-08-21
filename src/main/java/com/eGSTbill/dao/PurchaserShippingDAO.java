package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.PurchaserShipping;
import com.ibatis.sqlmap.client.SqlMapClient;

public class PurchaserShippingDAO {

	public String addPurchaserShipping(PurchaserShipping purchaserShipping) {
		String result = "fail";
		try {
			System.out.println("in to BillCartBillDetailsCartDAO");
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("PurchaserShipping.addPurchaserShipping", purchaserShipping);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<PurchaserShipping> getShippingDetailsBypurchaserId(PurchaserShipping purchaserShipping) {
		ArrayList<PurchaserShipping> purchasershipping = new ArrayList<PurchaserShipping>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("purchaserShipping.getPurchaserId() =="+purchaserShipping.getPurchaserId());
			purchasershipping = (ArrayList<PurchaserShipping>) session.queryForList("PurchaserShipping.getShippingDetailsBypurchaserId", purchaserShipping.getPurchaserId());
			System.out.println("purchasershipping.size =="+purchasershipping.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return purchasershipping;
	}
}
