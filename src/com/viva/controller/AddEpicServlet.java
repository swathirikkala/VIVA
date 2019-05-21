package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.EpicDao;
import com.viva.dao.ProjectDao;
import com.viva.dao.Response;
import com.viva.dto.Epic;
import com.viva.dto.Project;

/**
 * Servlet implementation class AddEpicServlet
 */
@WebServlet(name = "addEpic", urlPatterns = { "/addEpic" })
public class AddEpicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EpicDao epicDao = new EpicDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddEpicServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	RequestDispatcher requestDispatcher = null;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Epic epic = new Epic();
		epic.setAssignedTo(String.valueOf(request.getParameter("assignTo")));
		epic.setDescription(String.valueOf(request.getParameter("description")));
		epic.setEndDate(String.valueOf(request.getParameter("endDate")));
		epic.setLmb(String.valueOf(request.getParameter("createdBy")));
		// epic.setLmt(String.valueOf(request.getParameter("")));
		epic.setManager(String.valueOf(request.getParameter("projectManager")));
		epic.setName(String.valueOf(request.getParameter("epicName")));
		try {
			epic.setProject(Integer.valueOf(request.getParameter("projectName")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		try {
			epic.setSeverity(Integer.valueOf(request.getParameter("severity")));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		epic.setStartDate(String.valueOf(request.getParameter("startDate")));

		try {
			epic.setSprint(Integer.valueOf(request.getParameter("sprintName")));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Response addEpicResponse = epicDao.addEpic(epic);
		request.getSession().setAttribute("response", addEpicResponse);

		String landingPage = "";
		String userType = String.valueOf(request.getSession().getAttribute("userType"));

		if ("manager".equalsIgnoreCase(userType)) {
			landingPage = "./managerHome.jsp";
		} else if ("admin".equalsIgnoreCase(userType)) {
			landingPage = "./adminHome.jsp";
		} else if ("technical".equalsIgnoreCase(userType)) {
			landingPage = "./technicalHome.jsp";
		}
		requestDispatcher = request.getRequestDispatcher(landingPage);
		requestDispatcher.forward(request, response);

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
