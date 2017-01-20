package com.eBilling.baseModel;


public class ClientBase {
	protected String clientId;
	protected String companyName;
	protected String address;
	protected String clientEmail;
	protected String contactPerson;
	protected String contactNo;
	protected String uploadLogo;
	protected String smsSuport;
	protected String emailSupport;
	protected String createdDate;
	protected String tinNo;
	protected String smsUrl;
	protected String smsUserName;
	protected String smsPassword;
	public String getSmsUrl() {
		return smsUrl;
	}
	public void setSmsUrl(String smsUrl) {
		this.smsUrl = smsUrl;
	}
	public String getSmsUserName() {
		return smsUserName;
	}
	public void setSmsUserName(String smsUserName) {
		this.smsUserName = smsUserName;
	}
	public String getSmsPassword() {
		return smsPassword;
	}
	public void setSmsPassword(String smsPassword) {
		this.smsPassword = smsPassword;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public String getClientEmail() {
		return clientEmail;
	}
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getUploadLogo() {
		return uploadLogo;
	}
	public void setUploadLogo(String uploadLogo) {
		this.uploadLogo = uploadLogo;
	}
	public String getSmsSuport() {
		return smsSuport;
	}
	public void setSmsSuport(String smsSuport) {
		this.smsSuport = smsSuport;
	}
	public String getEmailSupport() {
		return emailSupport;
	}
	public void setEmailSupport(String emailSupport) {
		this.emailSupport = emailSupport;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getTinNo() {
		return tinNo;
	}
	public void setTinNo(String tinNo) {
		this.tinNo = tinNo;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	
	@Override
	public String toString() {
		return "ClientBase [clientId=" + clientId + ", address=" + address + ", clientEmail=" + clientEmail + ", contactPerson="
				+ contactPerson + ", contactNo=" + contactNo + ", uploadLogo=" + uploadLogo + ", smsSuport=" + smsSuport
				+ ", emailSupport=" + emailSupport + ", createdDate=" + createdDate + ", tinNo=" + tinNo + "]";
	}
	
	

	}
