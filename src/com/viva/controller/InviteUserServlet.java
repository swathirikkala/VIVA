package com.viva.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.InvitedUserDao;
import com.viva.dto.InvitedUser;
import com.viva.util.DateUtil;
import com.viva.util.RandomString;

/**
 * Servlet implementation class InviteUserServlet
 */
@WebServlet(name = "inviteUser", urlPatterns = { "/inviteUser" })
public class InviteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    InvitedUserDao userInviteDao = new InvitedUserDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InviteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		InvitedUser ui = new InvitedUser();
		ui.setUserMailId(String.valueOf(request.getParameter("userEmailId")));
		int teamId = 0;
		
		try {
			teamId = Integer.valueOf(request.getParameter("teamId"));
		} catch (NumberFormatException e) {
			System.err.println("Error in parsing team id");
		}
		int departmentId = 0;
		
		try {
			departmentId = Integer.valueOf(request.getParameter("departmentId"));
		} catch (NumberFormatException e) {
			System.err.println("Error in parsing team id");
		}
		ui.setTeam(teamId);
		ui.setDepartment(departmentId);
		ui.setToken(RandomString.getToken());
		ui.setInvitedBy((String)request.getSession().getAttribute("userId"));
		ui.setInvitedOn(DateUtil.getSqlDate());
		ui.setDesignation(String.valueOf(request.getParameter("designation")));
		String inviteUserResponse = userInviteDao.inviteUser(ui);
		response.getWriter().write(inviteUserResponse);
		System.out.println("inviteUserResponse : " + inviteUserResponse);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
