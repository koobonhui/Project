<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <a href="Main.jsp" title="보러올래 회원가입 페이지 보기"><img src="video/Sublogo.png" id="logo"></a>
</div>

<!-- wrapper -->
<div id = "wrapper">
    <!-- content-->
    <div id = "content">
        <!-- ID -->
        <div>
            <h3 class = "join_title">
                <label for = "id">아이디</label>
            </h3>
            <span class = "box int_id">
                <input type = "text" id = "id" class = "int" maxlength = "20">
                <span class = "step_url">@dog.com</span>
            </span>
            <span class = "error_next_box"></span>
        </div>
        <!-- PW1 -->
        <div>
            <h3 class = "join_title"><label for = "pswd1">비밀번호</label></h3>
            <span class = "box int_pass">
                <input type = "text" id = "pswd1" class = "int" maxlength = "20">
                <span id = "alertTxt">사용불가</span>
<!--                 <img src = "m_icon_pass.png" id = "pswd1_img1" class = "pswdImg"> -->
            </span>
            <span class = "error_next_box"></span>
        </div>
        <!-- Login BTN-->
        <div class = "btn_area">
            <button type = "button" id="btnJoin">
                <span>로그인</span>
            </button>            
        </div>
        
        <hr>
        
        <div class = "join_area">
        	<span><a href = "Join.jsp">회원가입</a></span>
        </div>
    </div> 
    <!-- content-->
</div> 
</body>
</html>