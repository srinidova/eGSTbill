package com.eBilling.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.eBilling.model.Product;
@Repository(value = "serviceDao")
public interface ServiceDao  {
	
	public Map<String, String> populatePopUp(String sql);
	public java.util.List<Product> populate(String sql);

	/*public Integer DuplicateCheck(String sql);
	public java.util.List<Product> populate(String sql);
	//public List<ClientInfoBean> populateClient(String sql);

	public String getId(String sql);*/

}
