package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.EpicDao;
import com.viva.dao.util.ResponseBuilder;
import com.viva.dto.Epic;
import com.viva.dto.Response;
import com.viva.util.JSONUtil;

/**
 * Servlet implementation class EpicSearchByProjectIdServlet
 */
@WebServlet(name = "epicSearchByProjectId", urlPatterns = { "/epicSearchByProjectId" })
public class EpicSearchByProjectIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     EpicDao epicDao = new EpicDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EpicSearchByProjectIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer projectId =0;
		try {
			projectId = Integer.valueOf(request.getParameter("projectId"));
		} catch (NumberFormatException e) {
			System.out.println("Error in EpicSearchByProjectIdServlet");
		}
		List<Epic> epicsByProjectId = epicDao.getEpicsByProjectId(projectId);
		if(epicsByProjectId != null && !epicsByProjectId.isEmpty()) {
			Response resp = ResponseBuilder.getResponse(epicsByProjectId.size(), "epics",epicsByProjectId );
			JSONUtil.mapper.writeValue(response.getOutputStream(), resp);
		}else {
			Response resp = ResponseBuilder.getResponse(0, "epics",epicsByProjectId );
			JSONUtil.mapper.writeValue(response.getOutputStream(), resp);
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
