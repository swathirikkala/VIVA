package com.viva.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.ProjectDao;
import com.viva.dto.Project;

/**
 * Servlet implementation class EditProjectServlet
 */
@WebServlet(name = "editProject", urlPatterns = { "/editProject" })
public class EditProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProjectDao projectDao = new ProjectDao();
	RequestDispatcher requestDispatcher = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProjectServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Update Project Servlet got called");
		Project project = new Project();
		PrintWriter printWriter = response.getWriter();
		project = (Project) request.getSession().getAttribute("project");
		project.setName(String.valueOf(request.getParameter("editProjectName")));
		project.setStartDate(String.valueOf(request.getParameter("editProjectStartDate")));
		project.setEndDate(String.valueOf(request.getParameter("editEndDate")));
		project.setStatus(String.valueOf(request.getParameter("editProjectStatus")));
		project.setManager(String.valueOf(request.getParameter("editProjectManager")));
		try {
			project.setPriority(Integer.valueOf(request.getParameter("editProjectPriority")));
		} catch (NumberFormatException e) {
			System.err.println(e.getMessage());
		}
		project.setDescription(String.valueOf(request.getParameter("editProjectDescription")));
		String updateProjectResponse = projectDao.updateProject(project);
		printWriter.write(updateProjectResponse);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
