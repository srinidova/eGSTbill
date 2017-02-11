package com.eBilling.baseDao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.eBilling.model.Damage;
import com.eBilling.model.Product;
import com.eBilling.model.ProductStock;
import com.eBilling.util.CommonUtils;
import com.eBilling.util.GetAutoDate;
         
public class DamageBaseDao {

	private Logger logger = Logger.getLogger(DamageBaseDao.class);
	@Autowired
	public JdbcTemplate jdbcTemplate;

	//public final String INSERT_SQL = "INSERT INTO product( productId, productName,productType,mrp,updatedBy,updatedDate) values (?, ?,?, ?,?,?)";
    public final String INSERT_SQL ="INSERT INTO damage(damageId,productId,quantity,description,updatedOn,updatedBy) values (?,?,?,?,?,?)";
	@Transactional
	public boolean damageSave(final Damage damage) {
		boolean isSave = false;
		try{
			if (damage.getUpdatedOn() == null) {
				damage.setUpdatedOn(CommonUtils.getDate());
			}
			if (damage.getUpdatedBy()== null){
				damage.setUpdatedBy(CommonUtils.getDate());
			}
			
			int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] {damage.getDamageId(),damage.getProductId(),damage.getQuantity(),damage.getDescription(),damage.getUpdatedOn(),damage.getUpdatedBy()});
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}

	public boolean updateDamage(Damage damage) {
		boolean isUpdate = false;
		try {
			
			String sql = "UPDATE damage  set productId= ? , quantity= ?, description = ?,updatedOn = ?,updatedBy =?  where damageId = ? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] { damage.getProductId(),damage.getQuantity(),damage.getDescription(),damage.getUpdatedOn(),damage.getUpdatedBy(),damage.getDamageId()
							 
							 });
			System.out.println(sql);
			System.out.println("update:::"+update);
			//System.out.println(product.getProductId());
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdate;
	}

	public boolean deleteDamage(String sDamageId) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM damage WHERE damageId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { sDamageId });
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}

		return isDelete;
	}

	public Damage getProduct(String sdamageId) {
		List<Damage> lstDamage = null;
		try {
			String sql = "SELECT * from damage where damageId = ? ";
			lstDamage = jdbcTemplate.query(sql, new Object[] {sdamageId},
					new BeanPropertyRowMapper<Damage>(Damage.class));
			if (lstDamage.size() > 0)
				return lstDamage.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public List<Damage> getAllDamage() {
		List<Damage> lstDamage = null;
		try {
			String sql = "SELECT damageId,d.productId,p.productName,quantity, description  from damage d,product p where d.productId=p.productId";
			//System.out.println("sql:::"+sql);
			lstDamage = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Damage>(Damage.class));
			//System.out.println("lstDamage:::"+lstDamage);
		} catch (Exception e) {
			logger.error("Exception in getAllDamage in PopulateDaoImpl"+ e);
			e.printStackTrace();
		}
		return lstDamage;
	}
	
	public List<Damage> populate(String sql) {
		List<Damage> lstDamage = null;
		try {
			//list = getJdbcTemplate().query(sql, new PopulateRowMapper());
			lstDamage = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Damage>(Damage.class));

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			logger.fatal("error in populate in PopulateDaoImpl");
		} finally {

		}
		return lstDamage;
	}
	
	public List<Damage> getDamageById(String sDamageId) {
		List<Damage> lstDamage = null;
		try {
			String sql = "SELECT * from product where productName = ? ";
			lstDamage = jdbcTemplate.query(sql, new Object[] {sDamageId},
					ParameterizedBeanPropertyRowMapper
							.newInstance(Damage.class));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("getProduct=="+lstDamage);

		return lstDamage;
	}
	public List<Damage> getAllDamageProductsByProductId(String sProductId) {
		List<Damage> retlist = null;
		try {
			String sql = "SELECT *from damage where productId = ?";
			System.out.println("query for getAllProductStockByProductId===="+sql);
			retlist = jdbcTemplate.query(sql, new Object[] {sProductId}, new BeanPropertyRowMapper<Damage>(Damage.class));
			System.out.println("query for getAllProductStockByProductId===="+retlist.toString());
		} catch (Exception e) {
			//objLogger.error("Exception in BillingDetailsBaseDao in getAllBillDetailsByBillNo()" + e);
			e.printStackTrace();
		}

		return retlist;
	}
	public List<Damage> getDamageProductByProductName(String sProductId) {
		List<Damage> lstDamage = null;
		try {
			String sql = "SELECT * from damage where productId = ? ";
			lstDamage = jdbcTemplate.query(sql, new Object[] {sProductId},ParameterizedBeanPropertyRowMapper.newInstance(Damage.class));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("getProductId=="+lstDamage);

		return lstDamage;
	}
	
}
