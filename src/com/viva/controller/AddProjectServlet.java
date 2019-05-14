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
import com.viva.dao.Response;
import com.viva.dto.Project;

/**
 * Servlet implementation class AddProjectServlet
 */
@WebServlet(value="/addProject")
public class AddProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProjectDao dao = new ProjectDao();
	RequestDispatcher requestDispatcher = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Project project = new Project();
		project.setName(String.valueOf(request.getParameter("projectName")));
		project.setSeverity(Integer.valueOf(request.getParameter("projectSeverity")));
		project.setStartDate(String.valueOf(request.getParameter("projectStartDate")));
		project.setEndDate(String.valueOf(request.getParameter("projectEndDate")));
		project.setCreatedBy(String.valueOf(request.getParameter("createdBy")));
		project.setManager(String.valueOf(request.getParameter("projectManager")));
		project.setDescription(String.valueOf(request.getParameter("projectDescription")));
		project.setLastModifiedBy(project.getCreatedBy());
		
		Response addProjectResponse = dao.addProject(project);
		
		request.getSession().setAttribute("response", addProjectResponse);
		String landingPage = "";
		String userType = String.valueOf(request.getSession().getAttribute("userType"));
		if("manager".equalsIgnoreCase(userType)) {
			landingPage = "./managerHome.jsp";
			ProjectDao projectDao = new ProjectDao();
			List<Project> lastUpdatedProjectsList = projectDao.lastUpdatedProjectsListByManagerId(project.getCreatedBy());
			request.getSession().setAttribute("lastUpdatedProjectsList", lastUpdatedProjectsList);
			
			
			List<Project> projectsByManagerId = projectDao.getProjectsByAssignedManager(project.getCreatedBy());
			request.getSession().setAttribute("projectsByManagerId", projectsByManagerId);
			
		}else if("admin".equalsIgnoreCase(userType)) {
			landingPage = "./adminHome.jsp";
		}else if("technical".equalsIgnoreCase(userType)) {
			landingPage = "./technicalHome.jsp";
		}
		String lastAccessedPage = "projects";
		request.getSession().setAttribute("lastAccessedPage", lastAccessedPage);
		requestDispatcher = request.getRequestDispatcher(landingPage);
		requestDispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
