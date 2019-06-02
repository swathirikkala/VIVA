package com.viva.dto;

public class History {
	private int id;
	private int jobId;
	private String jobType;
	private String comment;
	private String hDate;
	private String owner;

	public History() {
		super();
	}

	public History(int id, int jobId, String jobType, String comment, String hDate, String owner) {
		super();
		this.id = id;
		this.jobId = jobId;
		this.jobType = jobType;
		this.comment = comment;
		this.hDate = hDate;
		this.owner = owner;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String gethDate() {
		return hDate;
	}

	public void sethDate(String hDate) {
		this.hDate = hDate;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	@Override
	public String toString() {
		return "History [id=" + id + ", jobId=" + jobId + ", jobType=" + jobType + ", comment=" + comment + ", hDate="
				+ hDate + ", owner=" + owner + "]";
	}

}
