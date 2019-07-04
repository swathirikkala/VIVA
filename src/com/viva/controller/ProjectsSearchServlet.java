package com.viva.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.ProjectDao;
import com.viva.dto.Project;

/**
 * Servlet implementation class ProjectsSearchServlet
 */
@WebServlet(name = "searchProjects", urlPatterns = { "/searchProjects" })
public class ProjectsSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProjectDao projectDao = new ProjectDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectsSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		Project project = new Project();
		try {
			project.setId(Integer.valueOf(request.getParameter("projectId")));
		} catch (NumberFormatException e) {
			System.out.println(e.getMessage());
		}
		project.setStatus(String.valueOf(request.getParameter("projectStatus")));
		project.setStartDate(String.valueOf(request.getParameter("projectStartDate")));
		project.setEndDate(String.valueOf(request.getParameter("projectEndDate")));
		try {
			project.setViva(String.valueOf(request.getParameter("projectViva")));
		} catch (NumberFormatException e) {
			System.out.println(e.getMessage());
		}
		response.setContentType("text/html");
		project.setCreatedBy(String.valueOf(request.getParameter("createdByName")));
		try {
			List<Project> projects = projectDao.searchProjects(project);
			request.getSession().setAttribute("projects", projects);
			if(projects == null || projects.isEmpty()) {
				out.write("noData");
			}else {
				out.write("success");
			}
		} catch (Exception e) {
			out.write("fail");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
