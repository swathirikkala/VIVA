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
import com.viva.dto.Epic;
import com.viva.dto.Project;
import com.viva.dto.Sprint;

/**
 * Servlet implementation class LoadSprintServlet
 */
@WebServlet(name = "loadSprint", urlPatterns = { "/loadSprint" })
public class LoadSprintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       SprintDao sprintDao =new SprintDao();
       EpicDao epicDao = new EpicDao();
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
		String sprintId = "0";
		sprintId = String.valueOf(request.getParameter("sprintId"));
		Sprint sprint = sprintDao.getSprintById(sprintId);
		request.getSession().setAttribute("sprint", sprint);
		List<Epic> epics = epicDao.getEpicsBySprintId(sprintId);
		request.getSession().setAttribute("epics", epics);
		
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
