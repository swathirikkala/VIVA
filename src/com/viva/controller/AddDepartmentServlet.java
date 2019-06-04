package com.viva.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.DepartmentDao;
import com.viva.dto.Department;

/**
 * Servlet implementation class AddDepartmentServlet
 */
@WebServlet(name = "addDepartment", urlPatterns = { "/addDepartment" })
public class AddDepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddDepartmentServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Department department = new Department();
		DepartmentDao dao = new DepartmentDao();
		department.setName(String.valueOf(request.getParameter("departmentName")));
		department.setDescription(String.valueOf(request.getParameter("departmentDescription")));
		String addDepartmentResponse = dao.addDepartment(department);
		request.getSession().setAttribute("response", addDepartmentResponse);
		response.getWriter().write(addDepartmentResponse);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
