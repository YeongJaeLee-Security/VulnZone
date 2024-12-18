package utils;

import java.io.PrintWriter;
import java.security.MessageDigest;

public class Utils {
	public static void presentAlert(PrintWriter script, String message) {
		script.println("<script>");
		script.println("alert('" + message + "');");
		script.println("</script>");
	}
	
	public static void location(PrintWriter script, String dest) {
		script.println("<script>");
        script.println("location.href = '" + dest + "';");
        script.println("</script>");
	}
	
	// 비밀번호 해시화 메서드
    public String hashPassword(String password, String algorithm) {
        try {
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
            throw new RuntimeException("Algorithm not found", e);
        }
    }
}