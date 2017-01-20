package com.eBilling.baseModel;


public class StatusBase {

	protected String statusId;
	protected String status;
	protected String description;
	protected String statusPriority;
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatusPriority() {
		return statusPriority;
	}
	public void setStatusPriority(String statusPriority) {
		this.statusPriority = statusPriority;
	}
}
