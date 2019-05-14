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
import com.viva.dao.SprintDao;
import com.viva.dto.Sprint;

/**
 * Servlet implementation class SpintHomeServlet
 */
@WebServlet(value = "/sprintHome")
public class SpintHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       SprintDao sprintDao = new SprintDao();
       ProjectDao projectDao = new ProjectDao();
       
       RequestDispatcher requestDispatcher = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpintHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String projectId = String.valueOf(request.getParameter("projectId"));
		if(null == projectId) {
			projectId = "1";
		}
		List<Sprint> sprintsByProjectId = sprintDao.getSpintsByProject(projectId);
		request.getSession().setAttribute("sprintsByProjectId", sprintsByProjectId);
		request.getSession().setAttribute("projectId", projectId);
		
		requestDispatcher = request.getRequestDispatcher("./sprintHome.jsp");
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
