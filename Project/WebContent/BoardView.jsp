<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = "";
	if(session.getAttribute("id") != null) {
		userId = (String)session.getAttribute("id");
	}
	
	BoardBean boardview = (BoardBean)request.getAttribute("boardview");
	String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel = "stylesheet" href = "css/boardlist.css">
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

<div class="container pt-3">
		<table class="table table-striped text-center table-bordered">
			<thead class="thead-light">
				<tr>
					<th colspan = "2">게시판 글보기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style = "width: 100px;">제목</td>
					<td><%=boardview != null ? boardview.getBoard_title() : "" %></td>
				</tr>
				<tr>
					<td class = "align-middle">내용</td>
					<td style="height: 350px; overflow: auto;" class = "text-left"><%=boardview != null ? boardview.getBoard_content() : "" %></td>
				</tr>
			</tbody>
		</table>
		<a href="boardlist.do?page=<%=nowPage %>" class="btn btn-primary float-left">목록</a>
		<%
			String writer = boardview.getBoard_username();
			if(writer.equals(userId)) {
		%>
			<a href="boardDelete.do?board_num=<%=boardview.getBoard_num() %>&page=<%=nowPage %>" class="btn btn-danger float-right" onclick = "return confirm('정말 삭제하시겠습니까?')">삭제</a>
			<a href="boardmodifyform.do?board_num=<%=boardview.getBoard_num() %>&page=<%=nowPage %>" class="btn btn-warning float-right mr-1">수정</a>
		<%
			}
		%>
</div>
</body>
</html>