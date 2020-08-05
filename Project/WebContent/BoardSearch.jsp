<%@page import="vo.PageInfo2"%>
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

	ArrayList<BoardBean> boardSearch = (ArrayList<BoardBean>)request.getAttribute("boardSearch");
	PageInfo2 pageInfo2 = (PageInfo2)request.getAttribute("pageInfo");
	String board_option = (String)session.getAttribute("option");
	String board_search = (String)session.getAttribute("search");
	int listCount = pageInfo2.getListCount();
	int nowPage = pageInfo2.getPage();
	int maxPage = pageInfo2.getMaxPage();
	int startPage = pageInfo2.getStartPage();
	int endPage = pageInfo2.getEndPage();
	int widthBlock = pageInfo2.getWidthBlock();
	
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
		    <li><a href="#" style="text-decoration: none;">소개</a></li>
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
			if(boardSearch != null && listCount > 0) {
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
					for(int i = 0; i < boardSearch.size(); i++) {
				%>
				<tr>
					<td><%=boardSearch.get(i).getBoard_num() %></td>
					<td><a href="boardview.do?board_num=<%=boardSearch.get(i).getBoard_num() %>&page=<%=nowPage %>"><%=boardSearch.get(i).getBoard_title() %></a></td>
					<td><%=boardSearch.get(i).getBoard_username() %></td>
					<td><%=boardSearch.get(i).getBoard_date() %></td>
					<td><%=boardSearch.get(i).getBoard_readcount() %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			} else {
				out.println("<article id='emptyArea'>찾는글이없음.</article>");
			}
		%>
	</div>
	
	<div class = "container">
		<ul class="pagination">
	   		<!-- 탭 안되게 할려면 -1 -->
    		<li class="page-item <%=nowPage == 1 ? "disabled" : ""%>">
       			<a <%=nowPage == 1 ? "tabindex='-1'" : ""%> class="page-link" href="boardSearchAction.do?page=<%=nowPage - 1%>&board_option=<%=board_option%>&board_search=<%=board_search%>">&lt;</a>
   			</li>
   			<%
   				for(int i = startPage; i <= endPage; i++) {
   			%>
	    	<li class="page-item <%=nowPage == i ? "active" : ""%>">
	    		<a class="page-link" href="boardSearchAction.do?page=<%=i%>&board_option=<%=board_option%>&board_search=<%=board_search%>"><%=i%></a>
	    	</li>
	    	<%
   				}
	    	%>
	    	<li class="page-item <%=maxPage == nowPage ? "disabled" : ""%>">
        		<a <%=maxPage == nowPage ? "tabindex='-1'" : ""%> class="page-link" href="boardSearchAction.do?page=<%=nowPage + 1%>&board_option=<%=board_option%>&board_search=<%=board_search%>">&gt;</a>
	    	</li>	
	 	</ul>
	</div>
</div>
</body>
</html>