<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>plend</title>
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<link href="resources/css/global.css" rel="stylesheet">
	<link href="resources/css/home.css" rel="stylesheet">

	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
<style type="text/css">
.circle{
    height:250px;
    width:250px;
    background-color:#000;
    border-radius:30% 70% 70% 30% / 30% 30% 70% 70% ;
    transition:all 0.5s;
    overflow:hidden;
    position:relative;
    cursor:pointer;
}

.circle:hover{
    height:250px;
    width:250px;
    background-color:#000;
    border-radius:20px;
}

.circle:hover .teamImg{
	filter: blur(4px);
}

.circle .social{
    list-style:none;
    position:absolute;
    display:flex;
    bottom:-100px;
    left:50px;
    transition:all 0.5s;
}

.circle .social li{
    margin:10px;
    height:30px;
    width:30px;
    border-radius:4px;
    background-color:#fff;
    display:flex;
    justify-content:center;
    align-items:center;
    color:#fff;
}

.circle .social li:nth-child(1){
   background-color:#3b5998;
}

.circle .social li:nth-child(2){
   background-color:#007bb5;
}

.circle:hover .social{
    bottom:20px;
}
</style>
</head>
<body>
	<div id="wrap">
		<header id="header"></header>
		
		<main class="d-flex" style="margin: 5% 19% 10% 19%; flex: 1; justify-content: space-between;">
			<div>
				<div class="circle">
				    <img class="teamImg" width="250" height="250" src="https://i.imgur.com/KQBJ9a0.jpg">
				        <ul class="social">
				            <li><a href="https://github.com/rh40614" style="color: white"><i class="fa-brands fa-github"></i></a></li>
				            <li><a href="https://jealous-gasoline-34d.notion.site/Plend-238f743c7343490081d1364f1e1eeb20" target="blank" rel="noreferrer" style="color: white;">
				            	<img width="18" height="18" alt="노션" src="<%=request.getContextPath()%>/resources/image/notion.png">
			            	</a></li>
				        </ul>
				</div>
				<div class="persnalInfo" style="text-align: center;">
					<p style="margin-top:25px;"><i class="fa-solid fa-user" style="color: #2F506D;"></i> 김연희</p>
					<div class="ex">
						<span style="font-weight: bold;">PM</span><br>
						호스트 페이지 <br> 결제 API <br> 태그 장소추천
					</div>
					<p class="font-monospace" style="margin-top:15px;"><i class="fa-solid fa-envelope" style="color: #2F506D;"></i> rh40614@gmail.com</p>
				</div>
			</div>
			<div>
				<div class="circle">
				    <img class="teamImg" width="250" height="250" src="https://i.imgur.com/KQBJ9a0.jpg">
				        <ul class="social">
				            <li><a href="https://github.com/seohakman" style="color: white"><i class="fa-brands fa-github"></i></a></li>
				            <li><a href="https://jealous-gasoline-34d.notion.site/Plend-238f743c7343490081d1364f1e1eeb20" target="blank" rel="noreferrer" style="color: white;">
				            	<img width="18" height="18" alt="노션" src="<%=request.getContextPath()%>/resources/image/notion.png">
			            	</a></li>
				        </ul>
				</div>
				<div class="persnalInfo" style="text-align: center;">
					<p style="margin-top:25px;"><i class="fa-solid fa-user" style="color: #2F506D;"></i> 김영민</p>
					<div class="ex">
						관리자 페이지 <br> 장소 상세 <br> 예약 시스템 <br> 소셜 로그인/회원가입 <br> 리뷰
					</div>
					<p class="font-monospace" style="margin-top:15px;"><i class="fa-solid fa-envelope" style="color: #2F506D;"></i> youngmin2370@gmail.com</p>
				</div>
			</div>
			<div>
				<div class="circle">
				    <img class="teamImg" width="250" height="250" src="https://i.imgur.com/KQBJ9a0.jpg">
				        <ul class="social">
				            <li><a href="https://github.com/0378hajin" style="color: white"><i class="fa-brands fa-github"></i></a></li>
				            <li><a href="https://jealous-gasoline-34d.notion.site/Plend-238f743c7343490081d1364f1e1eeb20" target="blank" rel="noreferrer" style="color: white;">
				            	<img width="18" height="18" alt="노션" src="<%=request.getContextPath()%>/resources/image/notion.png">
			            	</a></li>
				        </ul>
				</div>
				<div class="persnalInfo" style="text-align: center;">
					<p style="margin-top:25px;"><i class="fa-solid fa-user" style="color: #2F506D;"></i> 김하진</p>
					<div class="ex">
						마이 페이지 <br> 인터셉터 <br> 비밀번호 암호화 <br> 유저 공지사항 <br> 로그인/회원가입
					</div>
					<p class="font-monospace" style="margin-top:15px;"><i class="fa-solid fa-envelope" style="color: #2F506D;"></i> 0378hajin@gmail.com</p>
				</div>
			</div>
		</main>
		<footer id="footer" class="mt-5"></footer>
	</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
