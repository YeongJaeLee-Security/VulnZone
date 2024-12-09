<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 공통 Head -->
<meta charset="UTF-8">

<!-- Bootstrap에서 반응형 웹을 사용할 수 있도록 meta 태그 작성 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap의 bootstrap.css 파일을 참조하여 디자인 사용 -->
<link rel="stylesheet" href="../css/bootstrap.css">
<!-- 애니메이션을 담당할 js 참조 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<title>VulnZone</title>
<style>
body {
	background-color: #101010;
	color: #f5f5f5;
	font-family: 'Inter', sans-serif;
	line-height: 1.6;
	margin: 0;
	padding: 0;
}

a {
	color: #3b82f6;
	text-decoration: none;
	font-weight: 500;
	transition: color 0.2s;
}

a:hover {
	color: #1d4ed8;
}

.navbar {
    background-color: #1a1a1a !important; /* Bootstrap 기본 색상 덮어쓰기 */
    border-top: 1px solid #282828 !important;
    border-left: 1px solid #282828 !important;
    border-right: 1px solid #282828 !important;
    border-bottom: 1px solid #282828 !important;
}

.navbar .navbar-brand {
    color: #ffffff !important;
    font-weight: 600;
    font-size: 20px;
}

.navbar .navbar-brand:hover {
    color: #3b82f6 !important;
}

.navbar .nav > li > a {
    color: #eaeaea !important;
    font-size: 16px;
    padding: 10px 15px;
    line-height: 1.8; /* 중앙 정렬 */
}

.navbar .nav > li > a:hover {
    background-color: #282828 !important;
    border-radius: 4px;
    color: #ffffff !important;
}

.navbar-toggle {
    border: none;
    background-color: transparent;
    transition: transform 0.2s;
}

.navbar-toggle:hover {
    transform: scale(1.1);
}

.navbar-toggle .icon-bar {
    background-color: #eaeaea;
    transition: background-color 0.3s;
}

.navbar-toggle:hover .icon-bar {
    background-color: #3b82f6;
}

.btn {
	background-color: #3b82f6;
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	font-weight: 500;
	transition: background-color 0.2s, transform 0.1s;
}

.btn:hover {
	background-color: #1d4ed8;
	transform: scale(1.02);
}

.card {
	background-color: #181818;
	border-radius: 8px;
	padding: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

footer {
	background-color: #181818;
	color: #a8a8a8;
	text-align: center;
	padding: 20px 10px;
	border-top: 1px solid #282828;
	font-size: 0.9rem;
}

footer a {
	color: #3b82f6;
	text-decoration: none;
	font-weight: 500;
	transition: color 0.2s;
}

footer a:hover {
	color: #1d4ed8;
}
</style>