
package com.viva.db.util;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnectionUtil {

    private static Connection connection;
    public static ResultSet resultSet= null;
    public static Statement statement;
    private String dbURL;
    private String dbDriver;
    private String userName;
    private String password;
    
    /**
	 * @param dbURL
	 * @param dbDriver
	 * @param userName
	 * @param password
	 */
	public DBConnectionUtil(String dbURL, String dbDriver, String userName, String password) {
		this.dbURL = dbURL;
		this.dbDriver = dbDriver;
		this.userName = userName;
		this.password = password;
	}
	public void loadDBConfiguration() {
        try {
            
            Class.forName(dbDriver);
            dbURL+="?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            System.out.println(":::::::::::::::::::::::::::: Diver Loaded : " + dbDriver + " ::::::::::::::::::::::::::::::::::::");
            connection = DriverManager.getConnection(dbURL, userName, password);
            System.out.println(":::::::::::::::::::::::::::: Connection Established : " + dbURL + " ::::::::::::::::::::::::::::::::::::");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnectionUtil.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnectionUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static int insert(String query) {
        int response = 0;
        System.out.println("Insertion query : \n" + query + "\n");
        try {
            statement = connection.createStatement();
            response = statement.executeUpdate(query);
        } catch (SQLException ex) {
            response =-1;
            Logger.getLogger(DBConnectionUtil.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBConnectionUtil.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        System.out.println("\n Recode insertion response in DBConnectionUtil ::::: " + response);
        return response;
    }

    public static ResultSet getData(String query){
        try {
             System.out.println("\n Generated Query : \n" + query +"\n");
            statement= connection.createStatement();
            resultSet = statement.executeQuery(query);
        } catch (SQLIntegrityConstraintViolationException ex) {
            System.out.println("Constant Exception : " + ex.getMessage());
        } catch (SQLException e) {
            System.out.println("SQL Exception : " + e.getMessage());
		}
        return resultSet;
    }
    public static Connection getconnection() {
    	return connection;
    }
    public static void main(String[] args) {
		
	}
}
