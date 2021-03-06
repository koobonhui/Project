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
<title>강아지 보러올래?</title>
<link rel = "stylesheet" href = "css/fullpage.min.css">
<link rel = "stylesheet" href = "css/Main.css">
<script src = "js/jquery-3.5.1.min.js"></script>
<script src = "js/fullpage.min.js"></script>
<script src = "js/main.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
</head>
<body>
<!-- ===================== header =========================== -->
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
<%-- 		<span style = "margin-left: 10px"><%=userId.equals("") ? "" : userId + " 님 반갑습니다."%></span> --%>
<%-- 		<%=userId.equals("") ? "<a href = 'memberLogin.do'>로그인</a>" : "<a href = 'memberLogoutAction.do'>로그아웃</a>"%> --%>
		<span style = "margin-left: 10px"><%=userId.equals("") ? "" : userId + " 님 반갑습니다."%></span>
		<%=userId.equals("") ? "<button class='learn-more' onclick='link();'>Login</button>" : "<a href = 'memberLogoutAction.do' style = 'margin-left: 10px'>로그아웃</a>"%>
		<%=userId.equals("admin") ? "<span> / </span> <a href = 'memberListAction.do'>회원정보 보기</a>" : ""%>
	</div>
</header>
<!-- ===================== section 1page =========================== -->
<div id = "full-page">
	<div class = "section">		
<!-- 		<video id="myVideo" loop muted data-autoplay> -->
<!-- 			<source src="video/MainIntro.mp4" type="video/mp4"> -->
<!-- 			<source src="video/MainIntro.webm" type="video/webm"> -->
<!-- 		</video> -->
		
		<div id="play">
  			<div id="me"></div>
		</div>
		
		<div id = "scroll">
			<span></span><span></span><span></span>
		</div>
	</div>
<!-- ===================== section 2page =========================== -->	
	<div class = "section">
		<div class="slide">
			<div class = "box_cir">
				<div class = "circle1"></div>
				<div class = "box_text">소녀의 행성</div>
				<a href = "https://www.youtube.com/channel/UC-IYpdOqjkER7B6cnChwlhA" target="_blank"><img class = "animated infinite swing slow" src = "video/youtubeicon.png"></a>
			</div>
			
			<div class = "youtube">
				<iframe width="700" height="450" src="https://www.youtube.com/embed/arWGAjTRjZU" 
				frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
				allowfullscreen></iframe>
			</div>
		</div>
		
		<div class="slide">
			<div class = "box_cir">
				<div class = "circle2"></div>
				<div class = "box_text">아리둥절 Ari the Corgi</div>
				<a href = "https://www.youtube.com/channel/UCeXxAet11DPbC8pG-lBOUTQ" target="_blank"><img class = "animated infinite swing slow" src = "video/youtubeicon.png"></a>
			</div>
			
			<div class = "youtube">
				<iframe width="700" height="450" src="https://www.youtube.com/embed/Y-XwuaJ9eYc" 
				frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
				allowfullscreen></iframe>
			</div>
		</div>
		
		<div class="slide">
			<div class = "box_cir">
				<div class = "circle3"></div>
				<div class = "box_text">속삭이는 몽자</div>
				<a href = "https://www.youtube.com/user/CHUCHU7325" target="_blank"><img class = "animated infinite swing slow" src = "video/youtubeicon.png"></a>
			</div>
			
			<div class = "youtube">
				<iframe width="700" height="450" src="https://www.youtube.com/embed/sXhsePfNcSc" 
				frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
				allowfullscreen></iframe>
			</div>
		</div>
	</div>
<!-- ===================== section 3page =========================== -->
	<div class = "section">
		<div id = "map">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3161.6604808673546!2d126.97262231608447!3d37.586611830734384!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2b7ef94a16b%3A0xb16d5f135eaaddc!2z7LKt7JmA64yA!5e0!3m2!1sko!2skr!4v1588826305729!5m2!1sko!2skr" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
		</div>
	</div>
<!-- ===================== section footer =========================== -->	
	<div class = "section fp-auto-height">
		<div id = "copy">
			<span>Copyright ⓒCome See Me All rights reserved.</span>
		</div>
		
		<a id = "git" href = "https://github.com/koobonhui/Project" target="_blank"><img src = "video/GitHub.png"  alt = "깃허브"/></a>
		
	</div>
</div>

<!-- 바닐라 스크립트 자리 -->
<script>
new fullpage('#full-page', { 
	sectionsColor: ['rgba(153, 153, 255, 0.7)', 'rgba(153, 153, 255, 0.7)', 'rgba(153, 153, 255, 0.7)', '#333']
});
</script>
</body>
</html>