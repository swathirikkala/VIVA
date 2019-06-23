package com.viva.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.InvitedUserDao;
import com.viva.dto.InvitedUser;

/**
 * Servlet implementation class UserResistrationServlet
 */
@WebServlet(name = "completeRegistration", urlPatterns = { "/completeRegistration" })
public class UserResistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	InvitedUserDao invitedUserDao = new InvitedUserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserResistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String token = String.valueOf(request.getParameter("token"));
		System.out.println("Token vlue in registration : " + token);
		InvitedUser invitedUser = invitedUserDao.getDetailsByToken(token);
		request.setAttribute("invitedUser", invitedUser);
		request.getRequestDispatcher("registration.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
