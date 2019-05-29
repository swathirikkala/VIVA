package com.viva.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.SprintDao;
import com.viva.dto.Sprint;

/**
 * Servlet implementation class EditSprintServlet
 */
@WebServlet(name = "editSprint", urlPatterns = { "/editSprint" })
public class EditSprintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SprintDao sprintDao = new SprintDao();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditSprintServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		Sprint sprint = new Sprint();
		sprint = (Sprint) request.getSession().getAttribute("sprint");
		String lmb = String.valueOf(request.getSession().getAttribute("userId"));
		sprint.setLastModifiedBy(lmb);
		sprint.setDescription(String.valueOf(request.getParameter("editSprintDescription")));
		String ssd = String.valueOf(request.getParameter("sprintEditStartDate"));
		if (ssd != null)
			sprint.setStartDate(ssd);
		String sed = String.valueOf(request.getParameter("sprintEditEndDate"));
		if (sed != null)
			sprint.setEndDate(sed);
		int ss = 0;
		try {
			ss = Integer.valueOf(request.getParameter("editSprintPriority"));
		} catch (NumberFormatException e) {
			System.out.println(e.getLocalizedMessage());

		}
		sprint.setSeverity(ss);
		sprint.setStatus(String.valueOf(request.getParameter("editSprintStatus")));
		int projectId = -1;
		try {
			projectId = Integer.valueOf(request.getParameter("editSprintProjectName"));
		} catch (NumberFormatException e) {
			System.out.println("Error in project id format : " + e.getLocalizedMessage());
		}
		if (projectId != -1)
			sprint.setProjectId(projectId);

		String resp = sprintDao.updateSptint(sprint);
		response.getWriter().write(resp);
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
