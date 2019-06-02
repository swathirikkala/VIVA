package com.viva.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.Department;
import com.viva.dto.History;
import com.viva.util.DateUtil;

public class DepartmentDao {
	HistoryDao historyDao = new HistoryDao();
	History history = new History();

	public String addDepartment(Department department) {
		String response = "fail";
		int addDepartmentResponse = DBConnectionUtil.insert(QueryBuilder.addDepartmentQuery(department));
		if (addDepartmentResponse > 0) {
			response = "success";
			history.sethDate(DateUtil.getSqlDate());
			history.setComment("new department created");
			history.setJobId(addDepartmentResponse);
			history.setJobType("dep");
			history.setOwner("admin@mail.com");
			historyDao.addHistory(history);
		} else if (addDepartmentResponse < 0) {
			response = "exception";
		}
		return response;
	}

	public List<Department> getAllDepartments() {
		ResultSet departmentsRS = DBConnectionUtil.getData(QueryBuilder.getAllDepartmentsQuery());
		List<Department> departments = parseRsForDepartments(departmentsRS);
		return departments;
	}

	private List<Department> parseRsForDepartments(ResultSet rs) {
		List<Department> departments = new ArrayList<Department>();
		try {
			while (null != rs && rs.next()) {
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
