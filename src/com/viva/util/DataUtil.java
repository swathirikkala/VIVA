package com.viva.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.viva.dao.DepartmentDao;
import com.viva.dao.UserDao;
import com.viva.dto.Department;
import com.viva.dto.User;

public class DataUtil {
	private HttpServletRequest request;

	public DataUtil(HttpServletRequest request) {
		this.request = request;
	}
	public void loadData() {
		UserDao userDao = new UserDao();
		Map<String, User> managers = userDao.getManagersMap();
		System.out.println("List of Managers : " + managers);
		this.request.getSession().setAttribute("managers", managers);
		
		DepartmentDao departmentDao = new DepartmentDao();
		 List<Department> allDepartments = departmentDao.getAllDepartments();
		System.out.println("List Of Departments : " + allDepartments);
		this.request.getSession().setAttribute("departments", allDepartments);
				
	}
	
}
