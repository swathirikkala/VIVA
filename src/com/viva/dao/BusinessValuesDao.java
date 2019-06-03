package com.viva.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.viva.db.util.DBConnectionUtil;
import com.viva.db.util.QueryBuilder;
import com.viva.dto.BusinessValue;
import com.viva.dto.History;
import com.viva.util.DateUtil;

public class BusinessValuesDao {
	

	HistoryDao historyDao = new HistoryDao();
	History history = new History();

	public String addBusinessValue(BusinessValue businessValue ) {
		String response = "fail";
		String query = "insert into business_values values ('" + businessValue.getName() + "','"+ businessValue.getDescription()+ "')";
		int saveDBResponse = DBConnectionUtil.insert(query);
		history.setJobId(saveDBResponse);
		history.setJobType("ab");
		history.sethDate(DateUtil.getSqlDate());
		history.setComment("new business value added");
		history.setOwner("admin@mail.com");
		if (saveDBResponse > 0) {
			response = "success";
			historyDao.addHistory(history);
		} else if (saveDBResponse <0) {
			response = "exception";
			
		} 
		System.out.println("addBusinessValue Response : " + response);
		return response;
	}
	public List<BusinessValue> getAllBusinessValues(){
		PreparedStatement allBusinessValuesPS = QueryBuilder.getAllBusinessValuesPS();
		ResultSet rs=null;
		try {
			 rs= allBusinessValuesPS.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		List<BusinessValue> bvs = parseBVs(rs);
		return bvs;
	}
	private List<BusinessValue> parseBVs(ResultSet rs) {
		List<BusinessValue> bvs = new ArrayList<BusinessValue>();
			try {
				while(rs != null && rs.next()) {
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
		return bvs;
		
	}

}
