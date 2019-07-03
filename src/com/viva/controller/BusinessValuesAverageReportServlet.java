package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.ReportsDao;
import com.viva.dto.BusinessValuesAverage;
import com.viva.util.Constants;

/**
 * Servlet implementation class BusinessValuesAverageReportServlet
 */
@WebServlet(name = "businessValuesAverageReport", urlPatterns = { "/businessValuesAverageReport" })
public class BusinessValuesAverageReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ReportsDao reportsDao = new ReportsDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessValuesAverageReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BusinessValuesAverageReportServlet got called");
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
		List<BusinessValuesAverage> businessValuesAverageReport = reportsDao.businessValuesAverageReport(projectId, sprintId,
				epicId);
		if (businessValuesAverageReport != null && businessValuesAverageReport.isEmpty()) {
			response.getWriter().write(Constants.NO_DATA_FOUND);
		} else {
			response.getWriter().write(Constants.SUCCESS);
		}
		response.setContentType("text/html");
		request.getSession().setAttribute("businessValuesAverageReport", businessValuesAverageReport);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
