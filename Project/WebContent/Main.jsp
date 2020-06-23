<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<header>
	<h1 id = "logo"><img src = "video/logo.png" /></h1>
	
	<nav class="navbar">
	  	<ul>
		    <li><a href="#">홈</a></li>
		    <li><a href="#">1번 메뉴</a></li>
		    <li><a href="#">게시판<a></li>
		    <li><a href="#">갤러리</a></li>
	  	</ul>
	</nav>
	
	<div class = "login">
		<button><a href = "Login.jsp">로그인</a></button>
	</div>
</header>

<div id = "full-page">
	<div class = "section">		
		<video id="myVideo" loop muted data-autoplay>
			<source src="video/MainIntro.mp4" type="video/mp4">
			<source src="video/MainIntro.webm" type="video/webm">
		</video>
		
		<button type="button" onclick="play_pause()">Play/Pause 나중에 이쁘게 꾸미기</button>
		
		<div id = "scroll">
			<span></span><span></span><span></span>
			<small>스크롤을 내려주세요</small>
		</div>
	</div>
	
	<div class = "section">
		<div class="slide">
			<div class = "box_cir">
				<div class = "circle1"></div>
				<div class = "box_text">소녀의 행성</div>
				<a href = "https://www.youtube.com/channel/UC-IYpdOqjkER7B6cnChwlhA"><img src = "video/youtubeicon.png"></a>
			</div>
		</div>
		<div class="slide">
			<div class = "box_cir">
				<div class = "circle2"></div>
				<div class = "box_text">아리둥절 Ari the Corgi</div>
				<a href = "https://www.youtube.com/channel/UCeXxAet11DPbC8pG-lBOUTQ"><img src = "video/youtubeicon.png"></a>
			</div>
		</div>
		<div class="slide">
			<div class = "box_cir">
				<div class = "circle3"></div>
				<div class = "box_text">속삭이는 몽자</div>
				<a href = "https://www.youtube.com/user/CHUCHU7325"><img src = "video/youtubeicon.png"></a>
			</div>
		</div>
	</div>
	
	<div class = "section">
		<h2>이건 모르겠다</h2>
	</div>
	
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
</body>
</html>