package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.BusinessValuesDao;
import com.viva.dao.UsBvDao;
import com.viva.dto.UsBv;

/**
 * Servlet implementation class RemoveBvFromUsServlet
 */
@WebServlet(name = "removeBvFromUs", urlPatterns = { "/removeBvFromUs" })
public class RemoveBvFromUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessValuesDao businessValuesDao = new BusinessValuesDao();
    private UsBvDao usBvDao = new UsBvDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveBvFromUsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int usId = 0;
		int bvId = 0;
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
		String removeResponse = businessValuesDao.removeUsBv(usId, bvId);
		List<UsBv> bvsByUsId =usBvDao.getBvsByUsId(usId);
		request.getSession().setAttribute("bvsByUsId", bvsByUsId);
		System.out.println("Remove Business Value response : " + removeResponse);
		response.getWriter().write(removeResponse);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
