package com.viva.dto;

public class Epic {

	private int id;
	private String name;
	private int sprint;
	private int project;
	private String manager;
	private String assignedTo;
	private int severity;
	private String status;
	private String startDate;
	private String endDate;
	private String description;
	private String lmb;
	private String lmt;
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
	public int getSprint() {
		return sprint;
	}
	public void setSprint(int sprint) {
		this.sprint = sprint;
	}
	public int getProject() {
		return project;
	}
	public void setProject(int project) {
		this.project = project;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getAssignedTo() {
		return assignedTo;
	}
	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}
	public int getSeverity() {
		return severity;
	}
	public void setSeverity(int severity) {
		this.severity = severity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLmb() {
		return lmb;
	}
	public void setLmb(String lmb) {
		this.lmb = lmb;
	}
	public String getLmt() {
		return lmt;
	}
	public void setLmt(String lmt) {
		this.lmt = lmt;
	}
	@Override
	public String toString() {
		return "Epic [id=" + id + ", name=" + name + ", sprint=" + sprint + ", project=" + project + ", manager="
				+ manager + ", assignedTo=" + assignedTo + ", severity=" + severity + ", status=" + status
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", description=" + description + ", lmb=" + lmb
				+ ", lmt=" + lmt + "]";
	}
	
}
