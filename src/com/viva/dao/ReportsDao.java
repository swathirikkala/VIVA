package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.DBConnectionUtil;
import com.viva.dto.UsBv;

public class ReportsDao {

	public List<UsBv> businessValuesStatusReport(int projectId, int sprintId, int epicId) {
		List<UsBv> bvs = null;
		String query = "select * from us_bv where usid in (select id from user_story where project =? ";
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
	
	
	private List<UsBv> parseUsBvs(ResultSet rs) {
		List<UsBv> bvs = new ArrayList<UsBv>();
		try {
			while (rs != null && rs.next()) {
				UsBv bv = new UsBv();
				bv.setUsId(rs.getInt(1));
				bv.setBvId(rs.getInt(2));
				bv.setStatus(rs.getBoolean(3));
				bv.setViva(rs.getInt(4));
				bv.setComment(rs.getString(5));
				bvs.add(bv);
			}
		} catch (SQLException e) {
			System.err.println("Exception in bv parsing : " + e.getMessage());
		}
		System.out.println("After parse parseUsBvs count : " + bvs.size());
		return bvs;

	}
}
