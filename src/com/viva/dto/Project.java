package com.viva.dto;

public class Project {
	private int id;
	private String name;
	private int priority;
	private String startDate;
	private String endDate;
	private String manager;
	private String createdBy;
	private String description;
	private String lastModifiedBy;
	private String lastModifiedDateTime;
	private String status;
	private String viva;
	private String cretatedDate;

	
	public Project() {
		this.name="";
		this.status="";
		this.startDate="";
		this.endDate="";
		this.description="";
		this.cretatedDate="";
		this.lastModifiedBy="";
	}

	public String getCretatedDate() {
		return cretatedDate;
	}

	public void setCretatedDate(String cretatedDate) {
		this.cretatedDate = cretatedDate;
	}

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

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getManager() {
		return manager;
	}

	public String getStartDate() {
		if("2000-01-01".equalsIgnoreCase(this.startDate)) {
			return "";
		}
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		if("2000-01-01".equalsIgnoreCase(this.endDate)) {
			return "";
		}
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

	public String getViva() {
		return viva;
	}

	public void setViva(String viva) {
		this.viva = viva;
	}

	@Override
	public String toString() {
		return "Project [id=" + id + ", name=" + name + ", priority=" + priority + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", manager=" + manager + ", createdBy=" + createdBy + ", description="
				+ description + ", lastModifiedBy=" + lastModifiedBy + ", lastModifiedDateTime=" + lastModifiedDateTime
				+ ", status=" + status + ", viva=" + viva + ", cretatedDate=" + cretatedDate + "]";
	}

}
