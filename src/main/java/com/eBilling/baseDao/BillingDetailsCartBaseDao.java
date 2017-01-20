package com.eBilling.baseDao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.baseModel.BillingDetailsCart;
import com.eBilling.model.BillingDetails;

public class BillingDetailsCartBaseDao {

	Logger objLogger = Logger.getLogger(BillingDetailsCartBaseDao.class);	
	@Autowired
	public JdbcTemplate jdbcTemplate;
	public final String INSERT_SQL = "INSERT INTO billingdetailscart(billDetailsId, billId, productId, quantity, rate, amount, mrp) values (?, ?,?, ?,?,?,?)";

	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public boolean saveBillDetailsCart(final BillingDetailsCart billingdetailsCart ) {
		boolean isSave = false;
		try{
			/*if (product.getUpdatedDate() == null) {
				billingDetails.setUpdatedDate(new java.sql.Date(new Date().getTime()));
			}
			java.sql.Timestamp updatedDate = new java.sql.Timestamp(billingDetails
					.getUpdatedDate().getTime());*/

			System.out.println("111billingdetailsCart==="+billingdetailsCart.toString());
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] {billingdetailsCart.getBillDetailsId(), billingdetailsCart.getBillId(), billingdetailsCart.getProductId(), billingdetailsCart.getQuantity(), billingdetailsCart.getRate(), billingdetailsCart.getAmount(), billingdetailsCart.getMrp()});
			System.out.println("222insert==="+insert);
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("333isSave==="+isSave);
		return isSave;
	}
	public List<BillingDetailsCart> getAllBillDetailsByBillId( String sBillId) {
		List<BillingDetailsCart> retlist = null;
		try {
			String sql = "SELECT billDetailsId,billId,bd.productId,quantity,rate,amount,bd.mrp,p.productName FROM billingdetailscart bd,product p WHERE bd.productId =p.productId AND billId = ? ";
			retlist = jdbcTemplate.query(sql, new Object[] {sBillId}, new BeanPropertyRowMapper<BillingDetailsCart>(BillingDetailsCart.class));
		} catch (Exception e) {
			objLogger.error("Exception in BillingDetailsBaseDao in getAllBillDetailsByBillId()" + e);
		}

		return retlist;
	}
	public boolean deleteBillDetailsCart(String billId) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM billingdetailscart WHERE billId = ?";
			int delete = jdbcTemplate.update(sql, new Object[] { billId });
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}

		return isDelete;
	}
	
	public boolean deleteBillingDetailsCart(String sBillDeatailsId) {
		boolean isDelete = false;
		try {
			System.out.println("delete sBillDeatailsId==="+sBillDeatailsId);
			String sql = "DELETE FROM billingdetailscart WHERE billDetailsId = ?";
			System.out.println("delete Query=="+sql);
			int delete = jdbcTemplate.update(sql, new Object[] { sBillDeatailsId });
			System.out.println("delete==="+delete);
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception in deleteBillingDetailsCart()");
		}

		return isDelete;
	}
	public List<BillingDetailsCart> getAllBillDetailsCartByBillId(String sBillId) {
		List<BillingDetailsCart> retlist = null;
		try {
			String sql = "SELECT billDetailsId,billId,bd.productId,quantity,rate,amount,bd.mrp,p.productName FROM billingdetailscart bd,product p WHERE bd.productId =p.productId AND billId = ?";
			System.out.println("query for getAllBillDetailsCartByBillId===="+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {sBillId}, new BeanPropertyRowMapper<BillingDetailsCart>(BillingDetailsCart.class));
		} catch (Exception e) {
			objLogger.error("Exception in BillingDetailsBaseDao in getAllBillDetailsCartByBillId()" + e);
		}

		return retlist;
	}


}
