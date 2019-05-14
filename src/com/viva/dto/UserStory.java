package com.viva.dto;

public class UserStory {

	private int id;
	private String name;
	private String description;
	private int epicId;
	private int hoursEstimated;
	private int hoursConsumed;
	private String owner;
	private String state;

	public UserStory() {
		super();
	}

	public UserStory(int id, String name, String description, int epicId, int hoursEstimated, int hoursConsumed,
			String owner, String state) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.epicId = epicId;
		this.hoursEstimated = hoursEstimated;
		this.hoursConsumed = hoursConsumed;
		this.owner = owner;
		this.state = state;
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

	public int getEpicId() {
		return epicId;
	}

	public void setEpicId(int epicId) {
		this.epicId = epicId;
	}

	public int getHoursEstimated() {
		return hoursEstimated;
	}

	public void setHoursEstimated(int hoursEstimated) {
		this.hoursEstimated = hoursEstimated;
	}

	public int getHoursConsumed() {
		return hoursConsumed;
	}

	public void setHoursConsumed(int hoursConsumed) {
		this.hoursConsumed = hoursConsumed;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "UserStory [id=" + id + ", name=" + name + ", description=" + description + ", epicId=" + epicId
				+ ", hoursEstimated=" + hoursEstimated + ", hoursConsumed=" + hoursConsumed + ", owner=" + owner
				+ ", state=" + state + "]";
	}

}
