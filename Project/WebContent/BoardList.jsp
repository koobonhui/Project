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
	int widthBlock = pageInfo.getWidthBlock();
	
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
		    <li><a href="memberMain.do" style="text-decoration: none;">홈</a></li>
		    <li><a href="introduce.do" style="text-decoration: none;">소개</a></li>
		    <li><a href="boardlist.do" style="text-decoration: none;">게시판</a></li>
		    <li><a href="gallery.do" style="text-decoration: none;">갤러리</a></li>
	  	</ul>
	</nav>
	
	<div class = "login">
		<span style = "margin-left: 10px"><%=userId.equals("") ? "" : userId + " 님 반갑습니다."%></span>
		<%=userId.equals("") ? "<a href = 'memberLogin.do' style='text-decoration: none;'>로그인</a>" : "<a href = 'memberLogoutAction.do'>로그아웃</a>"%>
	</div>
</header>

<div class="container pt-3">
	<div class="row">
		<%
			if(boardList != null && listCount > 0) {
		%>
		<table class="table text-center table-bordered table-hover" style="table-layout: fixed">
			<thead class="thead-dark">
				<tr>
					<th style = "width: 5%">번호</th>
					<th>제목</th>
					<th style = "width: 15%">작성자</th>
					<th style = "width: 10%">작성일</th>
					<th style = "width: 7%">조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<%
					for(int i = 0; i < boardList.size(); i++) {
				%>
				<tr>
					<td><%=boardList.get(i).getBoard_num() %></td>
					<td><a href="boardview.do?board_num=<%=boardList.get(i).getBoard_num() %>&page=<%=nowPage %>"><%=boardList.get(i).getBoard_title() %></a></td>
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
	
	<form method="post" action="boardSearchAction.do">
	<div class="form-row center-block">
		<select id="inputState" class="form-control" style="width: 10%;" name="board_option">
		  <option selected value="board_title">제목</option>
		  <option value="board_username">글쓴이</option>
		</select>
		
		<div class="input-group mb-3" style="width: 30%;">
			<input type="text" class="form-control" 
			placeholder="검색어를 입력하세요." aria-label="검색어를 입력하세요." 
			aria-describedby="button-addon2" name="board_search" id = "search">
			
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="submit" id="button-addon2" onclick="return check();">검색</button>
			</div>
		</div>
	</div>
	</form>
	
	<div class = "container">
		<ul class="pagination">
	   		<!-- 탭 안되게 할려면 -1 -->
    		<li class="page-item <%=nowPage == 1 ? "disabled" : ""%>">
       			<a <%=nowPage == 1 ? "tabindex='-1'" : ""%> class="page-link" href="boardlist.do?page=<%=nowPage - 1%>">&lt;</a>
   			</li>
   			<%
   				for(int i = startPage; i <= endPage; i++) {
   			%>
	    	<li class="page-item <%=nowPage == i ? "active" : ""%>">
	    		<a class="page-link" href="boardlist.do?page=<%=i%>"><%=i%></a>
	    	</li>
	    	<%
   				}
	    	%>
	    	<li class="page-item <%=maxPage == nowPage ? "disabled" : ""%>">
        		<a <%=maxPage == nowPage ? "tabindex='-1'" : ""%> class="page-link" href="boardlist.do?page=<%=nowPage + 1%>">&gt;</a>
	    	</li>	
	 	</ul>
	</div>
</div>
</body>
<script src = "js/boardlist.js"></script>
</html>