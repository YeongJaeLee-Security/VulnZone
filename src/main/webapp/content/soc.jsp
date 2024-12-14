<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="logUtil.LogUtil" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/commonHead.jsp" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="container">
		<h1 class="text-center">VulnZone Security Operation Center</h1>
		
		<div>
			<div>
				<input type="text" id="searchKeyword" class="form-control" placeholder="Search logs...">	
			</div>

			
			<div class="text-right" style="margin-top: 10px;">
				<button id="searchBtn" class="btn btn-secondary">Search</button>
				<% 
					LogUtil logUtil = new LogUtil();
				%>
				<a href="<%= logUtil.getSplunkUrl() %>" class="btn btn-primary"
					target="_blank" rel="noopener noreferrer">View in splunk</a>
			</div>
		</div>
		
		<div id="logContainer" class="table-responsive" style="margin-top: 30px;">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>TimeStamp</th>
						<th>Log Details</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		<nav aria-label="Page navigation">
			<ul class="pagination" id="pagination"></ul>
		</nav>
	</div>
	<script src="socUtil.js"></script>
</body>
</html>