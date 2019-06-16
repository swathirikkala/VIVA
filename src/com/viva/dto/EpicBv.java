package com.viva.dto;

public class EpicBv {
	private int epicId;
	private int bvId;
	private boolean status;
	private int viva;
	private String comment;

	public EpicBv() {
		this.epicId = 0;
		this.bvId = 0;
		this.status = false;
		this.comment = "";
		this.viva = 0;
	}

	public EpicBv(int epicId, int bvId, boolean status) {
		super();
		this.epicId = epicId;
		this.bvId = bvId;
		this.status = status;
	}

	public int getEpicId() {
		return epicId;
	}

	public void setEpicId(int epicId) {
		this.epicId = epicId;
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
		return "EpicBv [epicId=" + epicId + ", bvId=" + bvId + ", status=" + status + ", viva=" + viva + ", comment="
				+ comment + "]";
	}

}
