package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.SprintDao;
import com.viva.dto.Sprint;
import com.viva.util.JSONUtil;

/**
 * Servlet implementation class AddSprintServlet
 */
@WebServlet(name = "addSprint", urlPatterns = { "/addSprint" })
public class AddSprintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SprintDao sprintDao = new SprintDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSprintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Sprint sprint =new Sprint();
		
		sprint.setCreatedBy(String.valueOf(request.getSession().getAttribute("userId")));
		sprint.setDescription(String.valueOf(request.getParameter("sprintDescription")));
		sprint.setEndDate(String.valueOf(request.getParameter("sprintEndDate")));
		sprint.setLastModifiedBy(String.valueOf(request.getSession().getAttribute("userId")));
		sprint.setManagerId(String.valueOf(request.getParameter("projectManager")));
		sprint.setProjectId(Integer.valueOf(request.getParameter("projectName")));
		sprint.setSeverity(Integer.valueOf(request.getParameter("sprintSeverity")));
		sprint.setSprintName(String.valueOf(request.getParameter("sprintName")));
		sprint.setStartDate(String.valueOf(request.getParameter("sprintStartDate")));
		
		String lastAccessedPage = "sprints";
		request.getSession().setAttribute("lastAccessedPage", lastAccessedPage);
		String addSprintResponse = sprintDao.addSprint(sprint);
		String projectId = (String) request.getSession().getAttribute("searchProjectId");
		List<Sprint> sprints = sprintDao.getSpintsByProject(projectId);
		request.getSession().setAttribute("sprints", sprints);
		response.getWriter().write(addSprintResponse);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
