<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/commonHead.jsp" />
</head>
<body>
	<div class="container" style="margin-top: 20px;">
		<div class="jumbotron" style="padding-top: 20px;">
			<!-- post 방식은 데이터를 공개하지 않고 보내는 방식 -->
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align: center;">로그인</h3>
				<!-- 아이디 입력란 -->
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디"
						name="userID" maxlength="20">
				</div>

				<!-- 비밀번호 입력란 -->
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword" maxlength="20">
				</div>

				<!-- 로그인 버튼 -->
				<input type="submit" class="btn btn-primary form-control"
					value="로그인">
			</form>

			<!-- 회원 가입 화면 이동 버튼 -->
			<button class="btn btn-secondary form-control signup-btn"
				onclick="location.href='join.jsp'" style="margin-top: 10px">회원가입</button>

			<h3 style="color: red; margin-top: 40px;">사전 준비</h3>
			<h4>DataBase</h4>
			<ol>
				<li>MySQL DBMS 설치가 필요합니다.</li>
				<li>MySQL DBMS가 설치 되었다면, DATABASE 생성이 필요합니다.</li>
				<li>DATABASE가 생성이 되었다면, USER Table 생성이 필요합니다.</li>
				<li>아래 <em style="color: orange;">SetUp</em> 버튼을 통해 DATABASE와 USER Table을 생성하여 기본 설정을 진행합니다.</li>
			</ol>
			
			<h4 style="margin-top: 20px;">splunk</h4>
			<ol>
				<li>splunk 설치가 필요합니다.</li>
				<li>splunk 설치가 되었다면, HEC Token 발급 과정을 진행해야 합니다.</li>
				<li>splunk HEC Token 발급이 완료 되었다면, 토큰을 활성화 해야 합니다.</li>
				<li>위 과정에 대한 자세한 설명은 <a href="https://truthful-match-ba1.notion.site/Security-Operation-Center-SOC-158f6fa361ca804d8fbcd3198a42ff2d">기술 블로그</a>를 확인하세요.
			</ol>
			

			<form method="post" action="setupAction.jsp" style="margin-top: 20px;">
				<input type="submit" class="btn btn-warning form-control" value="SetUp">
			</form>
		</div>
	</div>
</body>
</html>