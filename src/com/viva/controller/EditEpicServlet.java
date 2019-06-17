package com.viva.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.EpicDao;
import com.viva.dto.Epic;

/**
 * Servlet implementation class EditEpicServlet
 */
@WebServlet(name = "updateEpic", urlPatterns = { "/updateEpic" })
public class EditEpicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EpicDao epicDao = new EpicDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEpicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EditEpicServlet got called ....................");
		Epic epic = new Epic();
		int epicEditId=0;
		try {
			epicEditId = Integer.valueOf(request.getParameter("epicEditId"));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing update Epic epicEditId id ");
		}
		epic.setId(epicEditId);
		
		
		int projectId = 0;
		try {
			projectId = Integer.valueOf(request.getParameter("editEpicProjectName"));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing update Epic project id ");
		}
		epic.setProject(projectId);
		
		int sprintId = 0;
		try {
			sprintId = Integer.valueOf(request.getParameter("editEpicSprintName"));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing update Epic Sprint id ");
		}
		epic.setSprint(sprintId);
		
		epic.setName(String.valueOf(request.getParameter("editEpicName")));
		epic.setDescription(String.valueOf(request.getParameter("editEpicDescription")));
		int priority=0;
		try {
			priority = Integer.valueOf(request.getParameter("editEpicPriority"));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing update Epic priority id ");
		}
		epic.setPriority(priority);
		
		epic.setStatus(String.valueOf(request.getParameter("editEpicStatus")));
		
		String updateResponse = epicDao.updateEpic(epic);
		System.out.println("Update epic response : " + updateResponse);
		response.getWriter().write(updateResponse);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
