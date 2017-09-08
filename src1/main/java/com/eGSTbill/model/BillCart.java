package com.eGSTbill.model;

import java.util.ArrayList;

public class BillCart {

	protected String billCartId;
	protected String billNo;
	protected String totalQuantity;
	protected String totalAmount;
	protected String totalDiscount;
	protected String taxValue;
	protected String totalCgst;
	protected String totalSgst;
	protected String totalIgst;
	protected String grandTotal;
	protected String totalBeforeTax;
	protected String totalTax;
	protected String totalAfterTax;
	protected String billDate;
	protected String orderBy;
	protected ArrayList<BillDetailsCart> lstBillDetCart ;
	ArrayList<Product> lstProducts = null;
	
	
	public ArrayList<Product> getLstProducts() {
		return lstProducts;
	}
	public void setLstProducts(ArrayList<Product> lstProducts) {
		this.lstProducts = lstProducts;
	}
	public String getBillCartId() {
		return billCartId;
	}
	public void setBillCartId(String billCartId) {
		this.billCartId = billCartId;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public String getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(String totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getTotalDiscount() {
		return totalDiscount;
	}
	public void setTotalDiscount(String totalDiscount) {
		this.totalDiscount = totalDiscount;
	}
	public String getTaxValue() {
		return taxValue;
	}
	public void setTaxValue(String taxValue) {
		this.taxValue = taxValue;
	}
	public String getTotalCgst() {
		return totalCgst;
	}
	public void setTotalCgst(String totalCgst) {
		this.totalCgst = totalCgst;
	}
	public String getTotalSgst() {
		return totalSgst;
	}
	public void setTotalSgst(String totalSgst) {
		this.totalSgst = totalSgst;
	}
	public String getTotalIgst() {
		return totalIgst;
	}
	public void setTotalIgst(String totalIgst) {
		this.totalIgst = totalIgst;
	}
	public String getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(String grandTotal) {
		this.grandTotal = grandTotal;
	}
	public String getTotalBeforeTax() {
		return totalBeforeTax;
	}
	public void setTotalBeforeTax(String totalBeforeTax) {
		this.totalBeforeTax = totalBeforeTax;
	}
	public String getTotalTax() {
		return totalTax;
	}
	public void setTotalTax(String totalTax) {
		this.totalTax = totalTax;
	}
	public String getTotalAfterTax() {
		return totalAfterTax;
	}
	public void setTotalAfterTax(String totalAfterTax) {
		this.totalAfterTax = totalAfterTax;
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public ArrayList<BillDetailsCart> getLstBillDetCart() {
		return lstBillDetCart;
	}
	public void setLstBillDetCart(ArrayList<BillDetailsCart> lstBillDetCart) {
		this.lstBillDetCart = lstBillDetCart;
	}
	
}
