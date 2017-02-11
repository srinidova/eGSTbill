package com.eBilling.baseModel;

public class DamageBase {
protected String damageId;
protected String productId;
protected String quantity;
protected String description;
protected String updatedOn;
protected String updatedBy;
protected String productName;


public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public String getDamageId() {
	return damageId;
}
public void setDamageId(String damageId) {
	this.damageId = damageId;
}
public String getProductId() {
	return productId;
}
public void setProductId(String productId) {
	this.productId = productId;
}
public String getQuantity() {
	return quantity;
}
public void setQuantity(String quantity) {
	this.quantity = quantity;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
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
