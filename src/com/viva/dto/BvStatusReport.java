package com.viva.dto;

public class BvStatusReport extends UsBv {

	private String bvName;
	private String projectName;
	private String epicName;
	private String sprintName;
	private String userStoryName;
	
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getEpicName() {
		return epicName;
	}
	public void setEpicName(String epicName) {
		this.epicName = epicName;
	}
	public String getSprintName() {
		return sprintName;
	}
	public void setSprintName(String sprintName) {
		this.sprintName = sprintName;
	}
	public String getUserStoryName() {
		return userStoryName;
	}
	public void setUserStoryName(String userStoryName) {
		this.userStoryName = userStoryName;
	}
	public String getBvName() {
		return bvName;
	}
	public void setBvName(String bvName) {
		this.bvName = bvName;
	}
}
