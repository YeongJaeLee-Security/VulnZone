<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="logUtil.LogUtil" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/commonHead.jsp" />
</head>
<body>
	<jsp:include page="../common/commonHeader.jsp" />
	
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
			
			<div id="pagination" class="text-right" style="margin-top: 20px;"></div>
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
	</div>
	<script src="../common/commonEventHandler.js"></script>
	<script src="../soc/socUtil.js"></script>
</body>
<%@ include file="../common/commonFooter.jsp" %>
</html>