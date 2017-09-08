package com.eGSTbill.model;

public class Product {

	protected String productId;
	protected String productName;
	protected String hsnCode;
	protected String uom;
	protected String quantity;
	protected String purchaserPrice;
	protected String mrp;
	protected String salePrice;
	protected String discount;
	protected String cGST;
	protected String sGST;
	protected String iGST;
	protected String productType;
	protected String updatedBy;
	protected String updatedDate;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getHsnCode() {
		return hsnCode;
	}
	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getPurchaserPrice() {
		return purchaserPrice;
	}
	public void setPurchaserPrice(String purchaserPrice) {
		this.purchaserPrice = purchaserPrice;
	}
	public String getMrp() {
		return mrp;
	}
	public void setMrp(String mrp) {
		this.mrp = mrp;
	}
	public String getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(String salePrice) {
		this.salePrice = salePrice;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getcGST() {
		return cGST;
	}
	public void setcGST(String cGST) {
		this.cGST = cGST;
	}
	public String getsGST() {
		return sGST;
	}
	public void setsGST(String sGST) {
		this.sGST = sGST;
	}
	public String getiGST() {
		return iGST;
	}
	public void setiGST(String iGST) {
		this.iGST = iGST;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public String getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

}
