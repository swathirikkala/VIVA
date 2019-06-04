package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.Epic;

public class EpicDao {

	public String addEpic(Epic epic) {

		int addEpicResponse = DBConnectionUtil.insert(QueryBuilder.getAddEpicQuery(epic));
		if(addEpicResponse >0) {
			return "success";
		}else if(addEpicResponse<0) {
			return "exception";
		}
		return "fail";
	}

	public List<Epic> getEpics() {
		ResultSet epicsRs = DBConnectionUtil.getData(QueryBuilder.getAllEpicsQuery());
		List<Epic> epics = parseEpics(epicsRs);
		return epics;
	}

	private List<Epic> parseEpics(ResultSet rs) {
		List<Epic> epics = new ArrayList<Epic>();
		try {
			while (null != rs && rs.next()) {
				Epic epic = new Epic();
					epic.setId(rs.getInt(1));
					epic.setName(rs.getString(2));
					epic.setProject(rs.getInt(3));
					epic.setSprint(rs.getInt(4));
					epic.setPriority(rs.getInt(5));
					epic.setStatus(rs.getString(6));
					epic.setDescription(rs.getString(7));
					epic.setCreatedBy(rs.getString(8));
					epic.setLmb(rs.getString(9));
					epic.setLmt(rs.getString(10));
					epic.setViva(rs.getInt(11));

				epics.add(epic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return epics;
	}

	public List<Epic> getEpicsBySprintId(String sprintId) {
		String query = QueryBuilder.getEpicsBySprintIdQuery(sprintId);
		ResultSet rs = DBConnectionUtil.getData(query);
		List<Epic> epics = parseEpics(rs);
		System.out.println("Epics by " + sprintId + " : " + epics);
		return epics;

	}

	public List<Epic> getEpicsByProjectId(Integer projectId) {
		PreparedStatement preparedStatement = QueryBuilder.getEpicsByProjectIdQuery(projectId);
		List<Epic> epics = null;
		try {
			ResultSet rs = preparedStatement.executeQuery();
			epics = parseEpics(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getEpicsByProjectId : " + epics);
		return epics;
	}

	public Epic getEpicById(int epicId) {
		PreparedStatement preparedStatement = QueryBuilder.getEpicByIdPs(epicId);
		List<Epic> epics = null;
		try {
			ResultSet rs = preparedStatement.executeQuery();
			epics = parseEpics(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getEpicById : " + epics);
		return epics != null ? epics.get(0):null;
	}

}
