package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import common.DataBase;
import utils.Utils;

public class UserDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataBase database;
	private Connection conn;
	private Properties properties;
	private Utils utils;
	
//	생성자 - UserDAO 객체 인스턴스를 생성할 때 자동으로 DB 연결
	public UserDAO() {
		try {
			this.database = new DataBase();
			this.conn = DriverManager.getConnection(database.getDbURL() + database.getDbName(), database.getDbID(), database.getDbPassword());
			this.properties = database.getProperties();
			this.utils = new Utils();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
    // 로그인 메서드
    public int login(String userID, String userPassword) {
        String sql = "SELECT userPassword FROM USER WHERE userID = ?";

        try {
            // SQL injection 방지
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 입력받은 비밀번호 해시화
                String hashedPassword = utils.hashPassword(userPassword, this.properties.getProperty("pw.encrypt.algorithm"));
                
                // 1 - 로그인 성공, 0 - 비밀번호 불일치
                return rs.getString(1).equals(hashedPassword) ? 1 : 0;
            }

            return -1; // 아이디 없음
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

        return -2; // 데이터베이스 오류
    }

    // 회원가입 메서드
    public int join(User user) {
        String sql = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
        String sql2 = "INSERT INTO Hackable_USER (userID, userPassword, userName, userGender, userEmail) VALUES (?, ?, ?, ?, ?)";

        // 유효성 검사
        if (!utils.validateID(user.getUserID())) {
            return -2; // 아이디 형식 오류
        }
        if (!utils.validatePassword(user.getUserPassword())) {
            return -3; // 비밀번호 형식 오류
        }
        if (!utils.validateName(user.getUserName())) {
            return -4; // 이름 형식 오류
        }

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserID());

            // 비밀번호를 해시화하여 저장
            String hashedPassword = utils.hashPassword(user.getUserPassword(), this.properties.getProperty("pw.encrypt.algorithm"));
            pstmt.setString(2, hashedPassword);

            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());
            
            int result = pstmt.executeUpdate();
            
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, hashedPassword);
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());
            pstmt.executeUpdate();

            return result;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

        return -1; // 데이터베이스 오류
    }
}