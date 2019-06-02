package com.viva.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.History;

public class HistoryDao {

	public boolean addHistory(History history) {
		boolean result = false;
		String query = QueryBuilder.getAddHistoryQuery(history);
		int insertResp = DBConnectionUtil.insert(query);
		if (insertResp > 0) {
			result = true;
		}
		return result;
	}

	public List<History> getHistoryByJobIdAndJobType(int jobId, String jobType) {
		String query = QueryBuilder.getHistoryByjobIdAndJobType(jobId, jobType);
		ResultSet rs = DBConnectionUtil.getData(query);
		List<History> history = parse(rs);
		return history;
	}

	private List<History> parse(ResultSet rs) {
		List<History> history = new ArrayList<History>();
		try {
			while (rs != null && rs.next()) {
				History h = new History();
				h.setId(rs.getInt(1));
				h.setJobId(rs.getInt(2));
				h.setJobType(rs.getString(3));
				h.setComment(rs.getString(4));
				h.sethDate(rs.getString(5));
				h.setOwner(rs.getString(6));

				history.add(h);
			}
		} catch (SQLException e) {
			System.out.println("HistoryDao parse : " + e.getMessage());
		}
		return history;
	}
}
