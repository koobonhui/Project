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
		    <li><a href="#">소개</a></li>
		    <li><a href="boardlist.do">게시판</a></li>
		    <li><a href="gallery.do">갤러리</a></li>
	  	</ul>
	</nav>
	
	<div class = "login">
		<span style = "margin-left: 10px"><%=userId.equals("") ? "" : userId + " 님 반갑습니다."%></span>
		<%=userId.equals("") ? "<a href = 'memberLogin.do' class = 'button push'>로그인</a>" : "<a href = 'memberLogoutAction.do'>로그아웃</a>"%>
	</div>
</header>
<!-- ===================== section 1page =========================== -->
<div id = "full-page">
	<div class = "section">		
		<video id="myVideo" loop muted data-autoplay>
			<source src="video/MainIntro.mp4" type="video/mp4">
			<source src="video/MainIntro.webm" type="video/webm">
		</video>
		
		<div class="slideThree">  
      		<input type="checkbox" value="None" id="slideThree" name="check" checked onclick="play_pause()"/>
      		<label for="slideThree"></label>
    	</div>
		
		<div id = "scroll">
			<span></span><span></span><span></span>
			<small class="animated heartBeat delay-2s">스크롤을 내려주세요</small>
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
		</div>
		
		<div class="slide">
			<div class = "box_cir">
				<div class = "circle2"></div>
				<div class = "box_text">아리둥절 Ari the Corgi</div>
				<a href = "https://www.youtube.com/channel/UCeXxAet11DPbC8pG-lBOUTQ" target="_blank"><img class = "animated infinite swing slow" src = "video/youtubeicon.png"></a>
			</div>
		</div>
		
		<div class="slide">
			<div class = "box_cir">
				<div class = "circle3"></div>
				<div class = "box_text">속삭이는 몽자</div>
				<a href = "https://www.youtube.com/user/CHUCHU7325" target="_blank"><img class = "animated infinite swing slow" src = "video/youtubeicon.png"></a>
			</div>
		</div>
	</div>
<!-- ===================== section 3page =========================== -->
	<div class = "section">
		<div id = "map_introduce">
			<h2>찾아 오시는 길</h2>
		</div>
		
		<div id = "map">
			<div id="daumRoughmapContainer1593044858680" class="root_daum_roughmap root_daum_roughmap_landing"></div>
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
	sectionsColor: ['', 'rgba(153, 153, 255, 0.7)', 'rgba(153, 153, 255, 0.7)', '#333']
});
</script>
<!-- 카카오 맵 -->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1593044858680",
		"key" : "yx5z",
		"mapWidth" : "600",
		"mapHeight" : "400"
	}).render();
</script>
</body>
</html>