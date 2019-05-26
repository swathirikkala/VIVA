package com.viva.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.viva.dao.util.ResponseBuilder;
import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.User;

public class UserDao {

	public Response registerUser(User user) {

		int saveDBResponse = DBConnectionUtil.insert(QueryBuilder.getRegisterUserQuery(user));
		return ResponseBuilder.getResponse(saveDBResponse, "User Registration", user);

	}

	public Response login(User user) {

		Map<String, User> userLoginReponse = parseUsers(DBConnectionUtil.getData(QueryBuilder.getUserLoginQuery(user)));
		User loginUser = user;
		if (userLoginReponse != null && !userLoginReponse.isEmpty()) {
			loginUser = userLoginReponse.get(user.getEmailId());
		}
		return ResponseBuilder.getResponse(userLoginReponse.size(), "Login", loginUser);
	}

	public Map<String, User> getAllUsers() {
		return parseUsers(DBConnectionUtil.getData(QueryBuilder.getAllUsers()));
		 
	}

	private Map<String,User> parseUsers(ResultSet rs) {
		Map<String,User> users = new HashMap<String,User>();
		try {
			while (null != rs && rs.next()) {
				User user = new User();
				user.setEmailId(rs.getString(1));
				user.setFirstName(rs.getString(2));
				user.setLastName(rs.getString(3));
				user.setDob(rs.getString(4));
				user.setDepartment(rs.getInt(5));
				user.setDesignation(rs.getString(6));
				user.setPassword(rs.getString(7));
				user.setSecurityQuestion(rs.getString(8));
				user.setSecurityAnswer(rs.getString(9));
				users.put(user.getEmailId(),user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	public Map<String, User> getManagers() {
		Map<String, User> managersList = parseUsers(DBConnectionUtil.getData(QueryBuilder.getManagersQuery()));
		return managersList;
	}
}
