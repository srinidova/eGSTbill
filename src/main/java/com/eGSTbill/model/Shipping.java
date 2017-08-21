package com.eGSTbill.model;

public class Shipping {

	protected String ShippingId;
	protected String purchaserName;
	protected String name;
	protected String address;
	protected String state;
	protected String pin;
	public String getShippingId() {
		return ShippingId;
	}
	public void setShippingId(String shippingId) {
		ShippingId = shippingId;
	}
	public String getPurchaserName() {
		return purchaserName;
	}
	public void setPurchaserName(String purchaserName) {
		this.purchaserName = purchaserName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
}
