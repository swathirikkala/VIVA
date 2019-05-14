package com.viva.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.db.util.DBConnectionUtil;
import com.viva.util.DataUtil;

/**
 * Servlet implementation class DBServlet
 */
@WebServlet(name = "DBConnection", urlPatterns = { "/DBConnection" }, loadOnStartup = 0)
public class DBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println(" ::::::::::::::::: DB connection creation started :::::::::::::::::::::::");
		String dbURL = config.getServletContext().getInitParameter("DB_URL");
		String driverName = config.getServletContext().getInitParameter("DB_DRIVER");
		String userName = config.getServletContext().getInitParameter("DB_USER");
		String password = config.getServletContext().getInitParameter("DB_PASSWORD");
		DBConnectionUtil connectionUtil =new  DBConnectionUtil(dbURL,driverName,userName, password);
		connectionUtil.loadDBConfiguration();
		System.out.println(":::::::::::::::::: DB connection creation completed ::::::::::::::::::::::");
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("####################################################### start up servlet");
		DataUtil du = new DataUtil(request);
		du.loadData();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
