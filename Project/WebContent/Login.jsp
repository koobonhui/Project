<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 보러올래? : 로그인</title>
<link rel = "stylesheet" href = "css/login.css">
<script src = "js/jquery-3.5.1.min.js"></script>
<script src = "js/login.js"></script>
</head>
<body>
<!-- header -->
<div id="header">
    <a href="memberMain.do" title="보러올래 회원가입 페이지 보기"><img src="video/Sublogo.png" id="logo"></a>
</div>

<!-- wrapper -->
<div id = "wrapper">
<form action="memberLoginAction.do" method="post">
    <!-- content-->
    <div id = "content">
        <!-- ID -->
        <div>
            <h3 class = "join_title">
                <label for = "id">아이디</label>
            </h3>
            <span class = "box int_id">
                <input type = "text" id = "id" class = "int" maxlength = "20" name = "member_id" onkeypress="caps_lock(event)">
                <span class = "step_url">@dog.com</span>
            </span>
            <span class = "error_next_box">Caps Lock이 켜져있습니다.</span>
        </div>
        <!-- PW -->
        <div>
            <h3 class = "join_title"><label for = "pswd1">비밀번호</label></h3>
            <span class = "box int_pass">
                <input type = "password" id = "pswd1" class = "int" maxlength = "20" name = "member_pw">
            </span>
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
</html>