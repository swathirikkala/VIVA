package com.viva.dto;

import java.util.List;

public class UserStory {

	private int id;
	private int project;
	private int sprint;
	private int epic;
	private String name;
	private String prioroty;
	private String startDate;
	private String endDate;
	private List<BusinessValue> businessValues;
	private String manager;
	private String assignTo;
	private String description;
	private String lmb;
	private String lmt;
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
	public String getPrioroty() {
		return prioroty;
	}
	public void setPrioroty(String prioroty) {
		this.prioroty = prioroty;
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
	public List<BusinessValue> getBusinessValues() {
		return businessValues;
	}
	public void setBusinessValues(List<BusinessValue> businessValues) {
		this.businessValues = businessValues;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getAssignTo() {
		return assignTo;
	}
	public void setAssignTo(String assignTo) {
		this.assignTo = assignTo;
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
		return "UserStory [id=" + id + ", project=" + project + ", sprint=" + sprint + ", epic=" + epic + ", name="
				+ name + ", prioroty=" + prioroty + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", businessValues=" + businessValues + ", manager=" + manager + ", assignTo=" + assignTo
				+ ", description=" + description + ", lmb=" + lmb + ", lmt=" + lmt + "]";
	}
	
}
