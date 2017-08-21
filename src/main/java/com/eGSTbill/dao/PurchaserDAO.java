package com.eGSTbill.dao;

import java.util.ArrayList;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.Purchaser;
import com.ibatis.sqlmap.client.SqlMapClient;

public class PurchaserDAO {

	public String addPurchaser(Purchaser newPurchaser) {
		System.out.println("result in dao====getCompanyName===="+newPurchaser.getCompanyName());
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Purchaser.addPurchaser", newPurchaser);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Purchaser> listPurchaser() {
		System.out.println("inside list dao");
		ArrayList<Purchaser> listPurchasers = new ArrayList<Purchaser>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			listPurchasers = (ArrayList<Purchaser>) session.queryForList("Purchaser.listPurchaser");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!listPurchasers.equals(null)) {
			return listPurchasers;
		} else {
			return listPurchasers;
		}
	}

	public String deletePurchaser(Purchaser newPurchaser) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Purchaser.deletePurchaser", newPurchaser);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/*@SuppressWarnings("unchecked")
	public ArrayList<Purchaser> getPurchaserByName(String sCmpnyName) {
		ArrayList<Purchaser> lstPurchaser = new ArrayList<Purchaser>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstPurchaser = (ArrayList<Purchaser>) session.queryForList("Purchaser.getPurchaserByName", sCmpnyName);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstPurchaser;
	}
*/
	public String updatePurchaser(Purchaser newPurchaser) {
		String result = "fail";
		System.out.println("in to update purchaser");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Purchaser.updatePurchaser", newPurchaser);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
