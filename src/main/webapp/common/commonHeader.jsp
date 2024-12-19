<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!-- 공통 헤더 -->
<!-- 로그인 상태가 아니라면 로그인 화면으로 이동 -->
<%
String userID = session.getAttribute("userID") != null ? (String) session.getAttribute("userID") : null;

if (userID == null) {
%>
<script>
	location.href = '../auth/login.jsp'
</script>
<%
}
%>

<!-- 하나의 웹 사이트의 전반적인 구성을 보여주는 navigation -->
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="../content/home.jsp">VulnZone</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			
			<!-- Home -->
			<li><a href="../content/home.jsp">Home</a></li>
			
			<!-- Exploits -->
			<li><a href="../content/exploits.jsp">Exploits</a></li>
			
			<!-- Security Level -->
			<li><a href="../content/level.jsp">Level</a></li>
			
			<!-- Security Operations Center -->
			<li><a href="../content/soc.jsp">SOC</a></li>
			
			<!-- About -->
			<li><a href="../content/about.jsp">About</a></li>
			
			<!-- Logout -->
			<!-- 로그인 한 경우 로그아웃 버튼 활성화 -->
			<%
			if (userID != null) {
			%>
			<li><a href="../auth/logoutAction.jsp">Logout</a></li>
			<%
			}
			%>
		</ul>
	</div>
</nav>