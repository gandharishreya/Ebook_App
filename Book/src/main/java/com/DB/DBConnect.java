package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static Connection conn;
	public static Connection getConn() {
		
		try {
			if (conn == null || conn.isClosed()) {
				// Load PostgreSQL Driver (optional in newer versions)
				Class.forName("org.postgresql.Driver");

				String url = "jdbc:postgresql://localhost:5432/ebook-app1";
				String username = "postgres";
				String password = "root";

				conn = DriverManager.getConnection(url, username, password);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
	

