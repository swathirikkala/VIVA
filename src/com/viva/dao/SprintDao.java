package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.CacheUtil;
import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.Sprint;
import com.viva.util.Constants;

public class SprintDao {

	public String addSprint(Sprint sprint) {
		int addSprintResponse = DBConnectionUtil.insert(QueryBuilder.getAddSprintQuery(sprint));
		if (addSprintResponse > 0) {
			CacheUtil.updateSprints();
			return "success";
		}
		return "fail";
	}

	public List<Sprint> getSpintsByProject(String projectId) {
		ResultSet sprintsRS = DBConnectionUtil.getData(QueryBuilder.getAllSprintsByProjectQuery(projectId));
		List<Sprint> listOfSprintsByProjectId = parseSprints(sprintsRS);
		System.out.println("getSpintsByProject : " + listOfSprintsByProjectId);
		return listOfSprintsByProjectId;
	}

	private List<Sprint> parseSprints(ResultSet rs) {
//		String pattern = "dd-MM-yyyy";
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		List<Sprint> sprintsList = new ArrayList<Sprint>();
		try {
			while (null != rs && rs.next()) {
				Sprint sprint = new Sprint();
				sprint.setSprintId(rs.getInt(1));
				sprint.setSprintName(rs.getString(2));
				sprint.setProjectId(rs.getInt(3));
				sprint.setSeverity(rs.getInt(4));
				sprint.setManagerId(rs.getString(5));
//				java.util.Date startDate = new java.util.Date(rs.getDate(6).getTime());
//				String sd = simpleDateFormat.format(startDate);
				sprint.setStartDate(rs.getString(6));
//				java.util.Date endDate = new java.util.Date(rs.getDate(7).getTime());
//				String ed = simpleDateFormat.format(endDate);
				sprint.setEndDate(rs.getString(7));
				sprint.setCreatedBy(rs.getString(8));
				sprint.setDescription(rs.getString(9));
				sprint.setLastModifiedBy(rs.getString(10));
				sprint.setLastModifiedDateTime(rs.getTimestamp(11).toString());
				sprint.setStatus(String.valueOf(rs.getString(12)));
				sprintsList.add(sprint);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Sprints by project id : " + sprintsList);
		return sprintsList;
	}

	public Sprint getSprintById(String sprintId) {
		Sprint sprint = null;
		String query = QueryBuilder.getSpringByIdQuery(sprintId);
		ResultSet rs = DBConnectionUtil.getData(query);
		List<Sprint> parseSprints = parseSprints(rs);
		if (parseSprints != null) {
			sprint = parseSprints.get(0);
		}
		return sprint;

	}

	public String updateSptint(Sprint sprint) {

		String query = QueryBuilder.updateSptintQuery(sprint);
		int insertResult = DBConnectionUtil.insert(query);
		if (insertResult > 0)
			return "success";
		else if (insertResult < 0)
			return "exception";
		return "fail";
	}

	public List<Sprint> getAllSprints() {
		List<Sprint> sprints = null;
		String sql = "select * from sprint";

		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			System.out.println("getAllSprints query : " + ps.toString());
			ResultSet rs = ps.executeQuery();
			sprints = parseSprints(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sprints;
	}
	public static String updateVivaByUs(int usId) {
		String sql = "update sprint set viva = " + 
				"(select ceiling( avg(viva)) from us_bv where usid in " + 
				"(select id from user_story where sprint in" + 
				"(select sprint from user_story where id = ?))) " + 
				"where id = (select sprint from user_story where id = ?);";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			ps.setInt(1, usId);
			ps.setInt(2, usId);
			System.out.println("updateVivaByUs in sprint query : " + ps.toString());
			int prjUpdateResp = ps.executeUpdate();
			if(prjUpdateResp>0) {
				return Constants.SUCCESS;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return Constants.ERROR;
		}
		return Constants.FAIL;
	}
	
}
