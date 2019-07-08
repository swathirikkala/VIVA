package com.viva.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClearSessionDataServlet
 */
@WebServlet(name = "clearSession", urlPatterns = { "/clearSession" })
public class ClearSessionDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClearSessionDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("epic");
		request.getSession().removeAttribute("spintsByEpic");
		request.getSession().removeAttribute("businessValuesStatusReport");
		request.getSession().removeAttribute("epics");
		request.getSession().removeAttribute("project");
		request.getSession().removeAttribute("sprints");
		request.getSession().removeAttribute("");
		request.getSession().removeAttribute("");
		request.getSession().removeAttribute("");
		request.getSession().removeAttribute("");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
