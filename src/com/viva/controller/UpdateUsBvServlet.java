package com.viva.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.BusinessValuesDao;

/**
 * Servlet implementation class UpdateUsBvServlet
 */
@WebServlet(name = "usBvUpdate", urlPatterns = { "/usBvUpdate" })
public class UpdateUsBvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessValuesDao businessValuesDao = new BusinessValuesDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUsBvServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int usId = 0;
		int bvId = 0;
		int vivaValue =0;
		try {
			usId = Integer.valueOf(request.getParameter("usId"));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing user id");
		}
		try {
			bvId = Integer.valueOf(request.getParameter("bvId"));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing business value id");
		}
		try {
			vivaValue = Integer.valueOf(request.getParameter("vivaValue"));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing business value ");
		}
		String updateResponse = businessValuesDao.updateBvValue(usId, bvId, vivaValue);
		System.out.println("Update Business Value response : " + updateResponse);
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
