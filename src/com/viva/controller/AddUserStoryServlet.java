package com.viva.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.Response;
import com.viva.dao.UserStoryDao;
import com.viva.dto.UserStory;

/**
 * Servlet implementation class AddUserStoryServlet
 */
@WebServlet(name = "addUserStory", urlPatterns = { "/addUserStory" })
public class AddUserStoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserStoryDao userStoryDao = new UserStoryDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddUserStoryServlet() {
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
		UserStory us = new UserStory();
		us.setAssignTo(String.valueOf(request.getParameter("assignTo")));
		us.setDescription(String.valueOf(request.getParameter("description")));
		us.setEndDate(String.valueOf(request.getParameter("endDate")));
		try {
			us.setEpic(Integer.valueOf(request.getParameter("epicName")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		us.setManager(String.valueOf(request.getParameter("projectManager")));
		us.setName(String.valueOf(request.getParameter("usName")));
		us.setPrioroty(String.valueOf(request.getParameter("")));
		try {
			us.setProject(Integer.valueOf(request.getParameter("projectName")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		us.setPrioroty(String.valueOf(request.getParameter("severity")));
		try {
			us.setSprint(Integer.valueOf(request.getParameter("sprintName")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		us.setStartDate(String.valueOf(request.getParameter("startDate")));
		us.setLmb(String.valueOf(request.getParameter("createdBy")));
		Response addUserStory = userStoryDao.addUserStory(us);
		request.getSession().setAttribute("response", addUserStory);

		String landingPage = String.valueOf(request.getSession().getAttribute("landingPage"));
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(landingPage);
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
