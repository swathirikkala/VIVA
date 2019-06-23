package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.UserStoryDao;
import com.viva.dao.util.ResponseBuilder;
import com.viva.dto.Response;
import com.viva.dto.UserStory;
import com.viva.util.JSONUtil;

/**
 * Servlet implementation class UserStoriesSearchByEpicIdServlet
 */
@WebServlet(name = "userStoriesByEpic", urlPatterns = { "/userStoriesByEpic" })
public class UserStoriesSearchByEpicIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserStoryDao userStoryDao = new UserStoryDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserStoriesSearchByEpicIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int epicId = 0;
		try {
			epicId = Integer.valueOf(request.getParameter("epicId"));
		} catch (NumberFormatException e) {
			System.err.println("epic id parsing error");
		}
		List<UserStory> allUserStoriesByEpic = userStoryDao.getAllUserStoriesByEpic(epicId);
		Response resp= null;
		if(allUserStoriesByEpic != null && !allUserStoriesByEpic.isEmpty()) {
			resp = ResponseBuilder.getResponse(allUserStoriesByEpic.size(), "epics",allUserStoriesByEpic );
		}else {
			resp = ResponseBuilder.getResponse(0, "epics",allUserStoriesByEpic );
		}
		response.setContentType("application/json");
		JSONUtil.mapper.writeValue(response.getOutputStream(), resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
