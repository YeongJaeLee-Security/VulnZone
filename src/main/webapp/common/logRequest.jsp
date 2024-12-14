<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="logUtil.LogUtil" %>

<%
	String clientIP = request.getRemoteAddr();
	String requestURL = request.getRequestURL().toString();
	String userAgent = request.getHeader("User-Agent");
	
	LogUtil logUtil = new LogUtil();
	logUtil.writeLog(request);
%>