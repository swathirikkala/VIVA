package com.viva.dto;

public class UsBv {

	private int usId;
	private int bvId;
	private boolean status;
	private int viva;
	private String comment;
	public UsBv() {
		this.comment = "";
	}
	public int getUsId() {
		return usId;
	}
	public void setUsId(int usId) {
		this.usId = usId;
	}
	public int getBvId() {
		return bvId;
	}
	public void setBvId(int bvId) {
		this.bvId = bvId;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public int getViva() {
		return viva;
	}
	public void setViva(int viva) {
		this.viva = viva;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "UsBv [usId=" + usId + ", bvId=" + bvId + ", status=" + status + ", viva=" + viva + ", comment="
				+ comment + "]";
	}
	
}
