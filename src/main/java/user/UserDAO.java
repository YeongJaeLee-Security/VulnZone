package user;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Properties properties = new Properties();
	
//	생성자 - UserDAO 객체 인스턴스를 생성할 때 자동으로 DB 연결
	public UserDAO() {
		try {
			InputStream inputStream = UserDAO.class.getClassLoader().getResourceAsStream("config.properties");
			properties.load(inputStream);
			
			String dbURL = properties.getProperty("db.url");
			String dbID = properties.getProperty("db.id");
			String dbPassword = properties.getProperty("db.password");
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String sql = "SELECT userPassword FROM USER WHERE userID = ?";
		
		try {
			// SQL injection 방지
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				// 1 - 로그인 성공, 0 - 비밀번호 불일치
				return rs.getString(1).equals(userPassword) ? 1 : 0;
			}
			
			return -1;	// 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2;	// 데이터베이스 오류
	}
}