package com.eBilling.baseDao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.model.Product;
import com.eBilling.model.Status;
import com.eBilling.util.CommonUtils;
import com.eBilling.util.GetAutoDate;
         
public class StatusBaseDao {

	private Logger logger = Logger.getLogger(StatusBaseDao.class);
	@Autowired
	public JdbcTemplate jdbcTemplate;
    
	public final String INSERT_SQL = "INSERT INTO status( statusId,status,statusPriority,description) values (?, ?,?, ?)";
		
	@Transactional
	public boolean statusSave(final Status status) {
		boolean isSave = false;
		try{
			/*if (product.getUpdatedDate() == null) {
				product.setUpdatedDate(CommonUtils.getDate());
			}*/
			//System.out.println("hiiiiiiiii111111111iiii"+INSERT_SQL);
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] {status.getStatusId(),status.getStatus(),status.getStatusPriority(),status.getDescription()});
			//System.out.println("hjodnevjefi"+insert);
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}

	public boolean updateStatus(Status status) {
		boolean isUpdate = false;
		try {
			
			String sql = "UPDATE status  set status= ? , description= ?, statusPriority = ?  where statusId = ? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] { 
							 status.getStatus(),status.getDescription(),status.getStatusPriority(),status.getStatusId() 
							 });
			System.out.println(sql);
			System.out.println(status.getStatusId());
			System.out.println("updateupdateupdateupdate"+update);
			
			//System.out.println(product.getProductId());
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdate;
	}

	public boolean deleteStatus(String sStatusId) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM status WHERE statusId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { sStatusId });
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}

		return isDelete;
	}

	/*public Product getProduct(String sproductId) {
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
	}*/
	
	public List<Status> getAllStatus() {
		List<Status> lstStatus = null;
		try {
			String sql = "SELECT * from status ";
			lstStatus = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Status>(Status.class));
		} catch (Exception e) {
			logger.error("Exception in getAllStatus in PopulateDaoImpl"+ e);
		}
		return lstStatus;
	}
	
	/*public List<Product> populate(String sql) {
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
	}*/
	
	public List<Status> getStatusByName(String sStatus) {
		List<Status> lstStatus = null;
		try {
			String sql = "SELECT * from status where status = ? ";
			lstStatus = jdbcTemplate.query(sql, new Object[] {sStatus},
					ParameterizedBeanPropertyRowMapper
							.newInstance(Status.class));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("getStatus=="+lstStatus);

		return lstStatus;
	}
	
}
