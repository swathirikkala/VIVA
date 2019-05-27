package com.viva.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.viva.dao.util.ResponseBuilder;
import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.Project;

public class ProjectDao {

	public Response addProject(Project project) {

		int addProjectResponse = DBConnectionUtil.insert(QueryBuilder.getAddProjectQuery(project));
		return ResponseBuilder.getResponse(addProjectResponse, "Project Creation", project);
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

	public Response getProjectsByCreatedBy() {
		return null;
	}

	public Response updateProject() {
		return null;
	}

	public Response deleteProject() {
		return null;
	}

	public Response getProjectUniqueBusinessValues() {
		return null;
	}

	public Response getProjectSegregatedBusinessValues() {
		return null;
	}

	private List<Project> parseProjects(ResultSet rs) {
		String pattern = "dd-MM-yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		List<Project> projects = new ArrayList<Project>();
		try {
			while (null != rs && rs.next()) {
				Project project = new Project();

				project.setId(rs.getInt(1));
				project.setName(rs.getString(2));
				project.setSeverity(rs.getInt(3));
				java.util.Date startDate = new java.util.Date(rs.getDate(4).getTime());
				String sd = simpleDateFormat.format(startDate);
				project.setStartDate(sd);
				java.util.Date endDate = new java.util.Date(rs.getDate(5).getTime());
				String ed = simpleDateFormat.format(endDate);
				project.setEndDate(ed);
				project.setCreatedBy(rs.getString(6));
				project.setManager(rs.getString(7));
				project.setDescription(rs.getString(8));
				project.setLastModifiedBy(rs.getString(9));
				project.setLastModifiedDateTime(rs.getString(10));
//				project.setStatus(rs.getString(11));
//				project.setViva(rs.getInt(12));
				projects.add(project);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
		if(projectById != null) {
			project = projectById.get(0);
		}
		return project;
	}
}
