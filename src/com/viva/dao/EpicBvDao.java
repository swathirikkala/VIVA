package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.QueryBuilder;
import com.viva.dto.EpicBv;
import com.viva.util.Constants;

public class EpicBvDao {

	public String addBvsToEpic(int epicId, String [] bvs) {
		PreparedStatement ps = QueryBuilder.getAddBvsToEpicPs(epicId, bvs);
		try {
			int executeUpdateResult = ps.executeUpdate();
			if(executeUpdateResult >0) {
				return Constants.SUCCESS;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return Constants.ERROR;
		}
		return Constants.FAIL;
	}
	
	public List<EpicBv> getBvsByEpicId(int epicId){
		List<EpicBv> bvsByEpicId = new ArrayList<EpicBv>();
		PreparedStatement ps = QueryBuilder.getBvsByEpicIdPs(epicId);
		try {
			ResultSet rs = ps.executeQuery();
			bvsByEpicId = parseBvs(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bvsByEpicId;
	}

	private List<EpicBv> parseBvs(ResultSet rs) {
		List<EpicBv> bvsByEpicId = new ArrayList<EpicBv>();
		try {
			while(rs!=null && rs.next()) {
				EpicBv bv = new EpicBv();
				bv.setEpicId(rs.getInt(1));
				bv.setBvId(rs.getInt(2));
				bv.setStatus(rs.getBoolean(3));
				bv.setComment(rs.getString(4));
				bvsByEpicId.add(bv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bvsByEpicId;
	}
	
}
