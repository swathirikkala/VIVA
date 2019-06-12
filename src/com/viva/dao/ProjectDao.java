package com.viva.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.History;
import com.viva.dto.Project;

public class ProjectDao {

	HistoryDao historyDao = new HistoryDao();

	public String addProject(Project project) {
		String response = "fail";
		if (!isProjectExist(project)) {
			int addProjectResponse = DBConnectionUtil.insert(QueryBuilder.getAddProjectQuery(project));
			if (addProjectResponse > 0) {
				response = "success";
				History history = new History(0, addProjectResponse, "PJ", "Created", project.getCretatedDate(),
						project.getCreatedBy());
				boolean addHistory = historyDao.addHistory(history);
				System.out.println("addProject addHistory : " + addHistory);
			} else if (addProjectResponse < 0) {
				response = "exception";
			}
		} else {
			response = "exist";
		}
		return response;
	}

	public boolean isProjectExist(Project project) {
		boolean isExist = false;
		String query = QueryBuilder.getIsProjectExistQuery(project);
		ResultSet rs = DBConnectionUtil.getData(query);
		try {
			if (rs != null && rs.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			System.out.println("isProjectExist exception : " + e.getMessage());
		}
		System.out.println("isProjectExist : " + isExist);
		return isExist;
	}

	public List<Project> getProjects() {
		String getAllProjectsQuery = QueryBuilder.getAllProjectsQuery();
		ResultSet data = DBConnectionUtil.getData(getAllProjectsQuery);
		List<Project> allProjects = parseProjects(data);
		return allProjects;
	}

	public List<Project> getProjectsByAssignedManager(String managerId) {
		ResultSet data = DBConnectionUtil.getData(QueryBuilder.getProjectsByAssignedManagerQuery(managerId));
		List<Project> assigendProjects = parseProjects(data);
		return assigendProjects;
	}

	public String updateProject(Project project) {
		String response = "fail";
		if("".equals(project.getStartDate())) {
			project.setStartDate("2000-01-01");
		}
		if("".equals(project.getEndDate())) {
			project.setEndDate("2000-01-01");
		}
		String query = QueryBuilder.getUpdateProjectQuery(project);
		int insertResponse = DBConnectionUtil.insert(query);
		if (insertResponse > 0) {
			response = "success";
		} else if (insertResponse == -1) {
			response = "exception";
		}
		return response;
	}

	private List<Project> parseProjects(ResultSet rs) {
		String pattern = "dd/MM/yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		List<Project> projects = new ArrayList<Project>();
		try {
			while (null != rs && rs.next()) {
				Project project = new Project();

				project.setId(rs.getInt(1));
				project.setName(rs.getString(2));
				project.setPriority(rs.getInt(3));
//				java.util.Date startDate = new java.util.Date(rs.getDate(4).getTime());
//				String sd = simpleDateFormat.format(startDate);
				project.setStartDate(rs.getString(4));
//				java.util.Date endDate = new java.util.Date(rs.getDate(5).getTime());
//				String ed = simpleDateFormat.format(endDate);
				project.setEndDate(rs.getString(5));
				project.setCreatedBy(rs.getString(6));
				project.setManager(rs.getString(7));
				project.setDescription(rs.getString(8));
				project.setLastModifiedBy(rs.getString(9));
				project.setLastModifiedDateTime(rs.getString(10));
				project.setStatus(rs.getString(11));
				project.setViva(rs.getString(12));
				java.util.Date createdDate = new java.util.Date(rs.getDate(13).getTime());
				String cd = simpleDateFormat.format(createdDate);
				project.setCretatedDate(cd);
				projects.add(project);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Projects : " + projects);
		return projects;
	}

	public List<Project> lastUpdatedProjectsListByManagerId(String managerId) {
		ResultSet data = DBConnectionUtil.getData(QueryBuilder.getLastUpdatedProjectsListByManagerIdQuery(managerId));
		List<Project> assigendProjects = parseProjects(data);
		return assigendProjects;
	}

	public List<Project> searchProjects(Project project) {
		String searchProjectsQuery = QueryBuilder.getSearchProjectsQuery(project);
		ResultSet data = DBConnectionUtil.getData(searchProjectsQuery);
		List<Project> searchResultProjects = parseProjects(data);
		return searchResultProjects;
	}

	public Project getProjectById(String projectId) {
		Project project = null;
		String query = QueryBuilder.getProjectByIdQuery(projectId);
		ResultSet data = DBConnectionUtil.getData(query);
		List<Project> projectById = parseProjects(data);
		if (projectById != null) {
			project = projectById.get(0);
		}
		return project;
	}
}
