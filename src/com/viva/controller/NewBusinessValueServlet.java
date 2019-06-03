package com.viva.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.BusinessValuesDao;
import com.viva.dto.BusinessValue;

/**
 * Servlet implementation class NewBusinessValueServlet
 */
@WebServlet(name = "addBusinessValue", urlPatterns = { "/addBusinessValue" })
public class NewBusinessValueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessValuesDao businessValuesDao = new BusinessValuesDao();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewBusinessValueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BusinessValue bv = new BusinessValue();
		bv.setName(String.valueOf(request.getParameter("businessValueName")));
		bv.setDescription(String.valueOf(request.getParameter("businessValueDescription")));
		String addBusinessValueResponse = businessValuesDao.addBusinessValue(bv);
		response.getWriter().write(addBusinessValueResponse);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
