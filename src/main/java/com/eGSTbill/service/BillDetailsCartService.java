package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.BillDetailsCartDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.model.BillCartBillDetailsCart;
import com.eGSTbill.model.BillDetailsCart;
import com.eGSTbill.model.Product;
import com.eGSTbill.util.CommonUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

public class BillDetailsCartService {

	public String addBillDetailsCart(BillDetailsCart billDetailsCart) {
		BillDetailsCartDAO dao = new BillDetailsCartDAO();
		return dao.addBillDetailsCart(billDetailsCart);
	}

	public String listBillDetailsCart() {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<BillDetailsCart> lstBillDetailsCart = null;
		BillDetailsCartDAO dao = new BillDetailsCartDAO();

		lstBillDetailsCart = dao.listBillDetailsCart();
		//System.out.println("in to listBillDetails=========="+lstBillDetailsCart.size());
		if (lstBillDetailsCart == null || lstBillDetailsCart.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstBillDetailsCart);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}

	public String deleteBillDetailsCart(BillDetailsCart billDetailsCart) {
		//System.out.println("in to billDetailsCart Service");
		BillDetailsCartDAO dao = new BillDetailsCartDAO();
		return dao.deleteBillDetailsCart(billDetailsCart);
	}

	public boolean getBillDetailsCartByProductName(String sProductName) {
		boolean bBillDetailsCartExist = false;
		ArrayList<BillDetailsCart> lstBillDetailsCart = null;
		BillDetailsCartDAO dao = new BillDetailsCartDAO();
		lstBillDetailsCart = dao.getBillDetailsCartByProductName(sProductName);
		if (lstBillDetailsCart == null || lstBillDetailsCart.size() > 0) {
			bBillDetailsCartExist = true;
		}
		return bBillDetailsCartExist;
	}

	public String updateBillDetailsCart(BillDetailsCart billDetailsCart) {
		//System.out.println("in to update BillCartDetails service");
		BillDetailsCartDAO dao = new BillDetailsCartDAO();
		return dao.updateBillDetailsCart(billDetailsCart);
	}
	
	public String billProduct(Product product, String sBillCartId) {
		String result = "fail";
		double dAmount = 0.0;
		double dTaxVal = 0.0;
		double dCgstAmt = 0.0;
		double dSgstAmt = 0.0;
		double dTotal = 0.0;
		String sBillDetCartId = null;
		try {
			double dQty = Double.parseDouble(product.getQuantity());
			double dRate = Double.parseDouble(product.getSalePrice());
			dAmount = dQty * dRate;
			
			double dDisc = Double.parseDouble(product.getDiscount());
			dTaxVal = dAmount - dDisc;
			
			double dCgstRate = Double.parseDouble(product.getcGST());
			dCgstAmt = dTaxVal * (dCgstRate/100);
			
			double dSgstRate = Double.parseDouble(product.getsGST());
			dSgstAmt = dTaxVal * (dSgstRate/100);
			
			dTotal = dTaxVal + dCgstAmt  + dSgstAmt;
			
			sBillDetCartId = CommonUtils.getAutoGenId();
			

			
			BillDetailsCart billDetailsCart = new BillDetailsCart();
			billDetailsCart.setBillDetailsCartId(sBillDetCartId);
			billDetailsCart.setProductId(product.getProductId());
			billDetailsCart.setProductName(product.getProductName());
			billDetailsCart.setQuantity(product.getQuantity());
			billDetailsCart.setRate(product.getSalePrice());
			billDetailsCart.setAmount(String.format("%.2f",dAmount));
			billDetailsCart.setDiscount(product.getDiscount());
			billDetailsCart.setTaxableValue(String.format("%.2f",dTaxVal));
			billDetailsCart.setCgstRate(product.getcGST());
			billDetailsCart.setCgstAmount(String.format("%.2f",dCgstAmt));
			billDetailsCart.setSgstRate(product.getsGST());
			billDetailsCart.setSgstAmount(String.format("%.2f",dSgstAmt));
			billDetailsCart.setTotal(String.format("%.2f",dTotal));
			billDetailsCart.setUom(product.getUom());
			billDetailsCart.setHsnCode(product.getHsnCode());
		
			/******** adding to  BillDetailsCart ********/
			String sResBilDetCart = addBillDetailsCart(billDetailsCart);
			
			
			/******** adding to  BillCart_BillDetailsCart ********/
			BillCartBillDetailsCartService bcbdc = new BillCartBillDetailsCartService();
			//System.out.println("in to BillCart_BillDetailsCart");
			BillCartBillDetailsCart billCartBillDetailsCart = new BillCartBillDetailsCart();
			billCartBillDetailsCart.setBillCartId(sBillCartId);
			billCartBillDetailsCart.setBillDetailsCartId(sBillDetCartId);
			
			String sResBcBilDetCart = bcbdc.addBillCartBillDetailsCart(billCartBillDetailsCart);
			
			if(sResBilDetCart.equals("success") && sResBcBilDetCart.equals("success")){
				result = "success";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public ArrayList<BillDetailsCart> getBillDetailsCartByBillId(String sBillId) {
		ArrayList<BillDetailsCart> lstBillDetailsCart = null;
		BillDetailsCartDAO dao = new BillDetailsCartDAO();
		lstBillDetailsCart = dao.getBillDetailsCartByBillId(sBillId);
		//System.out.println("From BillCartDetails service getBillDetailsCartByBillId lstBillDetailsCart=="+lstBillDetailsCart.size());

		return lstBillDetailsCart;
	}
	
	public String updateBillProduct(Product product, String sBillCartId) {
		
		String result = "fail";
		double dAmount = 0.0;
		double dTaxVal = 0.0;
		double dCgstAmt = 0.0;
		double dSgstAmt = 0.0;
		double dTotal = 0.0;
		
		try {
			double dQty = Double.parseDouble(product.getQuantity());
			double dRate = Double.parseDouble(product.getSalePrice());
			dAmount = dQty * dRate;
			
			double dDisc = Double.parseDouble(product.getDiscount());
			dTaxVal = dAmount - dDisc;
			
			double dCgstRate = Double.parseDouble(product.getcGST());
			dCgstAmt = dTaxVal * (dCgstRate/100);
			
			double dSgstRate = Double.parseDouble(product.getsGST());
			dSgstAmt = dTaxVal * (dSgstRate/100);
			
			dTotal = dTaxVal + dCgstAmt  + dSgstAmt;
			
			
		

			BillDetailsCart billDetailsCart = new BillDetailsCart();
			billDetailsCart.setBillDetailsCartId(sBillCartId);
			billDetailsCart.setProductId(product.getProductId());
			billDetailsCart.setProductName(product.getProductName());
			billDetailsCart.setQuantity(product.getQuantity());
			billDetailsCart.setRate(product.getSalePrice());
			billDetailsCart.setAmount(String.format("%.2f",dAmount));
			billDetailsCart.setDiscount(product.getDiscount());
			billDetailsCart.setTaxableValue(String.format("%.2f",dTaxVal));
			billDetailsCart.setCgstRate(product.getcGST());
			billDetailsCart.setCgstAmount(String.format("%.2f",dCgstAmt));
			billDetailsCart.setSgstRate(product.getsGST());
			billDetailsCart.setSgstAmount(String.format("%.2f",dSgstAmt));
			billDetailsCart.setTotal(String.format("%.2f",dTotal));
		
			/******** updating to  BillDetailsCart ********/
			String sResBilDetCart = updateBillDetailsCart(billDetailsCart);
			
			
			/******** adding to  BillCart_BillDetailsCart ********//*
			BillCartBillDetailsCartService bcbdc = new BillCartBillDetailsCartService();
			//System.out.println("in to BillCart_BillDetailsCart");
			BillCartBillDetailsCart billCartBillDetailsCart = new BillCartBillDetailsCart();
			billCartBillDetailsCart.setBillCartId(sBillCartId);
			billCartBillDetailsCart.setBillDetailsCartId(sBillDetCartId);*/
			
			//String sResBcBilDetCart = bcbdc.addBillCartBillDetailsCart(billCartBillDetailsCart);
			
			if(sResBilDetCart.equals("success")){
				result = "success";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public BillDetailsCart isProductBilled(Product product, String sBillCartId){
		BillDetailsCart existBilDetCart = null;
		
		String sProdId = product.getProductId();
		
		ArrayList<BillDetailsCart> lstBillDetailsCart = getBillDetailsCartByBillId(sBillCartId);
		for(BillDetailsCart bdc : lstBillDetailsCart){
			String sExstProdId = bdc.getProductId();
			////System.out.println("sProdId==="+sProdId+"---------sExstProdId==="+sExstProdId);
			if(sProdId.equals(sExstProdId)){
				existBilDetCart = bdc;
				break;
			}
		}
		
		return existBilDetCart;
	}
	
	public String updateProdQty(BillDetailsCart existBilDetCart, Product product){
		String result = "fail";
		
		String sExstQty = existBilDetCart.getQuantity();
		String sExstRate = existBilDetCart.getRate();
		
		
		String sNewQty = product.getQuantity();
		String sNewRate = product.getSalePrice();
		
		
		////System.out.println("sExstQty==="+sExstQty+"---------sNewQty==="+sNewQty);
		int iQty = Integer.parseInt(sExstQty) + Integer.parseInt(sNewQty) ;
		////System.out.println("iQty==="+iQty);
		product.setQuantity(String.valueOf(iQty));
		
		//System.out.println("sExstRate==="+sExstRate+"---------sNewRate==="+sNewRate);
		if(Double.parseDouble(sNewRate) > Double.parseDouble(sExstRate)){
			product.setSalePrice(sNewRate);
		}
		result = updateBillProduct(product, existBilDetCart.getBillDetailsCartId());
		
		return result;
	}
}
