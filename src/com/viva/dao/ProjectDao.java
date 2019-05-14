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

	public Response getProjects() {
		return null;
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
}
