<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = "";
	if(session.getAttribute("id") != null) {
		userId = (String)session.getAttribute("id");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보러올래? : 소개</title>
<link rel = "stylesheet" href = "css/introduce.css">
<script src = "js/jquery-3.5.1.min.js"></script>
</head>
<body>
<header>
	<h1 id = "logo"><img src = "video/logo.png" /></h1>
	
	<nav class="navbar">
	  	<ul>
		    <li><a href="memberMain.do">홈</a></li>
		    <li><a href="introduce.do">소개</a></li>
		    <li><a href="boardlist.do">게시판</a></li>
		    <li><a href="gallery.do">갤러리</a></li>
	  	</ul>
	</nav>
	
	<div class = "login">
		<span style = "margin-left: 10px"><%=userId.equals("") ? "" : userId + " 님 반갑습니다."%></span>
		<%=userId.equals("") ? "<a href = 'memberLogin.do'>로그인</a>" : "<a href = 'memberLogoutAction.do'>로그아웃</a>"%>
		<span> / </span>
		<%=userId.equals("admin") ? "<a href = 'memberListAction.do'>회원정보 보기</a>" : ""%>
	</div>
</header>
소개 페이지가 될 거다.
</body>
</html>