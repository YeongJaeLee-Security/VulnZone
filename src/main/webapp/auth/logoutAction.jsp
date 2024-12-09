<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VulnZone</title>
</head>
<body>
	<%
	// 로그아웃한 사용자 session 해제.
	session.invalidate();
	%>
	<script>
		location.href = '../auth/login.jsp'
	</script>
</body>
</html>