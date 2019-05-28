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
		Epic epic = new Epic();
		epic.setDescription(String.valueOf(request.getParameter("description")));
		epic.setLmb(String.valueOf(request.getParameter("createdBy")));
		epic.setName(String.valueOf(request.getParameter("epicName")));
		try {
			epic.setProject(Integer.valueOf(request.getParameter("projectName")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		try {
			epic.setSeverity(Integer.valueOf(request.getParameter("severity")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		try {
			epic.setSprint(Integer.valueOf(request.getParameter("sprintName")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		String addEpicResponse = epicDao.addEpic(epic);

		response.getWriter().write(addEpicResponse);

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
