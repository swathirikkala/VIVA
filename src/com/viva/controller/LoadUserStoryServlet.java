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
import com.viva.dao.UsBvDao;
import com.viva.dao.UserStoryDao;
import com.viva.dto.BusinessValue;
import com.viva.dto.Epic;
import com.viva.dto.Sprint;
import com.viva.dto.UsBv;
import com.viva.dto.UserStory;
import com.viva.util.Constants;

/**
 * Servlet implementation class LoadUserStoryServlet
 */
@WebServlet(name = "loadUserStory", urlPatterns = { "/loadUserStory" })
public class LoadUserStoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserStoryDao userStoryDao = new UserStoryDao();
    private SprintDao sprintDao = new SprintDao();
    private EpicDao epicDao = new EpicDao();
    private UsBvDao usBvDao = new UsBvDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadUserStoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Load User Story for edit servlet got called");
		PrintWriter out = response.getWriter();
		int userStoryId = 0;
		try {
			userStoryId = Integer.valueOf(request.getParameter("userStoryId"));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing user story id in LoadUserStoryServlet");
		}

		UserStory userStory = userStoryDao.getUserStoryByUsId(userStoryId);//userStoryForEdit
		if(userStory != null) {
			request.getSession().setAttribute("userStoryForEdit", userStory);
			List<Sprint> sprintsByProjectUsEdit = sprintDao.getSpintsByProject(userStory.getProject()+"");
			request.getSession().setAttribute("sprintsByProjectUsEdit", sprintsByProjectUsEdit);
			List<Epic> epicsByProjectUsEdit = epicDao.getEpicsByProjectId(userStory.getProject());
			request.getSession().setAttribute("epicsByProjectUsEdit", epicsByProjectUsEdit);
			List<UsBv> bvsByUsId =usBvDao.getBvsByUsId(userStoryId);
			request.getSession().setAttribute("bvsByUsId", bvsByUsId);
			out.write(Constants.SUCCESS);
		}else {
			out.write(Constants.NO_DATA_FOUND);
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
