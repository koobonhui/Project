<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberBean memberview = (MemberBean)request.getAttribute("memberview");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 보러올래? : 로그인</title>
<link rel = "stylesheet" href = "css/login.css">
</head>
<body>
<!-- header -->
<div id="header">
    <a href="memberMain.do" title="보러올래 회원가입 페이지 보기"><img src="video/Sublogo.png" id="logo"></a>
</div>

<!-- wrapper -->
<div id = "wrapper">
<form action="emailsend.do" method="post">
    <!-- content-->
    <div id = "content">
        <!-- ID -->
        <div>
            <h3 class = "join_title">
                <label for = "id">이메일 입력</label>
            </h3>
            <span class = "box int_id">
                <input type = "text" id = "id" class = "int" maxlength = "20" name = "member_id" onkeypress="caps_lock(event)">
                <span class = "step_url">@dog.com</span>
            </span>
             <input type="hidden" id="pass" name="pass" value="<%=memberview.getMember_pw() %>">
        </div>
        
        <!-- Login BTN-->
        <div class = "btn_area">
            <button type = "submit" id="btnJoin">
                <span>로그인</span>
            </button>            
        </div>
        
        <hr>
        
        <div class = "join_area">
        	<span><a href = "memberJoin.do">회원가입</a></span>
        </div>
    </div> 
</form>
    <!-- content-->
</div> 
</body>
<script src = "js/jquery-3.5.1.min.js"></script>
<script src = "js/login.js"></script>
</html>