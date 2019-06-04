package com.viva.dto;

public class Epic {

	private int id;
	private String name;
	private int sprint;
	private int project;
	private int priority;
	private String status;
	private String description;
	private String lmb;
	private String lmt;
	private String createdBy;
	private int viva;
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
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
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
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public int getViva() {
		return viva;
	}
	public void setViva(int viva) {
		this.viva = viva;
	}
	@Override
	public String toString() {
		return "Epic [id=" + id + ", name=" + name + ", sprint=" + sprint + ", project=" + project + ", priority="
				+ priority + ", status=" + status + ", description=" + description + ", lmb=" + lmb + ", lmt=" + lmt
				+ ", createdBy=" + createdBy + ", viva=" + viva + "]";
	}

	
}
