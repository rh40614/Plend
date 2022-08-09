<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>plend</title>
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
	
	<style>
	#naviBar {
			list-style-type: none;
			overflow: auto;
			}
		
		#select {
			display: block;
			color: black;
			padding: 8px 16px;
			text-decoration: none;
			position : relative;
			margin-top : 20px;
			text-align:center;
			z-index:1;
			}
		#select:before{
			content: '';
			position: absolute; /*부모 요소에는 position: relative를 주어야 함*/
			background-color: #FF007F;
			height: 50px;
			width: 0; /*초기에 보이지 않도록*/
			bottom: -5px; /*a태그 아래에 위치*/
			transition: 0.7s; /*애니메이션 동작 실행 시간 정의*/
			margin-left:29px;
			left:0;
			z-index : -1;
			}
			
		#select:hover:before{
			width: 83%;
			}
		#select:hover{
			color:white;	
			}
		
	#infoBox{
			margin : 5% 0 10% 10%;
			float : right;
			width : 70%;
			height: 70%;
	
		}
		table {
			width : 400px;
			margin-left:auto;
			margin-right:auto;
		
		}
		table,tr,td {
			height : 40px;
			text-align: center;
		}
		
		
	#MyPageBox{
			text-align:center;
			color:white;
			height:15%;
			background:#2F506D;
		}
		#regBtn {
			margin-right: 13px;
			float:right;
			border-radius:15px;
			border : 1px solid #2F506D;
			background : #2F506D;
			color : white;
			width : 90px;
			height : 30px;
		}
		#regBtn:hover{
			border : 0px;
			background-color:#3FC1C9;
		}
		#infoText {
			border : 0;
			background : #D8D8D8;
			width : 250px;
		}
		
		section{
		display: flex;
		flex-direction: row;
		align-items: center;
    	justify-content: flex-start;
    	
		} 
	
		.bolt{
		position: absolute;
		z-index:5;
		margin: 10px;
		
		}
	</style>
</head>

<body>
<div id="wrap">	
	<header id="header" style = "height:0;"></header>
   <br>
   	<div style="display:flex; ">
   	<nav style="display: flex;flex-direction: column;width:11%;margin-top:48px;background: #CFCFCF">
   		<div id = "MyPageBox">
   			<br>
   			<br>
     		<h4>My Page</h4>
    	</div>
    	<div>
 		<ul id = "naviBar">
     	<!-- 나중에 해당링크 들어간 곳 글씨 진하게하는 css 추가하기 -->
 		 <li><a href="myInfo.do?uidx=${login.uidx}" id = "select">내 정보</a></li>
 		 <li><a href="#" id = "select">쿠폰 등록</a></li>
  		 <li><a href="bookStatus.do?uidx=${login.uidx}" id = "select">예약 현황</a></li>
 		 <li><a href="heartList.do?uidx=${login.uidx}" id = "select"><strong>찜 목록</strong></a></li>
 		 <li><a href="#" id = "select">마이 리뷰</a></li>
 		 <li><a href="withdraw.do?uidx=${login.uidx}" id = "select">회원 탈퇴</a></li>
 		 <br>
	    </ul>
	    </div>
   	</nav>  	
   	
   <div id = "infoBox">
   	<br>
		<h5><strong>찜 목록</strong></h5>
		<br>
		<section>
			<div class="card " style="width: 16rem; margin-right: 20px;">
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
		
		<div class="card " style="width: 16rem; margin-right: 20px;">
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
		<div class="card " style="width: 16rem; margin-right: 20px;">
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
		<div class="card " style="width: 16rem; margin-right: 20px;">
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
		<br>
		<section>
			<div class="card " style="width: 16rem; margin-right: 20px;">
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
		
		<div class="card " style="width: 16rem; margin-right: 20px;">
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
		<div class="card " style="width: 16rem; margin-right: 20px;">
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
		<div class="card " style="width: 16rem; margin-right: 20px;">
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
   </div>
   </div>
   </div>
<div style="margin-top: -48px;">
<footer id="footer" class="mt-5" style = "float:none;display:inline-block;"></footer>
</div>
</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>




