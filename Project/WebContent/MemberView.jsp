<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = "";
	if(session.getAttribute("id") != null) {
		userId = (String)session.getAttribute("id");
	}
	MemberBean memberview = (MemberBean)request.getAttribute("memberview");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보러올래? : 회원정보 상세</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel = "stylesheet" href = "css/memberlist.css">
<script src = "js/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<header>
	<h1 id = "logo"><img src = "video/logo.png" /></h1>
	
	<nav class="navbar">
	  	<ul>
		    <li><a href="memberMain.do" style="text-decoration: none;">홈</a></li>
		    <li><a href="introduce.do" style="text-decoration: none;">소개</a></li>
		    <li><a href="boardlist.do" style="text-decoration: none;">게시판</a></li>
		    <li><a href="gallery.do" style="text-decoration: none;">갤러리</a></li>
	  	</ul>
	</nav>
	
	<div class = "login">
		<span style = "margin-left: 10px"><%=userId.equals("") ? "" : userId + " 님 반갑습니다."%></span>
		<%=userId.equals("") ? "<a href = 'memberLogin.do' style='text-decoration: none;'>로그인</a>" : "<a href = 'memberLogoutAction.do'>로그아웃</a>"%>
		<%=userId.equals("admin") ? "<a href = 'memberListAction.do'>회원정보 보기</a>" : ""%>
	</div>
</header>

<div class="container pt-3 mt-5">
	<div class="row">
		<table class="table text-center table-bordered table-hover" style="table-layout: fixed">
			<thead class="thead-dark">
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>휴대폰</th>
				</tr>
			</thead>
			
			<tbody>								
				<tr>
					<td><%=memberview.getMember_id() %></td>
					<td><%=memberview.getMember_pw() %></td>
					<td><%=memberview.getMember_name() %></td>
					<td><%=memberview.getMember_birth() %></td>
					<td><%=memberview.getMember_gender() %></td>
					<td><%=memberview.getMember_phone() %></td>					
				</tr>				
			</tbody>
		</table>
		
		<div class = "clearfix">
			<a href="memberListAction.do" class="btn btn-primary float-right" id="writeBtn">목록</a>		
		</div>
	</div>
</div>
</body>
</html>