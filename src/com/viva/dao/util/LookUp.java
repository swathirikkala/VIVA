package com.viva.dao.util;

import java.util.List;

import com.viva.dto.Project;
import com.viva.dto.User;

public class LookUp {

	public static String getUserName(String userId, List<User> users) {
		String userName = "";
		for (User u : users) {
			if (userId.equalsIgnoreCase(u.getEmailId())) {
				userName = u.getFirstName() + " " + u.getLastName();
				break;
			}
		}
		return userName;
	}

	public static String getProjectName(int projectId, List<Project> projects) {
		String projectName = "";
		for (Project p : projects) {
			if (projectId == p.getId()) {
				projectName = p.getName();
				break;
			}
		}
		return projectName;
	}
	
	public static String getSeverityName(int s) {
		switch(s) {
		case 1 : return "High";
		case 2: return "Medium";
		case 3: return "Low";
		case 4: return "No Severity";
		}
		return "";
	}
	
	public static String getStatusName(int s) {
		switch(s) {
		case 1 : return "Grooming";
		case 2: return "Defined";
		case 3: return "In Progress";
		case 4: return "Completed";
		}
		return "";
	}
}
