package com.eBilling.baseDao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.model.ProductStock;
import com.eBilling.model.ProductStock;
import com.eBilling.model.Register;
import com.eBilling.util.CommonUtils;
         
public class ProductStockBaseDao {

	private Logger logger = Logger.getLogger(ProductStockBaseDao.class);
	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO productstock( productId,stock,oldStock,newStock,updateOn,updateBy,stockId) values (?, ?,?, ?,?,?,?)";

	@Transactional
	public boolean saveProductStock(final ProductStock productStock) {
		boolean isSave = false;
		try{
			if (productStock.getUpdatedOn() == null) {
				productStock.setUpdatedOn(CommonUtils.getDate());
			}
			if (productStock.getUpdatedBy() == null) {
				productStock.setUpdatedBy(CommonUtils.getDate());
			}
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] {  productStock.getProductId(),
						productStock.getStock(),productStock.getOldStock(),productStock.getNewStock(),productStock.getUpdatedOn(),productStock.getUpdatedBy(),productStock.getStockId()});
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}
	public boolean updateProductStock(ProductStock productStock) {
		boolean isUpdate = false;
		try {
			if (productStock.getUpdatedOn() == null) {
				productStock.setUpdatedOn(CommonUtils.getDate());
			}
			if (productStock.getUpdatedBy() == null) {
				productStock.setUpdatedBy(CommonUtils.getDate());
			}
			String sql = "UPDATE productstock  set stock=?,oldStock=?,newStock=?,updateOn=?,updateBy=? where stockId = ? ";
			System.out.println("sql==="+sql);
			int update = jdbcTemplate.update(
					sql,
					new Object[] {
							productStock.getStock(),productStock.getOldStock(),productStock.getNewStock(),productStock.getUpdatedOn(),productStock.getUpdatedBy(),productStock.getStockId()
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
	
	
	/*public boolean updateNewProductStock(ProductStock productStock) {
		boolean isUpdate = false;
		try {
			if (productStock.getUpdatedOn() == null) {
				productStock.setUpdatedOn(CommonUtils.getDate());
			}
			if (productStock.getUpdatedBy() == null) {
				productStock.setUpdatedBy(CommonUtils.getDate());
			}
			String sql = "UPDATE productStock  set stock=?,oldStock=?,newStock=?,updateOn=?,updateBy=? where stockId = ? ";
			System.out.println("sql==="+sql);
			int update = jdbcTemplate.update(
					sql,
					new Object[] {
							productStock.getStock(),productStock.getOldStock(),productStock.getNewStock(),productStock.getUpdatedOn(),productStock.getUpdatedBy(),productStock.getStockId()
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
	}*/
	public boolean deleteProductStock(String id) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM productstock WHERE stockId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { id });
			System.out.println("delete row"+delete);
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isDelete;
	}

	
	public List<ProductStock> getAllProductStock() {
		List<ProductStock> retlist = null;
		try {
			String sql = "SELECT ps.productId,stock,oldStock,newStock,p.productName,stockId from productstock ps,product p where ps.productId=p.productId";
			retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(ProductStock.class));
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
	public List<ProductStock> getAllProductStockByProductId(String sProductId) {
		List<ProductStock> retlist = null;
		try {
			String sql = "SELECT ps.productId,stock,oldStock,newStock,p.productName,stockId FROM productstock ps,product p  where ps.productId = p.productId and ps.productId =?";
			System.out.println("query for getAllProductStockByProductId===="+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {sProductId}, new BeanPropertyRowMapper<ProductStock>(ProductStock.class));
		} catch (Exception e) {
			//objLogger.error("Exception in BillingDetailsBaseDao in getAllBillDetailsByBillNo()" + e);
			e.printStackTrace();
		}

		return retlist;
	}
	
}
