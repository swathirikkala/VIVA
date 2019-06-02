package com.viva.dao;

import com.viva.db.util.DBConnectionUtil;
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

}
