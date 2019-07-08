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
import com.viva.dao.SprintDao;
import com.viva.dto.Project;
import com.viva.dto.Sprint;

/**
 * Servlet implementation class LoadProjectServlet
 */
@WebServlet(name = "loadProject", urlPatterns = { "/loadProject" })
public class LoadProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       SprintDao sprintDao = new SprintDao();
       ProjectDao projectDao = new ProjectDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String projectId = "0";
		projectId = String.valueOf(request.getParameter("projectId"));
		request.getSession().setAttribute("searchProjectId", projectId);
		List<Sprint> sprints = sprintDao.getSpintsByProject(projectId);
		request.getSession().setAttribute("sprints", sprints);
		Project project = projectDao.getProjectById(projectId);
		request.getSession().setAttribute("project", project);
		response.setContentType("text/html");
		if(project == null ) {
			out.write("noData");
		}else {
			out.write("success");
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
