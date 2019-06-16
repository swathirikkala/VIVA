package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.viva.db.util.QueryBuilder;
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
	
}
