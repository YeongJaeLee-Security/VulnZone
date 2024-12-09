<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="utils.Utils" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<!-- 현재 page 안에서 User 클래스 사용 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VulnZone</title>
</head>
<body>
    <%
    String sessionID = session.getAttribute("userID") != null ? (String) session.getAttribute("userID") : null;
    PrintWriter script = response.getWriter();
    
    if (sessionID != null) {
    	Utils.presentAlert(script, "이미 로그인이 되어있습니다.");
    	Utils.location(script, "../main/home.jsp");
    	
    	return;
    }
        
    String userID = user.getUserID();
    String userPassword = user.getUserPassword();
    boolean isSuccess = true;
    
    if (userID == null) {
    	Utils.presentAlert(script, "아이디를 입력하세요.");
        isSuccess = false;
    } else if (userPassword == null) {
    	Utils.presentAlert(script, "비밀번호를 입력하세요.");
    	isSuccess = false;
    }
    
    if (!isSuccess) {
    	Utils.location(script, "login.jsp");
    	return;
    }
    
    UserDAO userDAO = new UserDAO();
    int result = userDAO.login(userID, userPassword);
    
    switch (result) {
    case 1:
    	// 로그인에 성공한 사용자에게 Session ID 부여
    	session.setAttribute("userID", user.getUserID());
    	Utils.location(script, "../main/home.jsp");
        break;
    case 0:
    	Utils.presentAlert(script, "비밀번호가 틀립니다.");
    	Utils.location(script, "login.jsp");
    	
        break;
    case -1:
    	Utils.presentAlert(script, "존재하지 않는 아이디입니다.");
    	Utils.location(script, "login.jsp");
    	
        break;
    case -2:
    	Utils.presentAlert(script, "데이터베이스 오류가 발생했습니다.");
    	Utils.location(script, "login.jsp");
    	
        break;
    default:
        break;
    }
    %>
</body>
</html>