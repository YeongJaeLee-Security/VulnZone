package setup;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import common.DataBase;

public class DatabaseSetup {
	private PreparedStatement pstmt;
	private DataBase database;
	private Connection conn;

	public DatabaseSetup() {
		try {
			database = new DataBase();
			conn = DriverManager.getConnection(database.getDbURL(), database.getDbID(), database.getDbPassword());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int setupDatabaseAndTable() {
		if (isValidName(database.getDbName()) && isValidName(database.getTableName())) {
		// 데이터베이스 생성
			String createDatabaseQuery = "CREATE DATABASE IF NOT EXISTS " + database.getDbName();
	
			// 데이터베이스 선택
			String useDatabaseQuery = "USE " + database.getDbName();
	
			// 테이블 생성
			String createTableQuery = "CREATE TABLE IF NOT EXISTS " + database.getTableName() + " (" +
					"userID VARCHAR(20) NOT NULL," +
					"userPassword VARCHAR(64) NOT NULL," +
					"userName VARCHAR(20)," +
					"userGender VARCHAR(20)," +
					"userEmail VARCHAR(50)," +
					"PRIMARY KEY (userID)" +
					")";
	
			try {
				// 1. 데이터베이스 생성
				pstmt = conn.prepareStatement(createDatabaseQuery);
				pstmt.executeUpdate(); // executeUpdate는 결과 집합을 반환하지 않음
	
				// 2. 데이터베이스 사용
				pstmt = conn.prepareStatement(useDatabaseQuery);
				pstmt.executeUpdate();
	
				// 3. 테이블 생성
				pstmt = conn.prepareStatement(createTableQuery);
				pstmt.executeUpdate();
				
				// For SQL Injection
				String createTableQuery2 = "CREATE TABLE IF NOT EXISTS " + database.getSqlTableName() + " (" +
						"id int auto_increment NOT NULL," + 
						"userID VARCHAR(20) NOT NULL," +
						"userPassword VARCHAR(64) NOT NULL," +
						"userName VARCHAR(20)," +
						"userGender VARCHAR(20)," +
						"userEmail VARCHAR(50)," +
						"PRIMARY KEY (id)" +
						")";
				
				pstmt = conn.prepareStatement(createTableQuery2);
				pstmt.executeUpdate();
				
				// For Store Cross-site Script(XSS)
				String createTableQuery3 = "CREATE TABLE IF NOT EXISTS " + database.getXssTableName() + " (" +
						"id int auto_increment NOT NULL," +
						"name VARCHAR(50)," +
						"comment VARCHAR(100)," +
						"PRIMARY KEY (id)" +
						")";
				
				pstmt = conn.prepareStatement(createTableQuery3);
				pstmt.executeUpdate();
	
				return 1;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null) pstmt.close();
					if (conn != null) conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return -1;
	}
	
	private boolean isValidName(String name) {
	    // 이름에 알파벳, 숫자, 밑줄만 허용
	    return name != null && name.matches("^[a-zA-Z0-9_]+$");
	}
}