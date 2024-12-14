<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="setup.DatabaseSetup"%>
<%@ page import="utils.Utils"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../common/commonHead.jsp" />
</head>
<body>
	<div>
		<%
		PrintWriter script = response.getWriter();
		DatabaseSetup setup = new DatabaseSetup();
		int result = setup.setupDatabaseAndTable();

		switch (result) {
		case 1:
			Utils.presentAlert(script, "데이터베이스 생성이 완료되었습니다.");
			Utils.location(script, "login.jsp");
			break;
		default:
			Utils.presentAlert(script, "오류가 발생했습니다.");
			Utils.location(script, "login.jsp");
			break;
		}
		%>
	</div>
</body>
</html>
