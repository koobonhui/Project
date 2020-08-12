<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = "";
	if(session.getAttribute("id") != null) {
		userId = (String)session.getAttribute("id");
	}
	
	if(session.getAttribute("id") == null) {
		out.println("<script>");
		out.println("alert('로그인이 필요한 서비스입니다.');");
		out.println("location.href='memberLogin.do';");
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보러올래? : 글쓰기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel = "stylesheet" href = "css/boardwrite.css">
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
		<%=userId.equals("admin") ? "<a href = 'memberListAction.do'>회원정보 보기</a>" : ""%>
	</div>
</header>

<div class="container pt-3">
	<form method="post" action="boardWriteAction.do">
		<table class="table table-striped text-center table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>게시판 글쓰기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글 제목" name="board_title" maxlength="50" /></td>
				</tr>
				<tr>
					<td>
						<textarea class="form-control" placeholder="글 내용" name="board_content"
						maxlength="65535" style="height: 350px; resize: none;" wrap = "hard"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<a href="boardlist.do" class="btn btn-primary float-left">목록</a>
		<button type="submit" class="btn btn-primary float-right">글쓰기</button>
	</form>
</div>
</body>
</html>