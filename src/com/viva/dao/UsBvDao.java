package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.QueryBuilder;
import com.viva.dto.UsBv;
import com.viva.util.Constants;

public class UsBvDao {
	public String addBvsToUs(int usId, String[] bvs) {
		PreparedStatement ps = QueryBuilder.getAddBvsToUsPs(usId, bvs);
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
		List<UsBv> bvs= null;
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

	private List<UsBv> parseBvs(ResultSet rs) {
		List<UsBv> bvs =new ArrayList<UsBv>();
		try {
			while(rs!=null && rs.next()) {
				UsBv ub =new UsBv();
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
