package com.viva.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.viva.dao.Response;

public class ServiceUtil {

	public static <DTO, DAO> void callService(HttpServletRequest request, HttpServletResponse response, Class<DTO> dto,
			Class<DAO> dao, String methodName) throws ServletException, IOException {
		try {
			
			System.out.println("\n"+methodName + " Service Got Called.......................");
			
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(request.getInputStream()));
			String json = "";
			if (bufferedReader != null) {
				json = bufferedReader.readLine();
			}
			
			Logger.getLogger(ServiceUtil.class.getName()).log(Level.INFO, methodName + " request JSON : " + json);

			DTO requestObject = JSONUtil.mapper.readValue(json, dto);
//			String className = requestObject.getClass().getName();

			System.out.println("\n Request Object in ServiceUtil  :: " + requestObject);
			
			Method method = dao.getDeclaredMethod(methodName, new Class[] { dto });
			Object obj = dao.newInstance();
			Response serviceResponse = (Response) method.invoke(obj, new Object[] { requestObject });

			System.out.println("\n Response Object in  ServiceUtil ::: " + serviceResponse);
			
			response.setContentType("application/json");
			JSONUtil.mapper.writeValue(response.getOutputStream(), serviceResponse);

		} catch (NoSuchMethodException e) {
			Logger.getLogger(ServiceUtil.class.getName()).log(Level.SEVERE,e.getLocalizedMessage());
		} catch (SecurityException e) {
			Logger.getLogger(ServiceUtil.class.getName()).log(Level.SEVERE,e.getLocalizedMessage());
		} catch (IllegalAccessException e) {
			Logger.getLogger(ServiceUtil.class.getName()).log(Level.SEVERE,e.getLocalizedMessage());
		} catch (IllegalArgumentException e) {
			Logger.getLogger(ServiceUtil.class.getName()).log(Level.SEVERE,e.getLocalizedMessage());
		} catch (InvocationTargetException e) {
			Logger.getLogger(ServiceUtil.class.getName()).log(Level.SEVERE,e.getLocalizedMessage());
		} catch (InstantiationException e) {
			Logger.getLogger(ServiceUtil.class.getName()).log(Level.SEVERE,e.getLocalizedMessage());
		}

	}
}
