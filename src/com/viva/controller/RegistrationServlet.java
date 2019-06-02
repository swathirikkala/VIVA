package com.viva.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.UserDao;
import com.viva.dto.User;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet(name = "userRegistration", urlPatterns = { "/userRegistration" })
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		try {
			user.setFirstName(String.valueOf(request.getParameter("firstName")));
			user.setLastName(String.valueOf(request.getParameter("lastName")));
			user.setDob(String.valueOf(request.getParameter("dob")));
			user.setEmailId(String.valueOf(request.getParameter("emailId")));
			user.setDepartment(Integer.valueOf(request.getParameter("department")));
			user.setDesignation(String.valueOf(request.getParameter("designation")));
			user.setPassword(String.valueOf(request.getParameter("password")));
			user.setSecurityQuestion(String.valueOf(request.getParameter("securityQuestion")));
			user.setSecurityAnswer(String.valueOf(request.getParameter("securityAnswer")));
		} catch (Exception e) {
			System.err.println("Error in user obejct creation in RegistrationServlet " + e.getMessage());
		}
		
		UserDao dao = new UserDao();
		String registerUserResponse = dao.registerUser(user);
		
		request.getSession().setAttribute("response", registerUserResponse);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("./index.jsp");
        requestDispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
