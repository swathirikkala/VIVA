package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.SprintDao;
import com.viva.dto.Sprint;
import com.viva.util.JSONUtil;

/**
 * Servlet implementation class SprintSearchByProjectIdServlet
 */
@WebServlet(name = "sprintSearchByProjectId", urlPatterns = { "/sprintSearchByProjectId" })
public class SprintSearchByProjectIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SprintDao sprintDao = new SprintDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SprintSearchByProjectIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int projectId = -1;
		try {
			projectId = Integer.valueOf(request.getParameter("projectId"));
		} catch (NumberFormatException e) {
			System.out.println("Error in SprintSearchByProjectIdServlet");
		}
		List<Sprint> spintsByProject = sprintDao.getSpintsByProject(String.valueOf(projectId));
		if(spintsByProject != null && !spintsByProject.isEmpty()) {
			//JSONUtil.mapper.writer();
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
