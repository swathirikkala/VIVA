package com.viva.dto;

public class BusinessValue {
	private int id;
	private String name;
	private String description;
	private boolean active;
	private String isAssigned;

	public BusinessValue() {
		super();
	}

	public boolean isActive() {
		return active;
	}

	public BusinessValue(int id, String name, String description, boolean active) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.active = active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIsAssigned() {
		return isAssigned;
	}

	public void setIsAssigned(String isAssigned) {
		this.isAssigned = isAssigned;
	}

	@Override
	public String toString() {
		return "BusinessValue [id=" + id + ", name=" + name + ", description=" + description + ", active=" + active
				+ ", isAssigned=" + isAssigned + "]";
	}

	
}
