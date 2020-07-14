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
<title>보러올래? : 갤러리</title>
<link rel = "stylesheet" href = "css/gallery.css">
<script src = "js/jquery-3.5.1.min.js"></script>
<script src = "js/gallery.js"></script>
</head>
<body>
<header>
	<h1 id = "logo"><img src = "video/logo.png" /></h1>
	
	<nav class="navbar">
	  	<ul>
		    <li><a href="memberMain.do">홈</a></li>
		    <li><a href="#">소개</a></li>
		    <li><a href="boardlist.do">게시판</a></li>
		    <li><a href="gallery.do">갤러리</a></li>
	  	</ul>
	</nav>
	
	<div class = "login">
		<span style = "margin-left: 10px"><%=userId.equals("") ? "" : userId + " 님 반갑습니다."%></span>
		<%=userId.equals("") ? "<a href = 'memberLogin.do'>로그인</a>" : "<a href = 'memberLogoutAction.do'>로그아웃</a>"%>
	</div>
</header>
<div id="main">
  <div class="box">
    <div class="pic"> <img src="video/youtube1.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube2.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube3.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube1.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube2.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube3.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube1.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube2.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube3.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube1.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube2.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube3.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube1.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube2.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube3.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube1.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube2.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube3.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube1.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube2.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube3.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube1.jpg"> </div>
  </div>
  <div class="box">
    <div class="pic"> <img src="video/youtube2.jpg"> </div>
  </div>
</div>
</body>
</html>