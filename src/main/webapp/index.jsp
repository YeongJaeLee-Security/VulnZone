<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- 처음 접속했을 때, 로그인 or 홈 화면으로 이동 -->
	<%
	String userID = session.getAttribute("userID") != null ? (String) session.getAttribute("userID") : null;
	%>

	<%
	if (userID != null) {
	%>

	<script>
		location.href = 'main/home.jsp'
	</script>

	<%
	} else {
	%>

	<script>
		location.href = 'auth/login.jsp'
	</script>

	<%
	}
	%>
</body>
</html>