<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="utils.Utils" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<!-- 현재 page 안에서 User 클래스 사용 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VulnZone</title>
</head>
<body>
	<%
	PrintWriter script = response.getWriter();
	
	String userID = user.getUserID();
	String userPassword = user.getUserPassword();
	String userName = user.getUserName();
	String userEmail = user.getUserEmail();
	String userGender = user.getUserGender();
	boolean isSuccess = true;
	
	if (userID == null) {
		Utils.presentAlert(script, "아이디를 입력하세요.");
		isSuccess = false;
	} else if (userPassword == null) {
		Utils.presentAlert(script, "비밀번호를 입력하세요.");
		isSuccess = false;
	} else if (userName == null) {
		Utils.presentAlert(script, "이름을 입력하세요.");
		isSuccess = false;
	} else if (userEmail == null) {
		Utils.presentAlert(script, "이메일을 입력하세요.");
		isSuccess = false;
	} else if (userGender == null) {
		Utils.presentAlert(script, "성별을 선택하세요.");
		isSuccess = false;
	}
	
	if (!isSuccess) {
		Utils.location(script, "join.jsp");
		
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user);
	
	switch (result) {
	case -1:
		Utils.presentAlert(script, "이미 존재하는 아이디입니다.");
		Utils.location(script, "join.jsp");
		
		break;
	default:
		Utils.location(script, "../main.jsp");
		break;
	}
	
	%>
</body>
</html>