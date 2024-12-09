package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
//	생성자 - UserDAO 객체 인스턴스를 생성할 때 자동으로 DB 연결
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/VulnZone";
			String dbID = "root";
			String dbPassword = "password";
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
