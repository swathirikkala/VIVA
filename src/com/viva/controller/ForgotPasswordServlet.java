package com.viva.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.UserDao;
import com.viva.db.util.CacheUtil;
import com.viva.dto.User;
import com.viva.util.MailSender;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet(name = "forgotPassword", urlPatterns = { "/forgotPassword" })
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     UserDao userDao = new UserDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String emilId = request.getParameter("emailId");
		User user = CacheUtil.allUsersMap.get(emilId);
		String body = "your password is : " + user.getPassword();
		MailSender.sendNotification(emilId, "Forgot Password recovery", body);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
