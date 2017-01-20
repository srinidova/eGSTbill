package com.eBilling.rowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.eBilling.model.Product;

public class PopulateRowMapper implements RowMapper<Product> {

	@Override
	public Product mapRow(ResultSet rs, int arg1) throws SQLException {
		Product ps = new Product();
		ps.setProductId(rs.getString(1));
		ps.setProductName(rs.getString(2));
		return ps;
	}

}
