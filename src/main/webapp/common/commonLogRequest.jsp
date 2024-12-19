<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="logUtil.LogUtil" %>

<%
	LogUtil logUtil = new LogUtil();
	logUtil.writeLog(request);
%>