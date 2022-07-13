<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>plend</title>
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<link href="resources/css/global.css" rel="stylesheet">
	<link href="resources/css/home.css" rel="stylesheet">
	
	<script type="text/javascript">
		$(function(){
			$("#header").load("resources/article/headerwithCate.jsp");
			$("#footer").load("resources/article/footer.jsp");
		})
	</script>
	
	<script>
	
	function like (obj){
		if($(obj).hasClass("fa-regular") == true){
			$(obj).removeClass("fa-regular");
			$(obj).addClass("fa-solid");
		}else{
			$(obj).removeClass("fa-solid");
			$(obj).addClass("fa-regular");
		}
		
	}
	
	</script>
	
</head>

<body>
<div id="wrap">	
	<header id="header"></header>
	<br>
	
	<main>
	<br>

	<a href="insertPlace.do">장소등록 </a>

	<a href="developer/userList.do">유저리스트 </a>

	
  	<div class="container" style="width: 1100px;">
    	<span class="navbar-brand">| 추천 장소</span>
    	<span style="float: right; margin-right: 20px;">더보기 <i class="fa-solid fa-play"></i></span> 
  	</div>
	<section>
		<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	
		<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	
	<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	
	<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	</section>
	
	
	
	
	<br>
	<div class="container" style="width: 1100px;">
    	<h3 class="navbar-brand">| 프로모션</h3>
  	</div>
  		<section>
		<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	
		<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	
	<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	
	<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	</section>
  	
  	
  	
  	
	
	
	<br>
	<div class="container" style="width: 1100px;">
    	<h3 class="navbar-brand">| 리뷰존</h3>
  	</div>
  		<section>
		<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	
		<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	
	<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	
	<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
 				
  			</div>
		</div>
	</section>
  	
	
	


</main>


<footer id="footer" class="mt-5"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>




