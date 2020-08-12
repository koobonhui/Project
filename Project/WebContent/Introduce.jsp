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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel = "stylesheet" href = "css/introduce.css">
<script src = "js/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
		<%=userId.equals("admin") ? "<span> / </span> <a href = 'memberListAction.do'>회원정보 보기</a>" : ""%>
	</div>
</header>
<div class="container pt-3 mt-5">
	<div class="row">
		<table class="table text-center table-bordered table-hover" style="table-layout: fixed">
			<thead class="thead-dark">
				<tr>
					<th>사용프로그램</th>
					<th>버전</th>
				</tr>
			</thead>
			
			<tbody>						
				<tr>
					<td><img alt="eclipse.png" src="video/eclipse.png"></td>
				</tr>
				<tr>
					<td><img alt="git.png" src="video/git.png"></td>
				</tr>
				<tr>
					<td><img alt="jquery.png" src="video/jquery.png"></td>
				</tr>
				<tr>
					<td><img alt="mysql.png" src="video/mysql.png"></td>
				</tr>			
				<tr>
					<td><img alt="tomcat.png" src="video/tomcat.png"></td>
				</tr>						
			</tbody>
		</table>
	</div>
</div>
</body>
</html>