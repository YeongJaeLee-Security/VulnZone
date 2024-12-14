<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/commonHead.jsp" />
</head>
<body>
	<!-- 공통 헤더 포함 -->
	<jsp:include page="../common/header.jsp" />

	<div class="container">
		<h1 class="text-center text-danger">VulnZone - Vulnerable Zone</h1>

		<hr>

		<h2>주요 특징</h2>
		<ul>
			<li><strong>확장 가능한 환경:</strong> DVWA에 커스텀 기능 및 취약점 추가</li>
			<li><strong>다양한 보안 모드:</strong> 보안 수준을 초급부터 고급까지 조정 가능</li>
			<li><strong>학습 가이드:</strong> 각 취약점에 대한 설명과 공격 시나리오 제공</li>
			<li><strong>로그 추적:</strong> 공격 시도와 결과를 기록하여 학습 및 분석 활용</li>
		</ul>

		<hr>

		<h2>학습 가능한 취약점</h2>
		<ul>
			<li><strong>SQL Injection:</strong> 데이터베이스 공격 및 방어</li>
			<li><strong>Cross-Site Scripting (XSS):</strong> 클라이언트 측 스크립트 공격
				대응</li>
			<li><strong>File Inclusion:</strong> 파일 업로드 관련 취약점</li>
			<li><strong>Command Injection:</strong> 서버 명령어 실행 취약점</li>
			<li><strong>CSRF (Cross-Site Request Forgery):</strong> 세션 하이재킹
				방어</li>
			<li><strong>확장 가능:</strong> 이후 OWASP Top 10 및 모바일 등 관련 취약점을 실습할
				수 있는 환경 추가 예정</li>
		</ul>

		<hr>

		<h2>사용 가이드</h2>
		<ul>
			<li><strong>학습 목적으로만 사용하세요.</strong> 실제 운영 환경에서 실행하지 마세요.</li>
			<li><strong>폐쇄된 로컬 네트워크 환경에서 사용을 권장합니다.</strong></li>
		</ul>

		<hr>

		<h2>개발 환경</h2>
		<ul>
			<li><strong>언어:</strong> Java (JDK), JSP</li>
			<li><strong>IDE:</strong> Eclipse 및 기타 Java 지원 IDE</li>
			<li><strong>서버:</strong> Apache Tomcat 또는 로컬 개발 서버</li>
			<li><strong>기반:</strong> DVWA (PHP 기반)를 Java/JSP 환경으로 포팅</li>
			<li><strong>디자인:</strong> Bootstrap 활용</li>
			<li><strong>데이터베이스:</strong> MySQL</li>
		</ul>

		<hr>

		<h2>라이선스</h2>
		<p>
			이 프로젝트는 MIT License에 따라 제공됩니다. 자세한 내용은 <a href="https://github.com/YeongJaeLee-Security/VulnZone/blob/main/LICENSE">LICENSE
				파일</a>을 확인하세요.
		</p>

		<hr>

		<h2>지원 및 문의</h2>
		<ul>
			<li><strong>프로젝트 유지자:</strong> <a
				href="https://github.com/YeongJaeLee-Security">YeongJaeLee-Security</a></li>
			<li><strong>이슈 제출:</strong> <a
				href="https://github.com/YeongJaeLee-Security/VulnZone/issues">GitHub
					Issues</a></li>
			<li><strong>프로젝트 기술 블로그:</strong> <a
				href="https://truthful-match-ba1.notion.site/VulnZone-155f6fa361ca80eca956f979005a23ea">Notion
					Blog</a></li>
		</ul>

		<blockquote>
			<p>
				<em>“보안은 모든 것을 보호하지 못하더라도, 아무것도 보호하지 않는 것보다 낫다.”</em> <br>—
				Kevin Mitnick
			</p>
		</blockquote>
	</div>
</body>
</html>