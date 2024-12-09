<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/commonHead.jsp" />
    <title>로그인</title>
</head>
<body>
    <div class="container" style="margin-top: 20px;">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="jumbotron" style="padding-top: 20px;">
            	<!-- post 방식은 데이터를 공개하지 않고 보내는 방식 -->
                <form method="post" action="loginAction.jsp">
                    <h3 style="text-align: center;">로그인</h3>
                    <!-- 아이디 입력란 -->
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                    </div>
                    
                    <!-- 비밀번호 입력란 -->
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                    </div>
                    
                    <!-- 로그인 버튼 -->
                    <input type="submit" class="btn btn-primary form-control" value="로그인">
                </form>
                
                <!-- 회원 가입 화면 이동 버튼 -->
                <button class="btn btn-secondary form-control signup-btn" onclick="location.href='join.jsp'" style="margin-top: 10px">회원가입</button>
            </div>
        </div>
        <div class="col-lg-4"></div>
    </div>
</body>
</html>