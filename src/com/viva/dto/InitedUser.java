package com.viva.dto;

public class InitedUser {
	private String userMailId;
	private int team;
	private int department;
	private String status;
	private String token;
	private String invitedBy;
	private String invitedOn;

	public String getUserMailId() {
		return userMailId;
	}

	public void setUserMailId(String userMailId) {
		this.userMailId = userMailId;
	}

	public int getTeam() {
		return team;
	}

	public void setTeam(int team) {
		this.team = team;
	}

	public int getDepartment() {
		return department;
	}

	public void setDepartment(int department) {
		this.department = department;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getInvitedBy() {
		return invitedBy;
	}

	public void setInvitedBy(String invitedBy) {
		this.invitedBy = invitedBy;
	}

	public String getInvitedOn() {
		return invitedOn;
	}

	public void setInvitedOn(String invitedOn) {
		this.invitedOn = invitedOn;
	}

	@Override
	public String toString() {
		return "InitedUser [userMailId=" + userMailId + ", team=" + team + ", department=" + department + ", status="
				+ status + ", token=" + token + ", invitedBy=" + invitedBy + ", invitedOn=" + invitedOn + "]";
	}

}
