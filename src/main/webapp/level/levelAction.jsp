<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="level.Level"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="utils.Utils" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<!-- 현재 page 안에서 Level 클래스 사용 -->
<jsp:useBean id="level" class="level.Level" scope="page" />
<jsp:setProperty name="level" property="level" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../common/commonHead.jsp" />
</head>
<body>
    <%
    PrintWriter script = response.getWriter();
    session.setAttribute("level", level.getLevel());
    Utils.location(script, "../content/level.jsp");
    %>
</body>
</html>