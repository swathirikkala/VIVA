
package com.viva.db.util;

import java.sql.ResultSet;

import com.viva.dto.Department;
import com.viva.dto.Epic;
import com.viva.dto.Project;
import com.viva.dto.Sprint;
import com.viva.dto.User;
import com.viva.dto.UserStory;

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

	public static String getAllEpicsQuery() {
		String query = "select * from epic";
		return query;
	}

	public static String getAddUserStoryQuery(UserStory us) {
		String query = "insert into user_story (project,sprint,epic,name,priority,start_date,end_date,manager,assign_to,	description,lmb) values("
				+ us.getProject() + "," + us.getSprint() + "," + us.getEpic() + ",'" + us.getName() + "','"
				+ us.getPrioroty() + "','" + us.getStartDate() + "','" + us.getEndDate() + "','" + us.getManager()
				+ "','" + us.getAssignTo() + "','" + us.getDescription() + "','" + us.getLmb() + "')";
		return query;
	}

	public static String getAllUserStoriesQuery() {
		return "select * from user_story";
	}

	public static String getSearchProjectsQuery(Project project) {
		boolean andNeeded = false;
		String query = "select * from project where";

		if (project.getId() != 0) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " id = " + project.getId() + "";
		}
		if (!project.getStatus().equalsIgnoreCase("0")) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " status = '" + project.getStatus() + "'";
		}
		if (!project.getStartDate().isEmpty()) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " start_date >= '" + project.getStartDate() + "'";
		}
		if (!project.getEndDate().isEmpty()) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " end_date <= '" + project.getEndDate() + "'";
		}

		if (!project.getViva().equalsIgnoreCase("0")) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " viva <= " + project.getViva() + "";
		}
		return query;
	}

	public static String getProjectByIdQuery(String projectId) {
		String query = "select * from project where id = " + projectId;
		return query;
	}

	public static String getAllProjectsQuery() {
		String query = "select * from project";
		return query;
	}

	public static String getUpdateProjectQuery(Project project) {
		System.out.println("Project is : " + project);
		String query = "update project set name ='"+project.getName()+"', start_date='"+project.getStartDate()+"' , end_date='"+project.getEndDate()+"', manager ='"+
				project.getManager()+"', description = '"+project.getDescription()+"', status='"+project.getStatus()+"', severity='"+
				project.getSeverity()+"' where id="+project.getId();
		return query;
	}

	public static String getSpringByIdQuery(String sprintId) {
		String query = "select * from sprint where id="+sprintId;
		return query;
	}

	public static String getEpicsBySprintIdQuery(String sprintId) {
		String query ="select * from epic where sprint = " + sprintId;
		
		return query;
	}
}
