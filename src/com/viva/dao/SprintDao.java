package com.viva.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.viva.dao.util.ResponseBuilder;
import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.Sprint;

public class SprintDao {

	public Response addSprint(Sprint sprint) {
		int addSprintResponse = DBConnectionUtil.insert(QueryBuilder.getAddSprintQuery(sprint));
		return ResponseBuilder.getResponse(addSprintResponse, "Sprint Creation", sprint);
	}

	public List<Sprint> getSpintsByProject(String projectId) {
		ResultSet sprintsRS = DBConnectionUtil.getData(QueryBuilder.getAllSprintsByProjectQuery(projectId));
		List<Sprint> listOfSprintsByProjectId = parseSprints(sprintsRS);
		return listOfSprintsByProjectId;
	}

	private List<Sprint> parseSprints(ResultSet rs) {
		String pattern = "dd-MM-yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		List<Sprint> sprintsList = new ArrayList<Sprint>();
		try {
			while (null != rs && rs.next()) {
				Sprint sprint = new Sprint();
				sprint.setSprintId(rs.getInt(1));
				sprint.setSprintName(rs.getString(2));
				sprint.setProjectId(rs.getInt(3));
				sprint.setSeverity(rs.getInt(4));
				sprint.setManagerId(rs.getString(5));
				java.util.Date startDate = new java.util.Date(rs.getDate(6).getTime());
				String sd = simpleDateFormat.format(startDate);
				sprint.setStartDate(sd);
				java.util.Date endDate = new java.util.Date(rs.getDate(7).getTime());
				String ed = simpleDateFormat.format(endDate);
				sprint.setEndDate(ed);
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
		return sprintsList;
	}

	public Sprint getSprintById(String sprintId) {
		Sprint sprint  = null;
		String query = QueryBuilder.getSpringByIdQuery(sprintId);
		ResultSet rs = DBConnectionUtil.getData(query);
		List<Sprint> parseSprints = parseSprints(rs);
		if(parseSprints != null) {
			sprint = parseSprints.get(0);
		}
		return sprint;
		
	}
}
