package com.viva.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.EpicBvDao;
import com.viva.dao.util.ResponseBuilder;
import com.viva.dto.BusinessValue;
import com.viva.dto.EpicBv;
import com.viva.dto.Response;
import com.viva.util.JSONUtil;

/**
 * Servlet implementation class BvSearchByEpicServlet
 */
@WebServlet(name = "bvsByEpic", urlPatterns = { "/bvsByEpic" })
public class BvSearchByEpicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EpicBvDao epicBvDao =new EpicBvDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BvSearchByEpicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BvSearchByEpicServlet got called ..............");
		int epicId = 0;
		try {
			epicId = Integer.valueOf(request.getParameter("epicId"));
		} catch (NumberFormatException e) {
			System.err.println("Error in BvSearchByEpicServlet parsing epicId");
		}
		 List<BusinessValue> bvsByEpicId = epicBvDao.getBvsByEpicId(epicId);
		Response resp = null;
		if(bvsByEpicId != null && !bvsByEpicId.isEmpty()) {
			resp = ResponseBuilder.getResponse(1, "bvs",bvsByEpicId );
		}else {
			resp = ResponseBuilder.getResponse(0, "sprints",null );
		}
		response.setContentType("application/json");
		JSONUtil.mapper.writeValue(response.getOutputStream(), resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
