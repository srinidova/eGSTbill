package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.BillCartBillDetailsCartDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.Product;
import com.fasterxml.jackson.databind.ObjectMapper;

public class BillCartBillDetailsCartService {

	public String addBillCartBillDetailsCart(BillCartBillDetailsCart billCartBillDetailsCart) {
		//System.out.println("in to BillCartBillDetailsCartService");
		BillCartBillDetailsCartDAO dao = new BillCartBillDetailsCartDAO();
		return dao.addBillCartBillDetailsCart(billCartBillDetailsCart);
	}

	
}
