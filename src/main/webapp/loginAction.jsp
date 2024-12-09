<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!-- 현재 page 안에서 User 클래스 사용 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VulnZone</title>
</head>
<body>
	<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	PrintWriter script = response.getWriter();
	
	script.println("<script>");
	switch (result) {
	case 1:
		script.println("location.href = 'main.jsp'");
		break;
	case 0:
		script.println("alert('비밀번호가 틀립니다.')");
		break;
	case -1:
		script.println("alert('존재하지 않는 아이디입니다.')");
		break;
	case -2:
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		break;
	default:
		break;
	}
	
	script.println("</script>");
	%>
</body>
</html>