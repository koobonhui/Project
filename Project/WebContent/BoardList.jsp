<%@page import="vo.BoardBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = "";
	if(session.getAttribute("id") != null) {
		userId = (String)session.getAttribute("id");
	}
	
	ArrayList<BoardBean> boardList = (ArrayList<BoardBean>)request.getAttribute("boardList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보러올래? : 게시판</title>
<!-- Bootstrap CSS -->
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
	<div class="row">
		<%
			if(boardList != null && listCount > 0) {
		%>
		<table class="table text-center table-bordered table-hover">
			<thead class="thead-dark">
				<tr>
					<th style = "width: 5%">번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th style = "width: 7%">조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<%
					for(int i = 0; i < boardList.size(); i++) {
				%>
				<tr>
					<td><%=boardList.get(i).getBoard_num() %></td>
					<td><%=boardList.get(i).getBoard_title() %></td>
					<td><%=boardList.get(i).getBoard_username() %></td>
					<td><%=boardList.get(i).getBoard_date() %></td>
					<td><%=boardList.get(i).getBoard_readcount() %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			} else {
				out.println("<article id='emptyArea'>등록된 글이 없습니다.</article>");
			}
		%>
	</div>
	
	<div class = "clearfix">
		<a href="boardwrite.do" class="btn btn-primary float-right" id="writeBtn">글쓰기</a>		
	</div>
	
	<div>
		<ul class="pagination">
    		
	 	</ul>
	</div>
</div>
</body>
</html>