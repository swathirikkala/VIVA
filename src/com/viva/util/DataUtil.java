package com.viva.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.viva.dao.DepartmentDao;
import com.viva.dao.Response;
import com.viva.dao.UserDao;
import com.viva.dto.User;

public class DataUtil {
	private HttpServletRequest request;

	public DataUtil(HttpServletRequest request) {
		this.request = request;
	}
	public void loadData() {
		UserDao userDao = new UserDao();
		List<User> managers = userDao.getManagers();
		System.out.println("List of Managers : " + managers);
		this.request.getSession().setAttribute("managers", managers);
		
		DepartmentDao departmentDao = new DepartmentDao();
		Response departments = departmentDao.getAllDepartments();
		System.out.println("List Of Departments : " + departments.getResponseObject());
		this.request.getSession().setAttribute("departments", departments.getResponseObject());
				
	}
	
}
