package com.viva.dao.util;

import com.viva.dto.Response;

public class ResponseBuilder {

	public static Response getResponse(int responseCode, String responseType, Object responseObject) {
		Response response = new Response();
		if (responseCode == 0) {
			response.setResponseCode(0);
			response.setResponseMessage(responseType +" : No record found with given criteria");
			response.setResponseObject(responseObject);
		} else if (responseCode == -1) {
			response.setResponseCode(-1);
			response.setResponseMessage(responseType + " : Internal server error");
			response.setResponseObject(responseObject);
		} else {
			response.setResponseCode(1);
			response.setResponseMessage(responseType+" : success");
			response.setResponseObject(responseObject);
		}
		System.out.println(responseType +"  -> Response : " + response);
		return response;
	}
}
