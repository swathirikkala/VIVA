package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.QueryBuilder;
import com.viva.dto.BusinessValue;
import com.viva.dto.EpicBv;
import com.viva.util.Constants;

public class EpicBvDao {

	public String addBvsToEpic(int epicId, String[] bvs) {
		PreparedStatement ps = QueryBuilder.getAddBvsToEpicPs(epicId, bvs);
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

	public List<BusinessValue> getBvsByEpicId(int epicId) {
		List<BusinessValue> bvsByEpicId = new ArrayList<BusinessValue>();
		PreparedStatement ps = QueryBuilder.getBvsByEpicIdPs(epicId);
		try {
			ResultSet rs = ps.executeQuery();
			bvsByEpicId = parseEpicBvs(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getBvsByEpicId result : " + bvsByEpicId);
		return bvsByEpicId;
	}

	private List<BusinessValue> parseEpicBvs(ResultSet rs) {
		List<BusinessValue> bvsByEpicId = new ArrayList<BusinessValue>();
		try {
			while (rs != null && rs.next()) {
				BusinessValue businessValue = new BusinessValue();
				businessValue.setId(rs.getInt(1));
				businessValue.setName(rs.getString(2));
				businessValue.setDescription(rs.getString(3));
				businessValue.setActive(rs.getBoolean(4));
				businessValue.setIsAssigned(rs.getString(5));
				bvsByEpicId.add(businessValue);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bvsByEpicId;
	}

	private List<EpicBv> parseBvs(ResultSet rs) {
		List<EpicBv> bvsByEpicId = new ArrayList<EpicBv>();
		try {
			while (rs != null && rs.next()) {
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
