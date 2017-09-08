package com.eGSTbill.service;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.eGSTbill.dao.BillCartDAO;
import com.eGSTbill.dao.BillDetailsCartDAO;
import com.eGSTbill.dao.ProductDAO;
import com.eGSTbill.model.BillCart;
import com.eGSTbill.model.BillDetailsCart;
import com.eGSTbill.model.Product;
import com.fasterxml.jackson.databind.ObjectMapper;

public class BillCartService {

	public String addBillCart(BillCart billCart) {
		BillCartDAO dao = new BillCartDAO();
		return dao.addBillCart(billCart);
	}

	public String listBillCart() {
		String sJson = null;
		ObjectMapper objectMapper = null;
		ArrayList<BillCart> lstBillCart = null;
		BillCartDAO dao = new BillCartDAO();

		lstBillCart = dao.listBillCart();
		if (lstBillCart == null || lstBillCart.size() > 0) {
			objectMapper = new ObjectMapper();
			try {
				sJson = objectMapper.writeValueAsString(lstBillCart);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}

	public String deleteBillCart(BillCart billCart) {
		BillCartDAO dao = new BillCartDAO();
		return dao.deleteBillCart(billCart);
	}

	public boolean getBillCart(BillCart billCart) {
		boolean bBillCartExist = false;
		ArrayList<BillCart> lstBillCart = null;
		BillCartDAO dao = new BillCartDAO();
		lstBillCart = dao.getBillCart(billCart);
		if (lstBillCart == null || lstBillCart.size() > 0) {
			bBillCartExist = true;
		}
		return bBillCartExist;
	}
	

	public String updateBillCart(BillCart billCart) {
		BillCartDAO dao = new BillCartDAO();
		return dao.updateBillCart(billCart);
	}
	
	public String listBillCartByBillId(String sBillId) {
		String sJson = null;
		ArrayList<BillCart> lstBillCartReturn = null;
		ObjectMapper objectMapper = null;
		ArrayList<BillCart> lstBillCart = null;
		BillCartDAO dao = new BillCartDAO();
		BillCart billCart = null;
		BillDetailsCartService bilDetCartSer = new BillDetailsCartService();
		
		lstBillCart = dao.listBillCartByBillId(sBillId);
		//System.out.println("a. From BillCartService service listBillCartByBillId lstBillCart=="+lstBillCart.size());
		if (lstBillCart == null || lstBillCart.size() > 0) {

			try {
				for(int i = 0; i < lstBillCart.size(); i++){
					billCart = lstBillCart.get(i);
				}
				ArrayList<BillDetailsCart> lstBillDetailsCart = bilDetCartSer.getBillDetailsCartByBillId(sBillId);
				//System.out.println("b. From BillCartService service listBillCartByBillId lstBillDetailsCart=="+lstBillDetailsCart.size());
				billCart.setLstBillDetCart(lstBillDetailsCart);
				
				//caliculate total and update to table
				billCart = totalUpdate(billCart);
				
				lstBillCartReturn = new ArrayList<BillCart>();
				lstBillCartReturn.add(billCart);
				
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(lstBillCartReturn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sJson;
	}
	
	public BillCart totalUpdate(BillCart billCart) {
		double dTotQty = 0.0;
		double dTotAmt = 0.0;
		double dTotDis = 0.0;
		double dTotTaxVal = 0.0;
		double dTotCgst = 0.0f;
		double dTotSgst = 0.0f;
		double dTotIgst = 0.0;
		double dTotGrandTot = 0.0;
		double dTotBeforeTax = 0.0;
		double dTotTotalTax = 0.0;
		double dTotAfterTax = 0.0;
		
	try {
				ArrayList<BillDetailsCart> lstBillDetailsCart = billCart.getLstBillDetCart();
				for(BillDetailsCart bdc : lstBillDetailsCart){
					dTotQty = dTotQty + Double.parseDouble(bdc.getQuantity()); 
					dTotAmt = dTotAmt + Double.parseDouble(bdc.getAmount()); 
					
					dTotDis = dTotDis + Double.parseDouble(bdc.getDiscount()); 
					dTotTaxVal = dTotTaxVal + Double.parseDouble(bdc.getTaxableValue()); 
					dTotCgst = dTotCgst + Double.parseDouble(bdc.getCgstAmount());
					//System.out.println("1. dTotCgst---------"+dTotCgst);
					dTotSgst = dTotSgst + Double.parseDouble(bdc.getSgstAmount()); 
					//dTotIgst = dTotIgst + Double.parseDouble(bdc.getIgstAmount()); 
					dTotGrandTot = dTotGrandTot + Double.parseDouble(bdc.getTotal());
				}
				
				////System.out.println("dTotGrandTot---------"+dTotGrandTot);
				//String resultTotal = String.format("%.2f", dTotGrandTot);
				//System.out.println("2. dTotCgst---------"+dTotCgst);
				dTotBeforeTax = dTotTaxVal;
				dTotTotalTax = dTotCgst + dTotSgst + dTotIgst;
				dTotAfterTax = dTotBeforeTax + dTotTotalTax; 
				
				billCart.setTotalQuantity(String.format("%.2f",dTotQty));
				billCart.setTotalAmount(String.format("%.2f",dTotAmt));
				billCart.setTotalDiscount(String.format("%.2f",dTotDis));
				billCart.setTaxValue(String.format("%.2f",dTotTaxVal));
				billCart.setTotalCgst(String.format("%.2f",dTotCgst));
				billCart.setTotalSgst(String.format("%.2f",dTotSgst));
				//billCart.setTotalIgst(String.valueOf(dTotIgst));
				billCart.setGrandTotal(String.format("%.2f",dTotGrandTot));
				billCart.setTotalBeforeTax(String.format("%.2f",dTotBeforeTax));
				billCart.setTotalTax(String.format("%.2f",dTotTotalTax));
				billCart.setTotalAfterTax(String.format("%.2f",dTotAfterTax));
				
				String resBilCardUpdt = updateBillCart(billCart);
				//System.out.println("b. From BillCartService service totalUpdate resBilCardUpdt=="+resBilCardUpdt);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		return billCart;
	}
	
	
	public BillCart updatedBillCart(String sBillId) {
		String sJson = null;
		ArrayList<BillCart> lstBillCartReturn = null;
		ObjectMapper objectMapper = null;
		ArrayList<BillCart> lstBillCart = null;
		BillCartDAO dao = new BillCartDAO();
		BillCart billCart = null;
		BillDetailsCartService bilDetCartSer = new BillDetailsCartService();
		//System.out.println("a. From BillCartService service updatedBillCart sBillId=="+sBillId);
		
		lstBillCart = dao.listBillCartByBillId(sBillId);
		//System.out.println("b. From BillCartService service updatedBillCart lstBillCart=="+lstBillCart.size());
		if (lstBillCart == null || lstBillCart.size() > 0) {

			try {
				for(int i = 0; i < lstBillCart.size(); i++){
					billCart = lstBillCart.get(i);
				}
				ArrayList<BillDetailsCart> lstBillDetailsCart = bilDetCartSer.getBillDetailsCartByBillId(sBillId);
				//System.out.println("b. From BillCartService service listBillCartByBillId lstBillDetailsCart=="+lstBillDetailsCart.size());
				billCart.setLstBillDetCart(lstBillDetailsCart);
				
				//caliculate total and update to table
				billCart = totalUpdate(billCart);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return billCart;
	}
	public String  searchUnBilled(BillCart billCart) {
		BillCartDAO dao = new BillCartDAO();
		return dao.searchUnBilled(billCart);
	}
}
