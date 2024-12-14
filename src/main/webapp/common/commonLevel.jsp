<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 세션에서 level 값을 가져옴
String currentLevel = (String) session.getAttribute("level");
if (currentLevel == null) {
	currentLevel = "easy"; // 기본값 설정
}
%>