package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.CacheUtil;
import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.History;
import com.viva.dto.UserStory;
import com.viva.util.Constants;
import com.viva.util.DateUtil;

public class UserStoryDao {

	HistoryDao historyDao = new HistoryDao();
	History history = new History();

	public String addUserStory(UserStory userStory) {
		String response = Constants.FAIL;
		PreparedStatement ps = QueryBuilder.getAddUserStoryQuery(userStory);
		int addUSerStoryResponse = 0;
		try {
			addUSerStoryResponse = ps.executeUpdate();
		} catch (SQLException e) {
			System.err.println("addUserStory :  exception : " + e.getMessage());
		}
		if (addUSerStoryResponse > 0) {
			response = Constants.SUCCESS;
			CacheUtil.updateUserStories();
			history.sethDate(DateUtil.getSqlDate());
			history.setJobId(addUSerStoryResponse);
			history.setJobType("us");
			history.setComment("new User story created");
			history.setOwner(userStory.getLmb());
		} else if (addUSerStoryResponse < 0) {
			response = Constants.ERROR;
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

		try {
			while (rs != null && rs.next()) {
				UserStory u = new UserStory();

				u.setId(rs.getInt(1));
				u.setProject(rs.getInt(2));
				u.setSprint(rs.getInt(3));
				u.setEpic(rs.getInt(4));
				u.setName(rs.getString(5));
				u.setPrioroty(rs.getInt(6));
				u.setStatus(rs.getString(7));
				u.setCreatedBy(rs.getString(8));
				u.setDescription(rs.getString(9));
				u.setLmb(rs.getString(10));
				u.setLmd(rs.getString(11));
				u.setViva(rs.getInt(12));

				uss.add(u);
			}
		} catch (SQLException e) {
			System.err.println("Exception in parseUserStories : " + e.getMessage());
		}

		return uss;
	}

	public UserStory getUserStoryByUsName(String usName) {
		List<UserStory> uss = null;
		PreparedStatement allUserStoriesByEpicPS = QueryBuilder.getUserStoryByUsNamePS(usName);
		ResultSet rs;
		try {
			rs = allUserStoriesByEpicPS.executeQuery();
			uss = parseUserStories(rs);
		} catch (SQLException e) {
			System.err.println("getUserStoryByUsName : " + e.getMessage());
		}
		System.out.println("getUserStoryByUsName : " + uss);

		return uss != null ? uss.get(0) : null;
	}

	public UserStory getUserStoryByUsId(int userStoryId) {
		List<UserStory> uss = null;
		PreparedStatement allUserStoriesByEpicPS = QueryBuilder.getUserStoryByUsIdPS(userStoryId);
		ResultSet rs;
		try {
			rs = allUserStoriesByEpicPS.executeQuery();
			uss = parseUserStories(rs);
		} catch (SQLException e) {
			System.err.println("getUserStoryByUsId : " + e.getMessage());
		}
		System.out.println("getUserStoryByUsId : " + uss);

		return uss != null ? uss.get(0) : null;
	}

	public String updateUserStory(UserStory us) {
		String response = Constants.FAIL;
		PreparedStatement ps = QueryBuilder.getUpdateUserStoryPS(us);
		int addUSerStoryResponse = 0;
		try {
			addUSerStoryResponse = ps.executeUpdate();
		} catch (SQLException e) {
			System.err.println("updateUserStory :  exception : " + e.getMessage());
		}
		if (addUSerStoryResponse > 0) {
			response = Constants.SUCCESS;
			history.sethDate(DateUtil.getSqlDate());
			history.setJobId(addUSerStoryResponse);
			history.setJobType("us");
			history.setComment("User Updated");
			history.setOwner(us.getLmb());
		} else if (addUSerStoryResponse < 0) {
			response = Constants.ERROR;
		}
		return response;
	}

	public static String updateViva(int usId) {
		String query = "update user_story set viva = (SELECT ceiling(avg(viva)) FROM viva.us_bv where usid = ?)  where id=?";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(query);
			ps.setInt(1, usId);
			ps.setInt(2, usId);
			System.out.println("updateVivaByUs in User story query : " + ps.toString());
			int updateResponse = ps.executeUpdate();
			if (updateResponse > 0) {
				// EpicDao.updateEpicViva(0);
				return Constants.SUCCESS;
			} else {
				return Constants.ERROR;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Constants.FAIL;
	}

	public List<UserStory> findUssBySprintIdAndOpen(int sprintId) {
		String sql = "SELECT * FROM viva.user_story where sprint is null or sprint = ?";
		List<UserStory> uss = null;
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			ps.setInt(1, sprintId);
			System.out.println("findUssBySprintIdAndOpen Query : " + ps.toString());
			ResultSet rs = ps.executeQuery();
			uss = parseUserStories(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("findUssBySprintIdAndOpen result : " + uss);
		return uss;
	}

	public List<UserStory> getAllUserStoriesBySprint(int sprintId) {
		List<UserStory> uss = null;
		String sql = "select * from user_story where sprint = ?";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			ps.setInt(1, sprintId);
			System.out.println("getAllUserStoriesBySprint ps : " + ps.toString());
			ResultSet rs = ps.executeQuery();
			uss = parseUserStories(rs);
		} catch (SQLException e) {
			System.err.println("getAllUserStoriesBySprint : " + e.getMessage());
		}
		System.out.println("getAllUserStoriesBySprint : " + uss);
		return uss;
	}


	public List<UserStory> getAllUserStoriesForSprintAddition(int sprintId) {
		List<UserStory> uss = null;
		String sql = "select * from user_story where sprint =?" + 
				" union " + 
				" select * from user_story where sprint is null";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			ps.setInt(1, sprintId);
			System.out.println("getAllUserStoriesForSprintAddition ps : " + ps.toString());
			ResultSet rs = ps.executeQuery();
			uss = parseUserStories(rs);
		} catch (SQLException e) {
			System.err.println("getAllUserStoriesForSprintAddition : " + e.getMessage());
		}
		System.out.println("getAllUserStoriesForSprintAddition : " + uss);
		return uss;
	}
}
