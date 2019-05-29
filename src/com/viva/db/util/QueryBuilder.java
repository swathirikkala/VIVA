
package com.viva.db.util;

import com.viva.dto.Department;
import com.viva.dto.Epic;
import com.viva.dto.Project;
import com.viva.dto.Sprint;
import com.viva.dto.User;
import com.viva.dto.UserStory;

public class QueryBuilder {

	public static String getAddProjectQuery(Project project) {
		String query = "insert into project (name,priority,start_date,end_date,created_by,manager,description,modified_by) values('"
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
		System.out.println("sprint add ->" + sprint);
		String query = "INSERT INTO sprint(name,project,priority,manager, start_date,end_date,created_by,description) VALUES ('"
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
		System.out.println("Epic dto :" + epic);
		String query = "insert into epic (name,project,priority,description,created_by,lmb) values ('"
				+ epic.getName() + "'," + epic.getProject() + ","+ epic.getSeverity() + ",'" + epic.getDescription() + "','"
				+ epic.getLmb()+ "','"+ epic.getLmb() + "')";
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
		if (!project.getStatus().equalsIgnoreCase("select")) {
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
				project.getManager()+"', description = '"+project.getDescription()+"', status='"+project.getStatus()+"', priority='"+
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

	public static String updateSptintQuery(Sprint sprint) {
		System.out.println("update Sprint : " + sprint);
		String query ="update sprint set name='"+sprint.getSprintName()+"', start_date = '"+sprint.getStartDate()+"', end_date='"
				+sprint.getEndDate()+"', priority = " + sprint.getSeverity()+", status='"+sprint.getStatus()+"', last_modified_by = '"+sprint.getLastModifiedBy()+"' where id="+sprint.getSprintId();
		return query;
	}
}
