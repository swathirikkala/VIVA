package com.viva.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.BusinessValuesDao;

/**
 * Servlet implementation class UpdateBvStatusServlet
 */
@WebServlet(name = "updateBvStatus", urlPatterns = { "/updateBvStatus" })
public class UpdateBvStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BusinessValuesDao businessValuesDao = new  BusinessValuesDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBvStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		int bvId =0;
		boolean bvStatus = true;
		try {
			bvId = Integer.parseInt(request.getParameter("bvId"));
			bvStatus = Boolean.parseBoolean(request.getParameter("bvStatus"));
		}catch (Exception e) {
			System.err.println("Exception in bvstatus update bvid parsing exception");
		}
		String resp = businessValuesDao.updateBvStatus(bvId,bvStatus);
		response.getWriter().write(resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
