
package com.viva.db.util;

import com.viva.dto.Department;
import com.viva.dto.Epic;
import com.viva.dto.Project;
import com.viva.dto.Sprint;
import com.viva.dto.User;

public class QueryBuilder {

	public static String getAddProjectQuery(Project project) {
		String query = "insert into project (name,severity,start_date,end_date,created_by,manager,description,modified_by) values('"
				+ project.getName() + "'," + project.getSeverity() + ",'" + project.getStartDate() + "','"
				+ project.getEndDate() + "','" + project.getCreatedBy() + "','" + project.getManager() + "','"
				+ project.getDescription() + "','" + project.getLastModifiedBy() + "')";
		return query;
	}

	public static String getRegisterUserQuery(User user) {
		String query = "insert into user values ('" + user.getEmailId() + "','" + user.getFirstName() + "','"
				+ user.getLastName() + "','" + user.getDob() + "'," + user.getDepartment() + ",'"
				+ user.getDesignation() + "','" + user.getPassword() + "','" + user.getSecurityQuestion() + "','"
				+ user.getSecurityAnswer() + "')";
		return query;
	}

	public static String getUserLoginQuery(User user) {
		String query = "select * from user where id ='" + user.getEmailId() + "' and password = '" + user.getPassword()
				+ "'";
		return query;
	}

	public static String getAllUsers() {
		String query = "select * from user";
		return query;
	}

	public static String getProjectsByAssignedManagerQuery(String managerId) {
		String query = "select * from project where manager = '" + managerId + "'";
		return query;
	}

	public static String getAddSprintQuery(Sprint sprint) {
		String query = "INSERT INTO sprint(name,project,severity,manager, start_date,end_date,created_by,description) VALUES ('"
				+ sprint.getSprintName() + "'," + sprint.getProjectId() + "," + sprint.getSeverity() + ",'"
				+ sprint.getManagerId() + "','" + sprint.getStartDate() + "','" + sprint.getEndDate() + "','"
				+ sprint.getCreatedBy() + "','" + sprint.getDescription() + "')";
		return query;
	}

	public static String getAllSprintsByProjectQuery(String projectId) {
		String query = "select * from sprint where project = " + projectId + "";
		return query;
	}

	public static String addDepartmentQuery(Department department) {
		String query = "insert into department values (" + department.getId() + ",'" + department.getName() + "','"
				+ department.getDescription() + "')";

		return query;
	}

	public static String getAllDepartmentsQuery() {

		return "select * from department";
	}

	public static String getManagersQuery() {
		return "select * from user where department = (select id from department where name = 'manager')";
	}

	public static String getLastUpdatedProjectsListByManagerIdQuery(String managerId) {
		String query = "select * from project where manager = '" + managerId + "'";
		return query;
	}

	public static String getAddEpicQuery(Epic epic) {
		String query = "insert into epic (name,sprint,project,manager,assigned_to,severity,status,start_date,end_date,description,lmb) values ('"
				+ epic.getName() + "'," + epic.getSprint() + "," + epic.getProject() + ",'" + epic.getManager() + "','"
				+ epic.getAssignedTo() + "'," + epic.getSeverity() + ",'" + epic.getStatus() + "','"
				+ epic.getStartDate() + "','" + epic.getEndDate() + "','" + epic.getDescription() + "','"
				+ epic.getLmb() + "')";
		return query;
	}
}
