package com.viva.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.EpicDao;
import com.viva.dao.SprintDao;
import com.viva.dao.UserStoryDao;
import com.viva.dto.Epic;
import com.viva.dto.Sprint;
import com.viva.dto.UserStory;

/**
 * Servlet implementation class LoadEpicServlet
 */
@WebServlet(name = "loadEpic", urlPatterns = { "/loadEpic" })
public class LoadEpicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EpicDao epicDao = new EpicDao();
	UserStoryDao userStoryDao = new UserStoryDao();
	SprintDao sprintDao = new SprintDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadEpicServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LoadEpicServlet for edit servlet got called");
		PrintWriter out = response.getWriter();
		int epicId = 0;
		String eid = String.valueOf(request.getParameter("epicId"));
		if (eid != null && !eid.isEmpty()) {
			epicId = Integer.valueOf(eid);
		}

		Epic epic = epicDao.getEpicById(epicId);
		request.getSession().setAttribute("epic", epic);
		if (epic != null) {
			List<Sprint> spintsByEpic = sprintDao.getSpintsByProject(String.valueOf(epic.getProject()));
			request.getSession().setAttribute("spintsByEpic", spintsByEpic);
		}

		List<UserStory> allUserStoriesByEpic = userStoryDao.getAllUserStoriesByEpic(epicId);
		request.getSession().setAttribute("userStories", allUserStoriesByEpic);

		if (epic == null) {
			out.write("noData");
		} else {
			out.write("success");
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
