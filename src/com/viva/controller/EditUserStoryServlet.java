package com.viva.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.UsBvDao;
import com.viva.dao.UserStoryDao;
import com.viva.dto.UserStory;
import com.viva.util.Constants;
import com.viva.util.DateUtil;

/**
 * Servlet implementation class EditUserStoryServlet
 */
@WebServlet(name = "updateUserStory", urlPatterns = { "/updateUserStory" })
public class EditUserStoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserStoryDao userStoryDao = new UserStoryDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserStoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EditUserStoryServlet got called");
		PrintWriter out = response.getWriter();
		UserStory us = new UserStory();
		
		try {
			us.setId(Integer.valueOf(request.getParameter("usId4Edit")));
		} catch (NumberFormatException e1) {
			System.err.println("Exception in parsing User story id us update");
		}
		us.setName(String.valueOf(request.getParameter("usName4Edit")));
		
		try {
			us.setProject(Integer.valueOf(request.getParameter("usProject4Edit")));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing project us update");
		}
		try {
			us.setSprint(Integer.valueOf(request.getParameter("usSprint4Edit")));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing Sprint us update");
		}
		try {
			us.setEpic(Integer.valueOf(request.getParameter("usEpic4Edit")));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing epic us update");
		}
		try {
			us.setPrioroty(Integer.valueOf(request.getParameter("usPriority4Edit")));
		} catch (NumberFormatException e) {
			System.err.println("Exception in parsing usPriority4Edit us update");
		}

		us.setStatus(String.valueOf(request.getParameter("usStatus4Edit")));
		
		us.setDescription(String.valueOf(request.getParameter("usDescription4Edit")));//usStatus4Edit
		
		us.setLmd(DateUtil.getSqlDate());
		us.setLmb(String.valueOf(request.getSession().getAttribute("userId")));
		
		String resp = userStoryDao.updateUserStory(us);
		if(Constants.SUCCESS.equals(resp)) {
			String [] usBvIds = request.getParameterValues("usBvs");
			System.out.println("selected bvs count : " + usBvIds.length);
			
			String [] comments = new String[usBvIds.length];
			for(int i=0;i<usBvIds.length ; i++) {
				comments[i] = request.getParameter("comment_"+usBvIds[i]);
				System.out.println("Comment["+i+"] :: " + comments[i]);
			}
			UsBvDao usBvDao = new UsBvDao();
			usBvDao.updateBvsOfUs(us.getId(), usBvIds, comments );
		}
		out.write(resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
