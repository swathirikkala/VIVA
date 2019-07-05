package com.viva.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.SprintDao;
import com.viva.dao.UserStoryDao;
import com.viva.dto.Sprint;
import com.viva.dto.UserStory;

/**
 * Servlet implementation class LoadSprintServlet
 */
@WebServlet(name = "loadSprint", urlPatterns = { "/loadSprint" })
public class LoadSprintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       SprintDao sprintDao =new SprintDao();
       UserStoryDao userStoryDao = new UserStoryDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadSprintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Load Sprint for edit servlet got called");
		PrintWriter out = response.getWriter();
		int sprintId = 0;
		try {
			sprintId = Integer.valueOf(request.getParameter("sprintId"));
		} catch (NumberFormatException e) {
			System.err.println("Exception in loadSprint sprint id parse error");
		}
		Sprint sprint = sprintDao.getSprintById(sprintId);
		request.getSession().setAttribute("sprint", sprint);
		List<UserStory> userStories = userStoryDao.getAllUserStoriesBySprint(sprintId);
		request.getSession().setAttribute("userStories", userStories);
		response.setContentType("text/html");
		if(sprint == null ) {
			out.write("noData");
		}else {
			out.write("success");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
