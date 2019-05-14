package com.viva.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.DepartmentDao;
import com.viva.dao.Response;
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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Department department = new Department();
		DepartmentDao dao = new DepartmentDao();
		department.setName(String.valueOf(request.getParameter("departmentName")));
		department.setDescription(String.valueOf(request.getParameter("departmentDescription")));
		Response addDepartmentResponse = dao.addDepartment(department);
		
		if(addDepartmentResponse.getResponseCode() !=1) {
			addDepartmentResponse.setResponseMessage("Department save failed");
		}
		request.getSession().setAttribute("response", addDepartmentResponse);
		
		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher("./adminPanel.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
