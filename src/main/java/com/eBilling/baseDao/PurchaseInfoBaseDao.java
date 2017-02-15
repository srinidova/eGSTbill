package com.eBilling.baseDao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.baseModel.PurchaserInfo;
import com.eBilling.util.CommonUtils;

public class PurchaseInfoBaseDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO purchaseinfo( name,mobileNo,address,eMail,updatedBy,updatedDate,purchaseId,tinNo) values (?, ?,?, ?,?,?,?,?)";

	@Transactional
	public boolean savePurchaseInfo(final PurchaserInfo purchaseInfo) {
		boolean isSave = false;
		try{
			if (purchaseInfo.getUpdatedDate() == null) {
				purchaseInfo.setUpdatedDate(CommonUtils.getDate());
			}
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] {  purchaseInfo.getName(),
						purchaseInfo.getMobileNo(),purchaseInfo.getAddress(),purchaseInfo.geteMail(),purchaseInfo.getUpdatedBy(),purchaseInfo.getUpdatedDate(),purchaseInfo.getPurchaseId(),purchaseInfo.getTinNo()});
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}

	public boolean updatePurchaseInfo(PurchaserInfo purchaseInfo) {
		boolean isUpdate = false;
		try {
			if (purchaseInfo.getUpdatedDate() == null) {
				purchaseInfo.setUpdatedDate(CommonUtils.getDate());
			}
			String sql = "UPDATE purchaseinfo  set name = ?, mobileNo = ?, address= ?, eMail=?,updatedBy = ?,updatedDate =?,tinNo=?  where purchaseId =? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] { 
							 StringUtils.trim(purchaseInfo.getName()),
							 StringUtils.trim(purchaseInfo.getMobileNo()),StringUtils.trim(purchaseInfo.getAddress()),StringUtils.trim(purchaseInfo.geteMail()),StringUtils.trim(purchaseInfo.getUpdatedBy()),StringUtils.trim(purchaseInfo.getUpdatedDate()),StringUtils.trim(purchaseInfo.getTinNo()),StringUtils.trim(purchaseInfo.getPurchaseId())
							 });
			System.out.println(sql);
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {

		}

		return isUpdate;
	}

	public boolean deletePurchaseInfo(String id) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM purchaseinfo WHERE purchaseId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { id });
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}

		return isDelete;
	}

	public PurchaserInfo getPurchaseInfo(String purchaseId) {
		List<PurchaserInfo> lstProduct = null;
		try {
			String sql = "SELECT * from purchaseinfo where purchaseId = ? ";
			lstProduct = jdbcTemplate.query(sql, new Object[] {purchaseId},
					new BeanPropertyRowMapper<PurchaserInfo>(PurchaserInfo.class));
			if (lstProduct.size() > 0)
				return lstProduct.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public List<PurchaserInfo> getAllPurchaseInfo() {
		List<PurchaserInfo> lstProduct = null;
		try {
			String sql = " SELECT * from purchaseinfo order by updatedDate desc";
			lstProduct = jdbcTemplate.query(sql, new BeanPropertyRowMapper<PurchaserInfo>(PurchaserInfo.class));
			System.out.println("sql=="+sql);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return lstProduct;
	}
	
	public List<PurchaserInfo> getPurchaseByName(String sPurchaseName) {
		List<PurchaserInfo> lstPurchaseInfoModel = null;
		try {
			String sql = "SELECT * from purchaseinfo where name = ? ";
			lstPurchaseInfoModel = jdbcTemplate.query(sql, new Object[] {sPurchaseName},
					ParameterizedBeanPropertyRowMapper
							.newInstance(PurchaserInfo.class));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("getProduct=="+lstPurchaseInfoModel.size());

		return lstPurchaseInfoModel;
	}
	
	public List<PurchaserInfo> checkEmailAndMobileNo(String sEmail, String sMobileNo) {
		List<PurchaserInfo> retlist = null;
		try {
			String sql = "SELECT * from purchaseinfo where eMail = ? and mobileNo=?";
			System.out.println("query----"+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {StringUtils.trim(sEmail),StringUtils.trim(sMobileNo)},new BeanPropertyRowMapper<PurchaserInfo>(PurchaserInfo.class));
			
			System.out.println("retlist----"+retlist.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	
}
