package user;

import java.io.InputStream;
import java.security.MessageDigest;
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
                String hashedPassword = hashPassword(userPassword);
                
                // 1 - 로그인 성공, 0 - 비밀번호 불일치
                return rs.getString(1).equals(hashedPassword) ? 1 : 0;
            }

            return -1; // 아이디 없음
        } catch (Exception e) {
            e.printStackTrace();
        }

        return -2; // 데이터베이스 오류
    }

    // 회원가입 메서드
    public int join(User user) {
        String sql = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";

        // 정규표현식
        String idRegex = "^(?=.*[a-z])(?=.*\\d)[a-z0-9]{5,20}$";
        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_])[a-zA-Z\\d\\W_]{8,20}$";
        String nameRegex = "^[가-힣a-zA-Z]{2,20}$";

        // 유효성 검사
        if (!user.getUserID().matches(idRegex)) {
            return -2; // 아이디 형식 오류
        }
        if (!user.getUserPassword().matches(passwordRegex)) {
            return -3; // 비밀번호 형식 오류
        }
        if (!user.getUserName().matches(nameRegex)) {
            return -4; // 이름 형식 오류
        }

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserID());

            // 비밀번호를 해시화하여 저장
            String hashedPassword = hashPassword(user.getUserPassword());
            pstmt.setString(2, hashedPassword);

            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1; // 데이터베이스 오류
    }


    // 비밀번호 해시화 메서드
    private String hashPassword(String password) {
        try {
        	InputStream inputStream = UserDAO.class.getClassLoader().getResourceAsStream("config.properties");
			properties.load(inputStream);
			String algorithm = properties.getProperty("pw.encrypt.algorithm");
			
            MessageDigest md = MessageDigest.getInstance(algorithm);
            byte[] hash = md.digest(password.getBytes());
            
            // 바이트 배열을 16진수 문자열로 변환
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            throw new RuntimeException("SHA-256 Algorithm not found", e);
        }
    }
}