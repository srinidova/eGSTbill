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

public class BillingDetailsBaseDao {

	Logger objLogger = Logger.getLogger(BillingDetailsBaseDao.class);	
	@Autowired
	public JdbcTemplate jdbcTemplate;
	public final String INSERT_SQL = "INSERT INTO billingdetailscart(billDetailsId, billId, productId, quantity, rate, amount, mrp) values (?, ?,?, ?,?,?,?)";

	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public String saveBillDetails(final BillingDetails billingdetails ) {
		String isSave = null;
		try{
			/*if (product.getUpdatedDate() == null) {
				billingDetails.setUpdatedDate(new java.sql.Date(new Date().getTime()));
			}
			java.sql.Timestamp updatedDate = new java.sql.Timestamp(billingDetails
					.getUpdatedDate().getTime());*/

			System.out.println("111billingdetails==="+billingdetails.toString());
			final String INSERT_SQL1 = "INSERT INTO billingdetails(billDetailsId, billId, productId, quantity, rate, amount, mrp) values (?, ?,?, ?,?,?,?)";
			System.out.println("INSERT_SQL1==="+INSERT_SQL1);
			int insert = jdbcTemplate.update(
				INSERT_SQL1,
				new Object[] {billingdetails.getBillDetailsId(), billingdetails.getBillId(), billingdetails.getProductId(), billingdetails.getQuantity(), billingdetails.getRate(), billingdetails.getAmount(), billingdetails.getMrp()});
			System.out.println("222insert==="+insert);
		if (insert > 0) {
			//isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}

	public boolean updateBillDetails(BillingDetailsCart billingDetails) {
		boolean isUpdate = false;
		try {
			/*if (billingDetails.getUpdatedDate() == null) {
				billingDetails.setUpdatedDate(new java.sql.Date(new Date().getTime()));
			}
			java.sql.Timestamp updatedDate = new java.sql.Timestamp(billingDetails
					.getUpdatedDate().getTime());*/
			System.out.println("BillingDetailsCart=getQuantity=="+billingDetails.getQuantity());
			System.out.println("BillingDetailsCart=getRate=="+billingDetails.getRate());
			System.out.println("BillingDetailsCart=getAmount=="+billingDetails.getAmount());
			System.out.println("BillingDetailsCart=getBillDetailsId=="+billingDetails.getBillDetailsId());
			
			String sql = "UPDATE billingdetailscart  set  quantity = ?,rate = ?,amount =? where productId = ? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] { 
							billingDetails.getQuantity(),billingDetails.getRate(),billingDetails.getAmount(),billingDetails.getProductId()
							 });
			System.out.println(sql);
			System.out.println(billingDetails.getBillId());
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {

		}

		return isUpdate;
	}

	public boolean deleteBillDetails(String billDetailsId) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM billingdetailscart WHERE billDetailsId = ?";
			int delete = jdbcTemplate.update(sql, new Object[] { billDetailsId });
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}

		return isDelete;
	}
	
	

	public List<BillingDetailsCart> getProduct(int id) {
		List<BillingDetailsCart> retlist = null;
		try {
			String sql = "SELECT * from billingdetailscart where billDetailsId = ? ";
			retlist = jdbcTemplate.query(sql, new Object[] {id},
					ParameterizedBeanPropertyRowMapper
							.newInstance(BillingDetailsCart.class));
			if (retlist.size() > 0)
				return retlist;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public BillingDetailsCart getBillDetails(String billDetailsId) {
		List<BillingDetailsCart> retlist = null;
		try {
			String sql = "SELECT * from billingdetailscart where billDetailsId = ? ";
			retlist = jdbcTemplate.query(sql, new Object[] {billDetailsId},
					ParameterizedBeanPropertyRowMapper
							.newInstance(BillingDetailsCart.class));
			if (retlist.size() > 0)
				return retlist.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public List<BillingDetailsCart> getAllBillDetails() {
		List<BillingDetailsCart> retlist = null;
		try {
			String sql = "SELECT billDetailsId,billId,bd.productId,quantity,rate,amount,bd.mrp,p.productName FROM billingdetailscart bd,product p WHERE bd.productId =p.productId";
			retlist = jdbcTemplate.query(sql, new BeanPropertyRowMapper<BillingDetailsCart>(BillingDetailsCart.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	
	public List<BillingDetails> getAllBillDetailsByBillNo(String sBillId) {
		List<BillingDetails> retlist = null;
		try {
			String sql = "SELECT billDetailsId,billId,bd.productId,quantity,rate,amount,bd.mrp,p.productName FROM billingdetails bd,product p WHERE bd.productId =p.productId AND billId = ?";
			System.out.println("query for getAllBillDetailsByBillNo===="+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {sBillId}, new BeanPropertyRowMapper<BillingDetails>(BillingDetails.class));
		} catch (Exception e) {
			objLogger.error("Exception in BillingDetailsBaseDao in getAllBillDetailsByBillNo()" + e);
		}

		return retlist;
	}
	
	





}
