package com.viva.dto;

import java.util.List;

public class UserStory {

	private int id;
	private int project;
	private int sprint;
	private int epic;
	private String name;
	private int prioroty;
	private String status;
	private String createdBy;
	private String description;
	private List<BusinessValue> businessValues;
	private String lmb;
	private String lmd;
	private int viva;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProject() {
		return project;
	}
	public void setProject(int project) {
		this.project = project;
	}
	public int getSprint() {
		return sprint;
	}
	public void setSprint(int sprint) {
		this.sprint = sprint;
	}
	public int getEpic() {
		return epic;
	}
	public void setEpic(int epic) {
		this.epic = epic;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrioroty() {
		return prioroty;
	}
	public void setPrioroty(int prioroty) {
		this.prioroty = prioroty;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public List<BusinessValue> getBusinessValues() {
		return businessValues;
	}
	public void setBusinessValues(List<BusinessValue> businessValues) {
		this.businessValues = businessValues;
	}
	public String getLmb() {
		return lmb;
	}
	public void setLmb(String lmb) {
		this.lmb = lmb;
	}
	public String getLmd() {
		return lmd;
	}
	public void setLmd(String lmd) {
		this.lmd = lmd;
	}
	public int getViva() {
		return viva;
	}
	public void setViva(int viva) {
		this.viva = viva;
	}
	
	@Override
	public String toString() {
		return "UserStory [id=" + id + ", project=" + project + ", sprint=" + sprint + ", epic=" + epic + ", name="
				+ name + ", prioroty=" + prioroty + ", status=" + status + ", createdBy=" + createdBy + ", description="
				+ description + ", businessValues=" + businessValues + ", lmb=" + lmb + ", lmd=" + lmd + ", viva="
				+ viva + "]";
	}
	
}
