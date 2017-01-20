package com.eBilling.baseDao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.model.Product;
import com.eBilling.util.CommonUtils;
import com.eBilling.util.GetAutoDate;
         
public class ProductBaseDao {

	private Logger logger = Logger.getLogger(ProductBaseDao.class);
	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO product( productId, productName,productType,mrp,updatedBy,updatedDate) values (?, ?,?, ?,?,?)";

	@Transactional
	public boolean productSave(final Product product) {
		boolean isSave = false;
		try{
			if (product.getUpdatedDate() == null) {
				product.setUpdatedDate(CommonUtils.getDate());
			}
			if (product.getUpdatedBy() == null) {
				product.setUpdatedBy(CommonUtils.getDate());
			}
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] {  product.getProductId(),
						product.getProductName(),product.getProductType(),product.getMrp(),product.getUpdatedBy(),product.getUpdatedDate()});
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}

	public boolean updateProduct(Product product) {
		boolean isUpdate = false;
		try {
			
			String sql = "UPDATE product  set productName= ? , productType= ?, mrp = ?,updatedBy = ?,updatedDate =?  where productId = ? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] { 
							 product.getProductName(), product.getProductType(),product.getMrp(),product.getUpdatedBy(),product.getUpdatedDate(),product.getProductId()
							 });
			System.out.println(sql);
			System.out.println(product.getProductId());
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdate;
	}

	public boolean deleteProduct(String sProductId) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM product WHERE productId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { sProductId });
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}

		return isDelete;
	}

	public Product getProduct(String sproductId) {
		List<Product> lstProduct = null;
		try {
			String sql = "SELECT * from product where productId = ? ";
			lstProduct = jdbcTemplate.query(sql, new Object[] {sproductId},
					new BeanPropertyRowMapper<Product>(Product.class));
			if (lstProduct.size() > 0)
				return lstProduct.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public List<Product> getAllProduct() {
		List<Product> lstProduct = null;
		try {
			String sql = "SELECT productId, productName, productType ,mrp  from product order by updatedDate desc";
			lstProduct = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
		} catch (Exception e) {
			logger.error("Exception in getAllProduct in PopulateDaoImpl"+ e);
		}
		return lstProduct;
	}
	
	public List<Product> populate(String sql) {
		List<Product> lstProduct = null;
		try {
			//list = getJdbcTemplate().query(sql, new PopulateRowMapper());
			lstProduct = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			logger.fatal("error in populate in PopulateDaoImpl");
		} finally {

		}
		return lstProduct;
	}
	
	public List<Product> getProductByName(String sProductName) {
		List<Product> lstProductModel = null;
		try {
			String sql = "SELECT * from product where productName = ? ";
			lstProductModel = jdbcTemplate.query(sql, new Object[] {sProductName},
					ParameterizedBeanPropertyRowMapper
							.newInstance(Product.class));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("getProduct=="+lstProductModel);

		return lstProductModel;
	}
	
}
