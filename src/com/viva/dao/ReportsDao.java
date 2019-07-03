package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.CacheUtil;
import com.viva.db.util.DBConnectionUtil;
import com.viva.dto.BusinessValue;
import com.viva.dto.BusinessValuesAverage;
import com.viva.dto.BvStatusReport;
import com.viva.dto.Epic;
import com.viva.dto.Project;
import com.viva.dto.Sprint;

public class ReportsDao {

	public List<BvStatusReport> businessValuesStatusReport(int projectId, int sprintId, int epicId) {
		List<BvStatusReport> bvs = null;
		String query = "select us_bv.*, user_story.name, user_story.sprint, user_story. epic, user_story.project from us_bv " + 
				"inner join user_story on us_bv.usid = user_story.id " + 
				"and usid in (select id from user_story where project =?"; 
		if(sprintId !=0) {
			query +=" and sprint = ?";
		}
		if(epicId !=0) {
			query+=" and epic= ?";
		}
		query+=")";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(query);
			ps.setInt(1, projectId);
			if(sprintId != 0) {
				ps.setInt(2, sprintId);
			}
			if(sprintId !=0 &  epicId!=0) {
				ps.setInt(3, epicId);
			}else if (sprintId ==0 &  epicId!=0) {
				ps.setInt(2, epicId);
			}
			System.out.println("businessValuesStatusReport PS : " + ps.toString());
			ResultSet rs = ps.executeQuery();
			bvs = parseUsBvs(rs);
			
		} catch (SQLException e) {
			System.err.println("Exception in businessValuesStatusReport : " + e.getMessage());
		}
		return bvs;
	}
	
	
	private List<BvStatusReport> parseUsBvs(ResultSet rs) {
		List<BvStatusReport> bvs = new ArrayList<BvStatusReport>();
		try {
			while (rs != null && rs.next()) {
				BvStatusReport bvr = new BvStatusReport();
				bvr.setUsId(rs.getInt(1));
				bvr.setBvId(rs.getInt(2));
				bvr.setStatus(rs.getBoolean(3));
				bvr.setViva(rs.getInt(4));
				bvr.setComment(rs.getString(5));
				bvr.setUserStoryName(rs.getString(6));
				int sprintId = rs.getInt(7);
				Sprint sprint = CacheUtil.allSprintsMap.get(sprintId);
				String sprintName = (sprint!=null)?sprint.getSprintName():"";
				bvr.setSprintName(sprintName);
				int epicId = rs.getInt(8);
				Epic epic = CacheUtil.allEpicsMap.get(epicId);
				String epicName = (epic != null)?epic.getName():"";
				bvr.setEpicName(epicName);
				int projectId = rs.getInt(9);
				Project project = CacheUtil.allProjectsMap.get(projectId);
				String projectName = (project!=null)?project.getName():"";
				bvr.setProjectName(projectName);
				BusinessValue businessValue = CacheUtil.allBVMap.get(bvr.getBvId());
				String bvName = (businessValue != null)?businessValue.getName():bvr.getBvId()+"";
				bvr.setBvName(bvName);
				bvs.add(bvr);
			}
		} catch (SQLException e) {
			System.err.println("Exception in bv parsing : " + e.getMessage());
		}
		System.out.println("After parse parseUsBvs count : " + bvs.size());
		System.out.println("After parse parseUsBvs Data : " + bvs);
		return bvs;

	}
	
	public List<BusinessValuesAverage> businessValuesAverageReport(int projectId, int sprintId, int epicId) {
		List<BusinessValuesAverage> bvas= null;
		String sql = "select us_bv.bvid, ceiling(avg(us_bv.viva)) as vivavg, count(us_bv.viva) bvc from us_bv " + 
				" inner join  user_story on us_bv.usid = user_story.id " + 
				" and usid in (select id from user_story where project =?";
			if(sprintId !=0) {
				sql +=" and sprint = ?";
			}
			if(epicId !=0) {
				sql+=" and epic= ?";
			}
			sql+=") group by bvid";
			try {
				PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(sql);
				ps.setInt(1, projectId);
				if(sprintId != 0) {
					ps.setInt(2, sprintId);
				}
				if(sprintId !=0 &  epicId!=0) {
					ps.setInt(3, epicId);
				}else if (sprintId ==0 &  epicId!=0) {
					ps.setInt(2, epicId);
				}
				System.out.println("businessValuesAverageReport PS : " + ps.toString());
				ResultSet rs = ps.executeQuery();
				bvas = parseUsBvas(rs);
				
			} catch (SQLException e) {
				System.err.println("Exception in businessValuesAverageReport : " + e.getMessage());
			}
			return bvas;
	}


	private List<BusinessValuesAverage> parseUsBvas(ResultSet rs) {
		List<BusinessValuesAverage> bvas = new ArrayList<BusinessValuesAverage>();
		try {
			while (rs != null && rs.next()) {
				BusinessValuesAverage bva = new BusinessValuesAverage();
				BusinessValue businessValue = CacheUtil.allBVMap.get(rs.getInt(1));
				String bvName = (businessValue != null)?businessValue.getName():"";
				bva.setBusinessValueName(bvName);
				bva.setBvs(rs.getInt(2));
				bva.setOccurance(rs.getInt(3));
				bvas.add(bva);
			}
		} catch (SQLException e) {
			System.err.println("Exception in bvas parsing : " + e.getMessage());
		}
		System.out.println("After parse parseUsBvas count : " + bvas.size());
		System.out.println("After parse parseUsBvas Data : " + bvas);
		return bvas;
	}
}
