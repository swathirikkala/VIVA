package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.ReportsDao;
import com.viva.dto.BvStatusReport;
import com.viva.util.Constants;

/**
 * Servlet implementation class BusinessValuesStatusReportServlet
 */
@WebServlet(name = "businessValuesStatusReport", urlPatterns = { "/businessValuesStatusReport" })
public class BusinessValuesStatusReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ReportsDao reportsDao = new ReportsDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BusinessValuesStatusReportServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("businessValuesStatusReport servlet got called");
		int projectId = 0;
		int sprintId = 0;
		int epicId = 0;
		try {
			projectId = Integer.parseInt(request.getParameter("projectId"));
		} catch (NumberFormatException e) {
			System.err.println("project id parsing error in BusinessValuesStatusReportServlet");
		}
		try {
			sprintId = Integer.parseInt(request.getParameter("sprintId"));
		} catch (NumberFormatException e) {
			System.err.println("sprint id parsing error in BusinessValuesStatusReportServlet");
		}
		try {
			epicId = Integer.parseInt(request.getParameter("epicId"));
		} catch (NumberFormatException e) {
			System.err.println("epic id parsing error in BusinessValuesStatusReportServlet");
		}
		request.getSession().setAttribute("businessValuesStatusReportProjectId", projectId);
		request.getSession().setAttribute("businessValuesStatusReportSprintId", sprintId);
		request.getSession().setAttribute("businessValuesStatusReportEpicId", epicId);
		List<BvStatusReport> businessValuesStatusReport = reportsDao.businessValuesStatusReport(projectId, sprintId,
				epicId);
		if (businessValuesStatusReport != null && businessValuesStatusReport.isEmpty()) {
			response.getWriter().write(Constants.NO_DATA_FOUND);
		} else {
			response.getWriter().write(Constants.SUCCESS);
		}
		response.setContentType("text/html");
		request.getSession().setAttribute("businessValuesStatusReport", businessValuesStatusReport);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
