package com.viva.dto;

public class Sprint {

	private int sprintId;
	private String sprintName;
	private int projectId;
	private int severity;
	private String managerId;
	private String startDate;
	private String endDate;
	private String createdBy;
	private String description;
	private String lastModifiedBy;
	private String lastModifiedDateTime;
	private String status;
	private int viva;
	
	
	public Sprint() {
		this.sprintName="";
		this.managerId="";
		this.startDate="";
		this.endDate="";
		this.createdBy="";
		this.description="";
		this.lastModifiedBy="";
		this.lastModifiedDateTime="";
		this.status="0";
		this.projectId=0;
	}
	public int getSprintId() {
		return sprintId;
	}
	public void setSprintId(int sprintId) {
		this.sprintId = sprintId;
	}
	public String getSprintName() {
		return sprintName;
	}
	public void setSprintName(String sprintName) {
		this.sprintName = sprintName;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getSeverity() {
		return severity;
	}
	public void setSeverity(int severity) {
		this.severity = severity;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
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
	public int getViva() {
		return viva;
	}
	public void setViva(int viva) {
		this.viva = viva;
	}
	@Override
	public String toString() {
		return "Sprint [sprintId=" + sprintId + ", sprintName=" + sprintName + ", projectId=" + projectId
				+ ", severity=" + severity + ", managerId=" + managerId + ", startDate=" + startDate + ", endDate="
				+ endDate + ", createdBy=" + createdBy + ", description=" + description + ", lastModifiedBy="
				+ lastModifiedBy + ", lastModifiedDateTime=" + lastModifiedDateTime + ", status=" + status + ", viva="
				+ viva + "]";
	}

	
}
