package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.History;
import com.viva.dto.UserStory;
import com.viva.util.DateUtil;

public class UserStoryDao {

	HistoryDao historyDao = new HistoryDao();
	History history = new History();

	public String addUserStory(UserStory userStory) {
		String response = "fail";
		int addUSerStoryResponse = DBConnectionUtil.insert(QueryBuilder.getAddUserStoryQuery(userStory));
		if (addUSerStoryResponse > 0) {
			response = "success";
			history.sethDate(DateUtil.getSqlDate());
			history.setJobId(addUSerStoryResponse);
			history.setJobType("us");
			history.setComment("new User story created");
			history.setOwner(userStory.getLmb());
		} else if (addUSerStoryResponse < 0) {
			response = "exception";
		}
		return response;
	}

	public List<UserStory> getAllUserStories() {
		ResultSet rs = DBConnectionUtil.getData(QueryBuilder.getAllUserStoriesQuery());
		return parseUserStories(rs);
	}

	public List<UserStory> getAllUserStoriesByEpic(int epicId) {
		List<UserStory> uss = null;
		PreparedStatement allUserStoriesByEpicPS = QueryBuilder.getAllUserStoriesByEpicPS(epicId);
		ResultSet rs;
		try {
			rs = allUserStoriesByEpicPS.executeQuery();
			uss = parseUserStories(rs);
		} catch (SQLException e) {
			System.err.println("getAllUserStoriesByEpic : " + e.getMessage());
		}
		System.out.println("getAllUserStoriesByEpic : " + uss);
		return uss;

	}

	private List<UserStory> parseUserStories(ResultSet rs) {
		List<UserStory> uss = new ArrayList<UserStory>();
		String pattern = "dd-MM-yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		try {
			while (rs != null && rs.next()) {
				UserStory u = new UserStory();

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

}
