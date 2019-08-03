package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.BusinessValue;
import com.viva.dto.History;
import com.viva.util.Constants;
import com.viva.util.DateUtil;

public class BusinessValuesDao {

	HistoryDao historyDao = new HistoryDao();
	History history = new History();
	UserStoryDao userStoryDao = new UserStoryDao();

	private boolean checkBvExist(String bvName) {
		PreparedStatement ps = QueryBuilder.getCheckBvExist(bvName);
		try {
			ResultSet rs = ps.executeQuery();
			if (rs != null && rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.err.println("checkBvExist exception : " + e.getMessage());
		}
		return false;
	}

	public String addBusinessValue(BusinessValue businessValue) {
		String response = "fail";
		if (checkBvExist(businessValue.getName())) {
			return Constants.RECORD_EXIST;
		}
		PreparedStatement preparedStatement = QueryBuilder.getAddBVQuery(businessValue);

		int saveDBResponse = 0;
		try {
			saveDBResponse = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("addBusinessValue : Exception : " + e.getMessage());
		}
		history.setJobId(saveDBResponse);
		history.setJobType("ab");
		history.sethDate(DateUtil.getSqlDate());
		history.setComment("new business value added");
		history.setOwner("admin@mail.com");
		if (saveDBResponse > 0) {
			response = "success";
			historyDao.addHistory(history);
		} else if (saveDBResponse < 0) {
			response = "exception";

		}
		System.out.println("addBusinessValue Response : " + response);
		return response;
	}

	public List<BusinessValue> getAllBusinessValues() {
		PreparedStatement allBusinessValuesPS = QueryBuilder.getAllBusinessValuesPS();
		ResultSet rs = null;
		try {
			rs = allBusinessValuesPS.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		List<BusinessValue> bvs = parseBVs(rs);
		return bvs;
	}

	public Map<Integer, BusinessValue> getBvMap() {
		Map<Integer, BusinessValue> bvMap = new HashMap<Integer, BusinessValue>();
		for (BusinessValue bv : getAllBusinessValues()) {
			bvMap.put(bv.getId(), bv);
		}
		return bvMap;
	}

	private List<BusinessValue> parseBVs(ResultSet rs) {
		List<BusinessValue> bvs = new ArrayList<BusinessValue>();
		try {
			while (rs != null && rs.next()) {
				BusinessValue bv = new BusinessValue();
				bv.setId(rs.getInt(1));
				bv.setName(rs.getString(2));
				bv.setDescription(rs.getString(3));
				bv.setActive(rs.getBoolean(4));
				bvs.add(bv);
			}
		} catch (SQLException e) {
			System.err.println("Exception in bv parsing : " + e.getMessage());
		}
		System.out.println("AllBVs ::: " + bvs.size());
		return bvs;

	}

	public String updateBvValue(int usId, int bvId, int bvValue) {
		String query = "update us_bv set viva = ? where usid = ? and bvid = ?";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(query);
			ps.setInt(1, bvValue);
			ps.setInt(2, usId);
			ps.setInt(3, bvId);
			System.out.println("updateBvValue Query : " + ps.toString());
			int executeUpdateResponse = ps.executeUpdate();
			if (executeUpdateResponse > 0) {
				
				String userStoryVivaUpdateResponse = UserStoryDao.updateViva(usId);
				System.out.println("userStoryVivaUpdateResponse : " + userStoryVivaUpdateResponse);
				
				String sprintVivaUpdateResponse = SprintDao.updateVivaByUs(usId);
				System.out.println("sprintVivaUpdateResponse : " + sprintVivaUpdateResponse);

				String epicVivaUpdateResponse = EpicDao.updateVivaByUs(usId);
				System.out.println("epicVivaUpdateResponse : " + epicVivaUpdateResponse);
				
				String projectVivaUpdateResponse = ProjectDao.updateVivaByUs(usId);
				System.out.println("projectVivaUpdateResponse : " + projectVivaUpdateResponse);
				
				return Constants.SUCCESS;
			} else {
				return Constants.ERROR;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Constants.FAIL;
	}

	public String removeUsBv(int usId, int bvId) {
		String query = "delete from us_bv where usid = ? and bvid = ?";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(query);
			ps.setInt(1, usId);
			ps.setInt(2, bvId);
			System.out.println("removeUsBv Query : " + ps.toString());
			int executeUpdateResponse = ps.executeUpdate();
			if (executeUpdateResponse > 0) {
				String updateVivaResponse = UserStoryDao.updateViva(usId);
				System.out.println("updateVivaResponse : " + updateVivaResponse);
				return Constants.SUCCESS;
			} else {
				return Constants.ERROR;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Constants.FAIL;
	}

	public String updateBvComment(int usId, int bvId, String comment) {
		String query = "update us_bv set comment = ? where usid = ? and bvid = ?";
		try {
			PreparedStatement ps = DBConnectionUtil.getconnection().prepareStatement(query);
			ps.setString(1, comment);
			ps.setInt(2, usId);
			ps.setInt(3, bvId);
			System.out.println("updateBvComment Query : " + ps.toString());
			int executeUpdateResponse = ps.executeUpdate();
			if (executeUpdateResponse > 0) {
				String updateVivaResponse = UserStoryDao.updateViva(usId);
				System.out.println("updateBvCommentResponse : " + updateVivaResponse);
				return Constants.SUCCESS;
			} else {
				return Constants.ERROR;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Constants.FAIL;
	}
}
