package com.viva.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.dao.util.ResponseBuilder;
import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.Department;

public class DepartmentDao {

	public Response addDepartment(Department department) {

		int addDepartmentResponse = DBConnectionUtil.insert(QueryBuilder.addDepartmentQuery(department));
		return ResponseBuilder.getResponse(addDepartmentResponse, "Add Department",department );

	}
	
	public Response getAllDepartments() {
		ResultSet departmentsRS = DBConnectionUtil.getData(QueryBuilder.getAllDepartmentsQuery());
		List<Department> departments = parseRsForDepartments(departmentsRS);
		return ResponseBuilder.getResponse(departments.size(),"All Departments", departments);
	}

	private List<Department> parseRsForDepartments(ResultSet rs) {
		List<Department>  departments = new ArrayList<Department>();
		try {
			while(null != rs && rs.next()) {
				Department department = new Department();
				department.setId(Integer.valueOf(rs.getInt(1)));
				department.setName(String.valueOf(rs.getString(2)));
				department.setDescription(String.valueOf(rs.getString(3)));
				departments.add(department);
			}
		} catch (SQLException e) {
			System.err.println("Error in parsing deparment : " + e.getMessage());
		}
		return departments;
	}
	
}
