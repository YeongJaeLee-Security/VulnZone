<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.Utils" %>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="../common/commonLevel.jsp" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/commonHead.jsp" />
</head>
<body>
    <!-- 공통 헤더 포함 -->
    <jsp:include page="../common/commonHeader.jsp" />
    
    <div class="container">
        <h1>Security Level</h1>
        <div>
            <p class="text-muted">보안 수준을 쉬움 또는 어려움으로 설정할 수 있습니다.</p>
            <p class="text-muted">보안 수준은 취약성 수준을 변경합니다.</p>
            <ol>
                <li>Easy - 이 보안 수준은 완전히 취약하며, 보안 조치가 전혀 없습니다. 이는 잘못된 코딩을 통해 웹 애플리케이션 취약점이 어떻게 나타나는지 보여주는 예시이며, 기본적인 공격 기술을 습득하는 역할을 합니다.</li>
                <li>Hard - 이 보안 수준은 Easy 보다 개선된 애플리케이션 보안을 시도했지만 실패한 예시입니다.</li>
            </ol>
        </div>
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="POST" action="../level/levelAction.jsp">
                
                <p class="text-muted">Security Level : <em style="color: red;"><%= currentLevel %></em></p>
                
                <div class="form-group">
                    <select name="level" class="form-control">
                        <option value="easy" <%= "easy".equals(currentLevel) ? "selected" : "" %>>Easy</option>
                        <option value="hard" <%= "hard".equals(currentLevel) ? "selected" : "" %>>Hard</option>
                    </select>
                </div>
                
                <input type="submit" class="btn btn-primary form-control" value="Submit">
            </form>
        </div>
    </div>
</body>
<%@ include file="../common/commonFooter.jsp" %>
</html>