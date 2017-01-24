package com.eBilling.baseModel;


public class ProductStockBase {
	protected String productId;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	protected String stock;
	protected String oldStock;
	protected String newStock;
	protected String updatedOn;
	protected String updatedBy;
	protected String stockId;
	protected String productName;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getStockId() {
		return stockId;
	}
	public void setStockId(String stockId) {
		this.stockId = stockId;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getOldStock() {
		return oldStock;
	}
	public void setOldStock(String oldStock) {
		this.oldStock = oldStock;
	}
	public String getNewStock() {
		return newStock;
	}
	public void setNewStock(String newStock) {
		this.newStock = newStock;
	}
	public String getUpdatedOn() {
		return updatedOn;
	}
	public void setUpdatedOn(String updatedOn) {
		this.updatedOn = updatedOn;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	
	
	
	}
