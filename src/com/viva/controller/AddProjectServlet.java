package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.ProjectDao;
import com.viva.dto.Project;
import com.viva.util.DateUtil;

/**
 * Servlet implementation class AddProjectServlet
 */
@WebServlet(value = "/addProject")
public class AddProjectServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	ProjectDao dao = new ProjectDao();
	RequestDispatcher requestDispatcher = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProjectServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Project project = new Project();
		project.setName(String.valueOf(request.getParameter("projectName")));
		try {
			project.setSeverity(Integer.valueOf(request.getParameter("projectSeverity")));
		} catch (NumberFormatException e) {
			System.out.println(e.getMessage());
		}
		project.setStartDate(String.valueOf(request.getParameter("projectStartDate")));
		if (project.getStartDate().isEmpty()) {
			project.setStartDate("2000-01-01");
		}
		project.setEndDate(String.valueOf(request.getParameter("projectEndDate")));

		if (project.getEndDate().isEmpty()) {
			project.setEndDate("2000-01-01");
		}
		project.setCreatedBy(String.valueOf(request.getSession().getAttribute("userId")));
		project.setManager(String.valueOf(request.getParameter("projectManager")));
		project.setDescription(String.valueOf(request.getParameter("projectDescription")));
		project.setLastModifiedBy(String.valueOf(request.getSession().getAttribute("userId")));
		project.setCretatedDate(DateUtil.getSqlDate());
		String addProjectResponse = dao.addProject(project);
		response.getWriter().write(addProjectResponse);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
