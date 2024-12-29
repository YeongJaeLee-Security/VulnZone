<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/commonHead.jsp" />
</head>
<body>
	<script src="../common/commonRegex.js"></script>
	<div class="container" style="margin-top: 20px;">
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="joinAction.jsp"
				onsubmit="return validateForm();">
				<h3 style="text-align: center;">회원가입</h3>

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

				<!-- 이름 입력란 -->
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름"
						name="userName" maxlength="20">
				</div>

				<!-- 이메일 입력란 -->
				<div class="form-group">
					<input type="email" class="form-control" placeholder="이메일"
						name="userEmail" maxlength="50">
				</div>

				<!-- 성별 선택 -->
				<div class="form-group" style="text-align: center;">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary"> <input type="radio"
							name="userGender" autocomplete="off" value="남자" checked>남자
						</label> <label class="btn btn-primary"> <input type="radio"
							name="userGender" autocomplete="off" value="여자" checked>여자
						</label> <label class="btn btn-primary active"> <input
							type="radio" name="userGender" autocomplete="off" value="비공개"
							checked>비공개
						</label>
					</div>
				</div>

				<!-- 회원가입 버튼 -->
				<input type="submit" class="btn btn-primary form-control"
					value="회원가입">
			</form>
		</div>
	</div>
	
	<%@ include file="../common/commonFooter.jsp" %>
</body>
</html>