package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.UsBv;
import com.viva.util.Constants;

public class UsBvDao {
	public String addBvsToUs(int usId, String[] bvs, String[] comments) {
		PreparedStatement ps = QueryBuilder.getAddBvsToUsPs(usId, bvs, comments);
		try {
			int executeUpdateResult = ps.executeUpdate();
			if (executeUpdateResult > 0) {
				return Constants.SUCCESS;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return Constants.ERROR;
		}
		return Constants.FAIL;
	}

	public List<UsBv> getBvsByUsId(int userStoryId) {
		List<UsBv> bvs = null;
		PreparedStatement ps = QueryBuilder.getBvsByUsIdPs(userStoryId);
		try {
			ResultSet rs = ps.executeQuery();
			bvs = parseBvs(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getBvsByUsId : " + bvs.size());
		return bvs;
	}

	public List<UsBv> getUsBvsByUsId(int usId) {
		List<UsBv> usBvs = new ArrayList<UsBv>();
		String sql = "SELECT * FROM us_bv where usid = ?";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(sql);
			ps.setInt(1, usId);
			ResultSet rs = ps.executeQuery();
			usBvs = parseBvs(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getUsBvsByUsId :::: " + usBvs);
		return usBvs;
	}

	private List<UsBv> parseBvs(ResultSet rs) {
		List<UsBv> bvs = new ArrayList<UsBv>();
		try {
			while (rs != null && rs.next()) {
				UsBv ub = new UsBv();
				ub.setUsId(rs.getInt(1));
				ub.setBvId(rs.getInt(2));
				ub.setStatus(rs.getBoolean(3));
				ub.setViva(rs.getInt(4));
				ub.setComment(rs.getString(5));
				bvs.add(ub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bvs;
	}
}
