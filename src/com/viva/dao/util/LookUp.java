package com.viva.dao.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.viva.dao.UserDao;
import com.viva.dto.BusinessValue;
import com.viva.dto.Project;
import com.viva.dto.User;

public class LookUp {

	private static UserDao userDao = new UserDao();
	
	public static String getUserName(String userId ,Map<String, User> allUsers ) {
		String userName ="";

		try {
			 User user = allUsers.get(userId);
			 if(user!=null) {
				 userName = user.getFirstName() +" "+ user.getLastName();
			 }
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return userName;
	}
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
	

	public static List<String> getStatuses(){
		List<String> statuses = new ArrayList<String>();
		statuses.add("Open");
		statuses.add("Work in progress");
		statuses.add("On hold");
		statuses.add("Closed");
		statuses.add("Not Started");
		statuses.add("Inactive");
		return statuses;
	}
	public static List<String> getPriorities(){
		List<String> priorities = new ArrayList<String>();
		for(int i=1;i<=20;i++) {
			priorities.add(String.valueOf(i));
		}
		return priorities;
	}
	public static List<BusinessValue> getBusinessValues(){
		List<BusinessValue> bvs = new ArrayList<BusinessValue>();
		return bvs;
	}
}
