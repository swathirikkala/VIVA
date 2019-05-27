package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.ProjectDao;
import com.viva.dao.Response;
import com.viva.dao.UserDao;
import com.viva.dto.Department;
import com.viva.dto.Project;
import com.viva.dto.User;
import com.viva.util.DataUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(value = "/userLogin")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = null;
		String userType = null;
		String landingPage = "./index.jsp";
		User user = new User();
		try {
			user.setEmailId(String.valueOf(request.getParameter("loginEmailId")));
			user.setPassword(String.valueOf(request.getParameter("loginPassword")));
		} catch (Exception e) {
			System.err.println("Error in user obejct creation in LoginServlet " + e.getMessage());
		}

		UserDao dao = new UserDao();
		Response loginResponse = dao.login(user);
		if (loginResponse.getResponseCode() == 0)
			loginResponse.setResponseMessage("Login fail");
		else {
			request.getSession().setAttribute("response", loginResponse);
			request.getSession().setAttribute("userId", user.getEmailId());
			User u = (User) loginResponse.getResponseObject();
			if (u != null) {
				request.getSession().setAttribute("userName", (u.getFirstName() + " " + u.getLastName()));
			}

			DataUtil dataUtil = new DataUtil(request);
			dataUtil.loadData();
			List<Department> departments = (List<Department>) request.getSession().getAttribute("departments");
			if(departments != null) {
				for(Department d : departments) {
					if(u.getDepartment() == d.getId()) {
						userType = d.getName();
						request.getSession().setAttribute("userType", userType);
						break;
					}
				}
			}
		}
		if("manager".equalsIgnoreCase(userType)) {
			landingPage = "./managerHome.jsp";
			ProjectDao projectDao = new ProjectDao();
			List<Project> allProjects = projectDao.getProjects();
			request.getSession().setAttribute("allProjects", allProjects);
			
		}else if("admin".equalsIgnoreCase(userType)) {
			landingPage = "./adminHome.jsp";
		}else if("technical".equalsIgnoreCase(userType)) {
			landingPage = "./technicalHome.jsp";
		}
		request.getSession().setAttribute("landingPage", landingPage);
		requestDispatcher = request.getRequestDispatcher(landingPage);
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
