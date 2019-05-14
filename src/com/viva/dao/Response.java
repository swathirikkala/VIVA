package com.viva.dao;

public class Response {
	private int responseCode;
	private String responseMessage;
	private Object responseObject;
	public Response() {
		super();
	}
	public Response(int responseCode, String responseMessage, Object responseObject) {
		super();
		this.responseCode = responseCode;
		this.responseMessage = responseMessage;
		this.responseObject = responseObject;
	}
	public int getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(int responseCode) {
		this.responseCode = responseCode;
	}
	public String getResponseMessage() {
		return responseMessage;
	}
	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}
	public Object getResponseObject() {
		return responseObject;
	}
	public void setResponseObject(Object responseObject) {
		this.responseObject = responseObject;
	}
	@Override
	public String toString() {
		return "Response [responseCode=" + responseCode + ", responseMessage=" + responseMessage + ", responseObject="
				+ responseObject + "]";
	}
	
	
}
