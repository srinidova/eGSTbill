package com.eGSTbill.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.connection.IbatisFactory;
import com.eGSTbill.model.Client;
import com.eGSTbill.model.ClientPurchaser;
import com.eGSTbill.model.Purchaser;
import com.eGSTbill.model.User;
import com.ibatis.sqlmap.client.SqlMapClient;

import freemarker.template.utility.StringUtil;

public class PurchaserDAO {

	public String addPurchaser(Purchaser newPurchaser) {
		//System.out.println("result in dao====getCompanyName===="+newPurchaser.getCompanyName());
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
		//System.out.println("inside list dao");
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
		//System.out.println("in to update purchaser");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Purchaser.updatePurchaser", newPurchaser);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Purchaser> listPurchasersByClientId(String sClientId) {
		ArrayList<Purchaser> lstPurchasers = new ArrayList<Purchaser>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			ClientPurchaser cp = new ClientPurchaser();
			////System.out.println("sClientId=="+sClientId);
			if (StringUtils.isNotEmpty(sClientId)) {
				cp.setClientId(sClientId);
			}
			lstPurchasers = (ArrayList<Purchaser>) session.queryForList("Purchaser.listPurchasersByClientId", cp);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstPurchasers;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<Purchaser> getPurchasersByMobileNo(String sMobileNo,String clientId) {
		ArrayList<Purchaser> lstPurchasers = new ArrayList<Purchaser>();
		System.out.println("in to purchaserDAO "+sMobileNo);
		try {
			 SqlMapClient session = new IbatisFactory().getSession();
			 Map<String,String> param = new HashMap<>();
			 param.put("clientId", clientId);
			 param.put("mobileNo", sMobileNo);
			 System.out.println("param-----"+param);
			 lstPurchasers = (ArrayList<Purchaser>) session.queryForList("Purchaser.getPurchasersByMobileNo",param);
			 System.out.println("in to get purchaser by mobile number "+lstPurchasers);
			// System.out.println("in to getUsersByMobileNo      "+lstPurchasers.get(0).getMobileNo());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return lstPurchasers;
}
}
