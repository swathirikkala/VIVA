package com.viva.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.EpicBvDao;
import com.viva.dao.EpicDao;
import com.viva.dto.Epic;
import com.viva.util.Constants;

/**
 * Servlet implementation class AddEpicServlet
 */
@WebServlet(name = "addEpic", urlPatterns = { "/addEpic" })
public class AddEpicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EpicDao epicDao = new EpicDao();
	private EpicBvDao epicBvDao = new EpicBvDao();

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
			epic.setPriority(Integer.valueOf(request.getParameter("epicPriority")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		epic.setDescription(String.valueOf(request.getParameter("description")));
		epic.setLmb(String.valueOf(request.getSession().getAttribute("userId")));

		int addEpicResponse = epicDao.addEpic(epic);
		if(addEpicResponse>0) {
			String [] bvs = request.getParameterValues("epicBusinessValues");
			System.out.println("bvs :::::: " + bvs);
			epicBvDao.addBvsToEpic(addEpicResponse, bvs);
		}
		if(addEpicResponse > 0) {
			response.getWriter().write(Constants.SUCCESS);
		}else if(addEpicResponse < 0) {
			response.getWriter().write(Constants.ERROR);
		}else{
			response.getWriter().write(Constants.FAIL);
		}

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
