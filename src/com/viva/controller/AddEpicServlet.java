package com.viva.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.EpicDao;
import com.viva.dto.Epic;

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
		epic.setName(String.valueOf(request.getParameter("epicName")));
		try {
			epic.setProject(Integer.valueOf(request.getParameter("projectName")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		try {
			epic.setSeverity(Integer.valueOf(request.getParameter("epicPriority")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		epic.setDescription(String.valueOf(request.getParameter("description")));
		epic.setLmb(String.valueOf(request.getSession().getAttribute("userId")));

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
