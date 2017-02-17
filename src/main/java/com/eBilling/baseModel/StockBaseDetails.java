package com.eBilling.baseModel;


public class StockBaseDetails {
	protected String productId;
	protected String stockDetailsId;
	protected String quantity;
	protected String transactionId;
	protected String transactionDate;
	protected String updatedBy;
	protected String transactionType;
	protected String productName;
	protected String oldQuantity;
	public String getOldQuantity() {
		return oldQuantity;
	}
	public void setOldQuantity(String oldQuantity) {
		this.oldQuantity = oldQuantity;
	}
	public String getNewQuantity() {
		return newQuantity;
	}
	public void setNewQuantity(String newQuantity) {
		this.newQuantity = newQuantity;
	}
	protected String newQuantity;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getStockDetailsId() {
		return stockDetailsId;
	}
	public void setStockDetailsId(String stockDetailsId) {
		this.stockDetailsId = stockDetailsId;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	
	
	}
