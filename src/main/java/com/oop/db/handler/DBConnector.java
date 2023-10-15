package com.oop.db.handler;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.InitialContext;

public class DBConnector {

	private static Connection conn = null;
	private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/eventeaze?useSSL=false";
	private static final String DB_USER_NAME = "root";
	private static final String DB_PASSWORD = "root";

	/**
	 * Thread safe singleton method
	 * Returns db connection
	 */
	public static Connection getDBConnection() {
		if (conn == null) {
			synchronized (DBConnector.class) {
				if (conn == null) {
					conn = initConnection();
				}
			}
		}
		return conn;
	}
	
	/**
	 * Initializing the connection with Database
	 * @return
	 */
	private static Connection initConnection()
	{
		try {
			Class.forName(DRIVER_NAME);
			conn = DriverManager.getConnection(DB_URL, DB_USER_NAME, DB_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
