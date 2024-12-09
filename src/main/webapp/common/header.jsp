<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 공통 헤더 -->
<!-- 하나의 웹 사이트의 전반적인 구성을 보여주는 navigation -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
            aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="main.jsp">VulnZone</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="../main.jsp">메인</a></li>
            <li><a href="../bbs.jsp">게시판</a></li>
            <li><a href="../auth/login.jsp">로그인</a></li>
        </ul>
    </div>
</nav>

<!-- 애니메이션을 담당할 js 참조 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>