package com.viva.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.UserStoryDao;
import com.viva.dto.UserStory;
import com.viva.util.DateUtil;

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
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserStory us = new UserStory();
		us.setDescription(String.valueOf(request.getParameter("usDescription")));
		try {
			us.setEpic(Integer.valueOf(request.getParameter("usEpicName")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		us.setName(String.valueOf(request.getParameter("usName")));
		try {
			us.setProject(Integer.valueOf(request.getParameter("usProjectName")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		us.setPrioroty(Integer.valueOf(request.getParameter("usPriority")));
		us.setLmd(DateUtil.getSqlDate());
		us.setLmb(String.valueOf(request.getSession().getAttribute("userId")));
		us.setCreatedBy(String.valueOf(request.getSession().getAttribute("userId")));
		String addUserStoryResponse = userStoryDao.addUserStory(us);
		System.out.println("Add User Story response : " + addUserStoryResponse);
		response.getWriter().write(addUserStoryResponse);

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
