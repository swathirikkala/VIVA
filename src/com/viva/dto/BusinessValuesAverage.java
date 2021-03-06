package com.viva.dto;

public class BusinessValuesAverage {

	private String businessValueName;
	private int bvs;
	private int occurance;
	private String project;

	public String getBusinessValueName() {
		return businessValueName;
	}

	public void setBusinessValueName(String businessValueName) {
		this.businessValueName = businessValueName;
	}

	public int getBvs() {
		return bvs;
	}

	public void setBvs(int bvs) {
		this.bvs = bvs;
	}

	public int getOccurance() {
		return occurance;
	}

	public void setOccurance(int occurance) {
		this.occurance = occurance;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	@Override
	public String toString() {
		return "BusinessValuesAverage [businessValueName=" + businessValueName + ", bvs=" + bvs + ", occurance="
				+ occurance + ", project=" + project + "]";
	}

}
