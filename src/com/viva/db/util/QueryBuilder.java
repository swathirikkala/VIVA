
package com.viva.db.util;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.viva.dto.BusinessValue;
import com.viva.dto.Department;
import com.viva.dto.Epic;
import com.viva.dto.History;
import com.viva.dto.Project;
import com.viva.dto.Sprint;
import com.viva.dto.User;
import com.viva.dto.UserStory;
import com.viva.util.DateUtil;

public class QueryBuilder {

	public static String getAddProjectQuery(Project project) {
		String query = "insert into project (name,priority,start_date,end_date,created_by,manager,description,modified_by,created_date,modified_on) values('"
				+ project.getName() + "'," + project.getPriority() + ",'" + project.getStartDate() + "','"
				+ project.getEndDate() + "','" + project.getCreatedBy() + "','" + project.getManager() + "','"
				+ project.getDescription() + "','" + project.getLastModifiedBy() + "','" + DateUtil.getSqlDate() + "','"
				+ DateUtil.getSqlDate() + "')";
		return query;
	}

	public static String getRegisterUserQuery(User user) {
		String query = "insert into user values ('" + user.getEmailId() + "','" + user.getFirstName() + "','"
				+ user.getLastName() + "','" + user.getDob() + "',5,'"
				+ user.getDesignation() + "','" + user.getPassword() + "','" + user.getSecurityQuestion() + "','"
				+ user.getSecurityAnswer() + "',"+user.getProject()+")";
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
		String query = "insert into epic (name,project,priority,description,created_by,lmb) values ('" + epic.getName()
				+ "'," + epic.getProject() + "," + epic.getPriority() + ",'" + epic.getDescription() + "','"
				+ epic.getLmb() + "','" + epic.getLmb() + "')";
		return query;
	}

	public static String getAllEpicsQuery() {
		String query = "select * from epic";
		return query;
	}

	public static PreparedStatement getAddUserStoryQuery(UserStory us) {
		String query = "insert into user_story (project,epic,name,priority,description,lmb,lmd,created_by) values (?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = DBConnectionUtil.getconnection().prepareStatement(query);
			ps.setInt(1, us.getProject());
			ps.setInt(2, us.getEpic());
			ps.setString(3, us.getName());
			ps.setInt(4, us.getPrioroty());
			ps.setString(5, us.getDescription());
			ps.setString(6, us.getLmb());
			ps.setString(7, us.getLmd());
			ps.setString(8, us.getCreatedBy());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getAddUserStoryQuery : " + ps.toString());
		return ps;
	}

	public static String getAllUserStoriesQuery() {
		return "select * from user_story";
	}

	public static String getSearchProjectsQuery(Project project) {
		boolean andNeeded = false;
		String query = "select * from project where ";

		boolean isConditionAdded = false;
		if (project.getId() != 0) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " id = " + project.getId() + "";
			isConditionAdded = true;
		}
		if (!project.getStatus().equalsIgnoreCase("select")) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " status = '" + project.getStatus() + "'";
			isConditionAdded = true;
		}
		if (!project.getStartDate().isEmpty()) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " start_date >= '" + project.getStartDate() + "'";
			isConditionAdded = true;
		}
		if (!project.getEndDate().isEmpty()) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " end_date <= '" + project.getEndDate() + "'";
			isConditionAdded = true;
		}

		if (!project.getViva().equalsIgnoreCase("0")) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " viva <= " + project.getViva() + "";
			isConditionAdded = true;
		}
		if (!project.getCreatedBy().equalsIgnoreCase("")) {
			if (andNeeded) {
				query += " AND";
			} else {
				andNeeded = true;
			}
			query += " created_by = '" + project.getCreatedBy() + "'";
			isConditionAdded = true;
		}
		if(isConditionAdded == false) {
			query +=" id != 0 ";
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
		String query = "update project set name ='" + project.getName() + "', start_date='" + project.getStartDate()
				+ "' , end_date='" + project.getEndDate() + "', manager ='" + project.getManager()
				+ "', description = '" + project.getDescription() + "', status='" + project.getStatus()
				+ "', priority='" + project.getPriority() + "' where id=" + project.getId();
		return query;
	}

	public static String getSpringByIdQuery(int sprintId) {
		String query = "select * from sprint where id=" + sprintId;
		return query;
	}

	public static String getEpicsBySprintIdQuery(String sprintId) {
		String query = "select * from epic where sprint = " + sprintId;
		return query;
	}

	public static String updateSptintQuery(Sprint sprint) {
		System.out.println("update Sprint : " + sprint);
		String query = "update sprint set name='" + sprint.getSprintName() + "', start_date = '" + sprint.getStartDate()
				+ "', end_date='" + sprint.getEndDate() + "', priority = " + sprint.getSeverity() + ", status='"
				+ sprint.getStatus() + "', last_modified_by = '" + sprint.getLastModifiedBy() + "', description='"+sprint.getDescription()+"' where id="
				+ sprint.getSprintId();
		return query;
	}

	public static String getAddHistoryQuery(History history) {
		System.out.println("Add history method input : " + history);
		String query = "insert into history (job_id,job_type,comment,hdate,owner) values (" + history.getJobId() + ",'"
				+ history.getJobType() + "','" + history.getComment() + "','" + history.gethDate() + "','"
				+ history.getOwner() + "')";
		return query;
	}

	public static String getHistoryByjobIdAndJobType(int jobId, String jobType) {
		System.out.println("getHistoryByjobIdAndJobType input jobId : " + jobId + " , jobType : " + jobType);
		String query = "select * from history where jobId = " + jobId + " and jobType = '" + jobType + "'";
		return query;
	}

	public static String getIsProjectExistQuery(Project project) {
		System.out.println("getIsProjectExistQuery input : " + project);
		String query = "select * from project where name = '" + project.getName() + "'";
		return query;
	}

	public static PreparedStatement getBusinessValuesPS() {
		String query = "select * from bv where status = ?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = DBConnectionUtil.getconnection().prepareStatement(query);
			prepareStatement.setBoolean(1, true);
			System.out.println("getAllBusinessValuesPS Query : " + prepareStatement.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prepareStatement;
	}
	public static PreparedStatement getAllBusinessValuesPS() {
		String query = "select * from bv";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = DBConnectionUtil.getconnection().prepareStatement(query);
			prepareStatement.setBoolean(1, true);
			System.out.println("getAllBusinessValuesPS Query : " + prepareStatement.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prepareStatement;
	}
	public static PreparedStatement getEpicsByProjectIdQuery(Integer projectId) {
		String query = "select * from epic where project = ?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = DBConnectionUtil.getconnection().prepareStatement(query);
			prepareStatement.setInt(1, projectId);
			System.out.println("getAllBusinessValuesPS Query : " + prepareStatement.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prepareStatement;

	}

	public static PreparedStatement getAllUserStoriesByEpicPS(int epicId) {
		String query = "select * from user_story where epic = ?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = DBConnectionUtil.getconnection().prepareStatement(query);
			prepareStatement.setInt(1, epicId);
			System.out.println("getAllUserStoriesByEpicPS Query : " + prepareStatement.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prepareStatement;

	}

	public static PreparedStatement getEpicByIdPs(int epicId) {
		String query = "select * from epic where id = ?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = DBConnectionUtil.getconnection().prepareStatement(query);
			prepareStatement.setInt(1, epicId);
			System.out.println("getEpicByIdPs Query : " + prepareStatement.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prepareStatement;

	}

	public static PreparedStatement getCheckBvExist(String bvName) {
		String query = "select * from bv where name=?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = DBConnectionUtil.getconnection().prepareStatement(query);
			prepareStatement.setString(1, bvName.trim());

			System.out.println("getCheckBvExist Query : " + prepareStatement.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prepareStatement;

	}

	public static PreparedStatement getAddBVQuery(BusinessValue bv) {
		String query = "insert into bv (name,description) values (?,?)";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = DBConnectionUtil.getconnection().prepareStatement(query);
			prepareStatement.setString(1, bv.getName());
			prepareStatement.setString(2, bv.getDescription());
			System.out.println("getAddBVQuery Query : " + prepareStatement.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prepareStatement;

	}

	public static PreparedStatement getUserStoryByUsNamePS(String usName) {
		String query = "select * from user_story where name = ?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = DBConnectionUtil.getconnection().prepareStatement(query);
			prepareStatement.setString(1, usName);
			System.out.println("getUserStoryByUsNamePS Query : " + prepareStatement.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prepareStatement;
	}

	public static PreparedStatement getUserStoryByUsIdPS(int userStoryId) {
		String query = "select * from user_story where id = ?";
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = DBConnectionUtil.getconnection().prepareStatement(query);
			prepareStatement.setInt(1, userStoryId);
			System.out.println("getUserStoryByUsIdPS Query : " + prepareStatement.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prepareStatement;
	}

	public static PreparedStatement getUpdateUserStoryPS(UserStory us) {
		String query = "update user_story set name=? , project=?, sprint=?, epic=?, priority=?, status=?, "
				+ "description=?, lmb=?, lmd=? where id=?";
		PreparedStatement ps = null;
		try {
			ps = DBConnectionUtil.getconnection().prepareStatement(query);
			ps.setString(1, us.getName());
			ps.setInt(2, us.getProject());
			ps.setInt(3, us.getSprint());
			ps.setInt(4, us.getEpic());
			ps.setString(5, us.getPrioroty() + "");
			ps.setString(6, us.getStatus());
			ps.setString(7, us.getDescription());
			ps.setString(8, us.getLmb());
			ps.setString(9, us.getLmd());
			ps.setInt(10, us.getId());

			System.out.println("getUpdateUserStoryPS Query : " + ps.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}

	public static PreparedStatement getAddBvsToEpicPs(int epicId, String[] bvs, String[] comments) {
		String query = "insert into epic_bv(eid,bid,comment) values ";

		for (int i = 0; i < bvs.length; i++) {
			query += "(?,?,?)";
			if (i < bvs.length - 1) {
				query += ",";
			}
		}
		PreparedStatement ps = null;
		try {
			ps = DBConnectionUtil.getconnection().prepareStatement(query);
			int i = 0;
			
			for (int j =0 ; j< bvs.length ; j++) {
				ps.setInt(++i, epicId);
				ps.setInt(++i, Integer.valueOf(bvs[j]));
				ps.setString(++i, comments[j]);
			}

			System.out.println("getAddBvsToEpicPs Query : " + ps.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}

	public static PreparedStatement getUpdateEpicPs(Epic epic) {
		String sql = "update epic set name=?, project = ?, sprint = ?, priority=?, status=?, description=? where id =?";

		PreparedStatement ps = null;
		try {
			ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			ps.setString(1, epic.getName());
			ps.setInt(2, epic.getProject());
			ps.setInt(3, epic.getSprint());
			ps.setInt(4, epic.getPriority());
			ps.setString(5, epic.getStatus());
			ps.setString(6, epic.getDescription());
			ps.setInt(7, epic.getId());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getUpdateEpicPs query : " + ps.toString());
		return ps;
	}

	public static PreparedStatement getEBvsByEpicIdPs(int epicId) {
		String sql = "select * from epic_bv where eid = ?";

		PreparedStatement ps = null;
		try {
			ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			ps.setInt(1, epicId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getEBvsByEpicIdPs query : " + ps.toString());
		return ps;
	}
	
	public static PreparedStatement getBvsByEpicIdPs(int epicId) {
		String sql = "SELECT * FROM epic_bv where eid = ?";

		PreparedStatement ps = null;
		try {
			ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			ps.setInt(1, epicId);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getBvsByEpicIdPs query : " + ps.toString());
		return ps;
	}

	public static PreparedStatement getAddBvsToUsPs(int usId, String[] bvs, String[] comments) {
		String query = "insert into us_bv(usid,bvid, comment) values ";

		for (int i = 0; i < bvs.length; i++) {
			query += "(?,?,?)";
			if (i < bvs.length - 1) {
				query += ",";
			}
		}
		PreparedStatement ps = null;
		try {
			ps = DBConnectionUtil.getconnection().prepareStatement(query);
			int i = 0;
			
			for (int j =0 ; j< bvs.length ; j++) {
				ps.setInt(++i, usId);
				ps.setInt(++i, Integer.valueOf(bvs[j]));
				ps.setString(++i, comments[j]);
			}

			System.out.println("getAddBvsToUsPs Query : " + ps.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}

	public static PreparedStatement getBvsByUsIdPs(int userStoryId) {
		String sql = "select * from us_bv where usid = ?";

		PreparedStatement ps = null;
		try {
			ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			ps.setInt(1, userStoryId);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getBvsByUsIdPs query : " + ps.toString());
		return ps;
	}
}
