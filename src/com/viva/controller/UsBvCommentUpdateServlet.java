package com.viva.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.BusinessValuesDao;

/**
 * Servlet implementation class UsBvCommentUpdateServlet
 */
@WebServlet(name = "usBvCommentUpdate", urlPatterns = { "/usBvCommentUpdate" })
public class UsBvCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessValuesDao businessValuesDao = new BusinessValuesDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsBvCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int usId = 0;
		int bvId = 0;
		String comment = "";
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
		comment = request.getParameter("comment");
		String updateResponse = businessValuesDao.updateBvComment(usId, bvId, comment);
		System.out.println("Comment update response : " + updateResponse);
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
