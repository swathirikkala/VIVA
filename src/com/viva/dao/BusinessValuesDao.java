package com.viva.dao;

import com.viva.db.util.DBConnectionUtil;
import com.viva.dto.BusinessValue;

public class BusinessValuesDao {

	public Response addBusinessValue(BusinessValue businessValue ) {
		Response response = new Response();
		String query = "insert into business_values values ('" + businessValue.getName() + "','"+ businessValue.getDescription()+ "')";
		int saveDBResponse = DBConnectionUtil.insert(query);
		if (saveDBResponse == 0) {
			response.setResponseCode(0);
			response.setResponseMessage("Please verify details");
			response.setResponseObject(businessValue);
		} else if (saveDBResponse == -1) {
			response.setResponseCode(-1);
			response.setResponseMessage("Internal server error");
			response.setResponseObject(businessValue);
		} else {
			response.setResponseCode(1);
			response.setResponseMessage("Registration success");
			response.setResponseObject(businessValue);
		}
		System.out.println("Registration Response : " + response);
		return response;
	}
	public Response updateBusinessValue(BusinessValue businessValue ) {
		Response response =null;
		
		return response;
	}
	public Response deleteBusinessValue(BusinessValue businessValue ) {
		Response response =null;
		
		return response;
	}
	public Response getBusinessValues(BusinessValue businessValue ) {
		Response response =null;
		return response;
	}
}
