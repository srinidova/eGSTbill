package com.eBilling.baseDao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.model.ProductStock;
import com.eBilling.model.StockDetails;
import com.eBilling.util.CommonUtils;
         
public class StockDetailsBaseDao {

	private Logger logger = Logger.getLogger(StockDetailsBaseDao.class);
	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO stockDetails( productId,stockDetailsId,transactionType,quantity,transactionId,transactionDate,updatedBy,oldQuantity,newQuantity) values (?, ?,?, ?,?,?,?,?,?)";

	@Transactional
	public boolean saveStockDetails(final StockDetails stockDetails) {
		boolean isSave = false;
		try{
			
			if (stockDetails.getUpdatedBy() == null) {
				stockDetails.setUpdatedBy(CommonUtils.getDate());
			}
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] {  stockDetails.getProductId(),
						stockDetails.getStockDetailsId(),stockDetails.getTransactionType(),stockDetails.getQuantity(),stockDetails.getTransactionId(),stockDetails.getTransactionDate(),stockDetails.getUpdatedBy(),stockDetails.getOldQuantity(),stockDetails.getNewQuantity()});
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}
	public boolean updateStockDetails(StockDetails stockDetails) {
		boolean isUpdate = false;
		try {
			
			if (stockDetails.getUpdatedBy() == null) {
				stockDetails.setUpdatedBy(CommonUtils.getDate());
			}
			String sql = "UPDATE stockDetails  set transactionType=?,quantity=?,transactionId=?,transactionDate=?,updatedBy=? where productId = ? ";
			System.out.println("sql==="+sql);
			int update = jdbcTemplate.update(
					sql,
					new Object[] {
							
							stockDetails.getTransactionType(),stockDetails.getQuantity(),stockDetails.getTransactionId(),stockDetails.getTransactionDate(),stockDetails.getUpdatedBy(),stockDetails.getProductId()
							 });
			System.out.println("update111==="+update);
			System.out.println(sql);
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdate;
	}
	public List<StockDetails> getStockDetailsByProductId(String sProductId) {
		List<StockDetails> retlist = null;
		try {
			String sql = "SELECT *from productstock where productId = ?";
			System.out.println("query for getAllProductStockByProductId===="+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {sProductId}, new BeanPropertyRowMapper<StockDetails>(StockDetails.class));
		} catch (Exception e) {
			//objLogger.error("Exception in BillingDetailsBaseDao in getAllBillDetailsByBillNo()" + e);
			e.printStackTrace();
		}

		return retlist;
	}
	
	public List<StockDetails> getProductStockDetailsByProductId(String sProductId) {
		List<StockDetails> retlist = null;
		try {
			String sql = "SELECT s.productId,transactionType,quantity,transactionDate,p.productName,oldQuantity,newQuantity from stockdetails s,product p where s.productId = p.productId and s.productId =?";
			System.out.println("query for getProductStockDetailsByProductId===="+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {sProductId}, new BeanPropertyRowMapper<StockDetails>(StockDetails.class));
		} catch (Exception e) {
			//objLogger.error("Exception in BillingDetailsBaseDao in getProductStockDetailsByProductId()" + e);
			e.printStackTrace();
		}

		return retlist;
	}

	
}
