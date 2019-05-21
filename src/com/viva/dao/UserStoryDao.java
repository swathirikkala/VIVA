package com.viva.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.viva.dao.util.ResponseBuilder;
import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.UserStory;

public class UserStoryDao {
	
	public Response addUserStory(UserStory userStory) {
		int addUSerStoryResponse = DBConnectionUtil.insert(QueryBuilder.getAddUserStoryQuery(userStory));
		return ResponseBuilder.getResponse(addUSerStoryResponse, "User Story Creation", userStory);
	}
	
	public List<UserStory> getAllUserStories(){
		ResultSet rs = DBConnectionUtil.getData(QueryBuilder.getAllUserStoriesQuery());
		return parseUserStories(rs);
	}
	private List<UserStory> parseUserStories(ResultSet rs) {
		List<UserStory> uss = new ArrayList<UserStory>();
		String pattern = "dd-MM-yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		try {
			while(rs != null && rs.next()) {
				UserStory u =new UserStory();
				
				u.setId(rs.getInt(1));
				u.setProject(rs.getInt(2));
				u.setSprint(rs.getInt(3));
				u.setEpic(rs.getInt(4));
				u.setName(rs.getString(5));
				u.setPrioroty(rs.getString(6));
				java.util.Date startDate = new java.util.Date(rs.getDate(7).getTime());
				String sd = simpleDateFormat.format(startDate);
				u.setStartDate(sd);
				java.util.Date endDate = new java.util.Date(rs.getDate(8).getTime());
				String ed = simpleDateFormat.format(endDate);
				u.setEndDate(ed);
				u.setManager(rs.getString(9));
				u.setAssignTo(rs.getString(10));
				u.setDescription(rs.getString(11));
				u.setLmb(rs.getString(12));
				u.setLmt(rs.getString(13));
				
				uss.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return uss;
	}

	public Response updateUserStory(UserStory userStory) {
		Response response = null;
		
		return response;
	}
	public Response deleteUserStory(UserStory userStory) {
		Response response = null;
		
		return response;
	}
	public Response getUserStores(UserStory userStory) {
		Response response = null;
		
		return response;
	}
}
