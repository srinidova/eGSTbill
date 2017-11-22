package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.BillCartBillDetailsCartDAO;
import com.eGSTbill.dao.ClientCategoryDAO;
import com.eGSTbill.dao.ClientProductDAO;
import com.eGSTbill.dao.ProductCategoryDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.dao.PurchaserShippingDAO;
import com.eGSTbill.dao.ShippingDAO;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.Category;
import com.eGSTbill.model.ClientCategory;
import com.eGSTbill.model.ClientProduct;
import com.eGSTbill.model.Product;
import com.eGSTbill.model.ProductCategory;
import com.eGSTbill.model.PurchaserShipping;
import com.eGSTbill.model.Shipping;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ProductCategoryService {

	public String addProductCategory(ProductCategory productCategory) {
		//System.out.println("in to ClientProductService");
		ProductCategoryDAO dao = new ProductCategoryDAO();
		return dao.addProductCategory(productCategory);
	}

	public String getCategoryByclientId(String sClientId) {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<Category> lstCategory = null;
		ClientCategoryDAO dao = new ClientCategoryDAO();

		lstCategory = dao.getCategoryByclientId(sClientId);
		if (lstCategory == null || lstCategory.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstCategory);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}

}
