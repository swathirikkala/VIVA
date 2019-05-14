package com.viva.dto;

public class Project {
	private int id;
	private String name;
	private int severity;
	private String startDate;
	private String endDate;
	private String manager;
	private String createdBy;
	private String description;
	private String lastModifiedBy;
	private String lastModifiedDateTime;
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSeverity() {
		return severity;
	}
	public void setSeverity(int severity) {
		this.severity = severity;
	}
	public String getManager() {
		return manager;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public String getLastModifiedDateTime() {
		return lastModifiedDateTime;
	}
	public void setLastModifiedDateTime(String lastModifiedDateTime) {
		this.lastModifiedDateTime = lastModifiedDateTime;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Project [id=" + id + ", name=" + name + ", severity=" + severity + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", manager=" + manager + ", createdBy=" + createdBy + ", description="
				+ description + ", lastModifiedBy=" + lastModifiedBy + ", lastModifiedDateTime=" + lastModifiedDateTime
				+ ", status=" + status + "]";
	}

	
	
}
