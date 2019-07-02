package com.viva.dao.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.viva.dao.BusinessValuesDao;
import com.viva.dao.ProjectDao;
import com.viva.db.util.CacheUtil;
import com.viva.dto.BusinessValue;
import com.viva.dto.Department;
import com.viva.dto.Project;
import com.viva.dto.Team;
import com.viva.dto.User;

public class LookUp {

	private static ProjectDao projectDao = new ProjectDao();
	private static BusinessValuesDao businessValuesDao = new BusinessValuesDao();
	private static Map<Integer, BusinessValue> bvMap = null;

	public static String getUserName(String userId, Map<String, User> allUsers) {
		String userName = "";

		try {
			User user = allUsers.get(userId);
			if (user != null) {
				userName = user.getFirstName() + " " + user.getLastName();
			}
		} catch (Exception e) {
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

	public static List<String> getStatuses() {
		List<String> statuses = new ArrayList<String>();
		statuses.add("Open");
		statuses.add("Work in progress");
		statuses.add("On hold");
		statuses.add("Closed");
		statuses.add("Not Started");
		statuses.add("Inactive");
		return statuses;
	}

	public static List<String> getPriorities() {
		List<String> priorities = new ArrayList<String>();
		for (int i = 1; i <= 20; i++) {
			priorities.add(String.valueOf(i));
		}
		return priorities;
	}

	public static List<BusinessValue> getBusinessValues() {
		List<BusinessValue> bvs = CacheUtil.allBusinessValues;
		if (bvs == null) {
			bvs = new ArrayList<BusinessValue>();
		}
		return bvs;
	}

	public static List<Project> getAllProjectByTeam() {
		List<Project> projects = CacheUtil.allProjects;
		if (projects == null) {
			projects = new ArrayList<Project>();
		}
		return projects;
	}

	public static String bvName(int bvId) {
		if (bvMap == null) {
			bvMap = businessValuesDao.getBvMap();
		}
		return bvMap.get(bvId).getName();
	}

	public static String getTeamName(int teamId, List<Team> teams) {
		for (Team t : teams) {
			if (teamId == t.getTeamId()) {
				return t.getTeamName();
			}
		}
		return "";
	}

	public static String getDepartmentName(int deptId, List<Department> departments) {
		for (Department d : departments) {
			if (deptId == d.getId()) {
				return d.getName();
			}
		}

		return "";
	}

}
