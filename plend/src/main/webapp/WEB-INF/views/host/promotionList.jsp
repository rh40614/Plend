<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-프로모션</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/slideBanner_HOST.css" rel="stylesheet">
	
	
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<!-- bootstrap  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!--  fontAwesome -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	
	
	<script type="text/javascript">
	//프론트 디자인
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/hostfooter.jsp");
		})
	</script>
	
	<script>
	//슬라이드 배너
		let interval;
		let activeIndex = 1;
	
		$(document).ready(function(){
		  interval = setInterval(changeActiveIndex,2500);
			$('.list-button-item').on('click',function(){
		  	// list button의 색상 변경
		    const index = $(this).index();
		    activeIndex = index;
		    changeActiveIndex();
		    clearInterval(interval);
		    // animation 재설정을 위해 animation을 잠시 제거한다.
		    $('.banner').css('animation','none');
		   	// animation 재설정
		    $('.banner').animate({marginLeft:`${-100*index}%`},1,function(){
		    	//1초의 시간 여유(해당 이미지로 이동하는 animation을 위한 시간)를 두고 다시 animation을 설정한다.
		    	setTimeout(function(){
		    		$('.banner').css('animation',`animation${index+1} 10s infinite`)
		  
		  		interval = setInterval(changeActiveIndex,2500);
		      }, 1000)
		    })
		  })
		})
		function changeActiveIndex(){
			if(activeIndex>3) {
		  	activeIndex%=4;
		  }
		  changeActiveBtn();
			activeIndex+=1;
		}
		function changeActiveBtn(){
		  $('.list-button-item').removeClass('active');
		  $(`.list-button span:eq(${activeIndex})`).addClass('active');
		}
	
	</script>
	
	<script>
	//프로모션 버튼
			
		function btn(obj){
			
			if($(obj).hasClass("btnDisabled") == true){
				$("#btnGroup").children("button").addClass("btnDisabled");
			
				$(obj).removeClass("btnDisabled");	 
				$(obj).addClass("btnBig");
				
			}
			
		}
			
	</script>
	


</head>
<body>
	<!-- header -->
	<header id="header"></header>
	<!-- main -->
	<!-- 2022.07.18 김연희: main에 margin top150dl 기본으로 되어있으나 배너 부분은  딱맞게 시작하게 설정 -->
	<main style="margin-top: 85px;" >
	
		<!-- 슬라이드 배너  -->
		<div class="banner-container">
		  <div class="banner">
		    <div data-index=1><img src="<%=request.getContextPath()%>/resources/image/slideBanner/slideBanner.png" alt="슬라이드 1" onclick="location.href='<%=request.getContextPath()%>/host/promotionView.do'"></div>
		    <div data-index=2><img src="<%=request.getContextPath()%>/resources/image/slideBanner/slideBanner.png" alt="슬라이드 2" onclick="location.href='<%=request.getContextPath()%>/host/promotionView.do'"></div>
		    <div data-index=3><img src="<%=request.getContextPath()%>/resources/image/slideBanner/slideBanner.png" alt="슬라이드 3" onclick="location.href='<%=request.getContextPath()%>/host/promotionView.do'"></div>
		    <div data-index=4><img src="<%=request.getContextPath()%>/resources/image/slideBanner/slideBanner.png" alt="슬라이드 4" onclick="location.href='<%=request.getContextPath()%>/host/promotionView.do'"></div>
		  </div>
		</div>
		<div class="list-button">
		  <span class="list-button-item active"></span> 
		  <span class="list-button-item"></span> 
		  <span class="list-button-item"></span> 
		  <span class="list-button-item"></span> 
		</div> 
	
	
	
		<!--section  -->
		<section>
			<!-- 제목 -->
			<span class="title1 mb-5" style="margin-top:100px; margin-left:0px;">프로모션 리스트</span>
			<!-- 버튼 그룹 -->
			<div class="btn-group" role="group" id="btnGroup" >
				<button class="btnBig" id="promotionON" onclick="btn(this)">진행중</button>	
				<button class="btnBig btnDisabled" id="promotionOFF" onclick="btn(this)">진행 종료</button>	
			</div>
		
		
				<!-- 프로모션 -->
				<article>
				
					<div class="card mt-3 me-5"  style="width: 18rem;">
					  <img src="<%=request.getContextPath()%>/resources/image/promotion/promotion.png" class="card-img-top" alt="..." onclick="location.href='<%=request.getContextPath()%>/host/promotionView.do'">
					  <div class="card-body">
					    <p class="card-text">전 카테고리 10% 할인 </p>
					  </div>
					</div>
					
					<div class="card mt-3 me-5" style="width: 18rem;">
					  <img src="<%=request.getContextPath()%>/resources/image/promotion/promotion.png" class="card-img-top" alt="..." onclick="location.href='<%=request.getContextPath()%>/host/promotionView.do'">
					  <div class="card-body">
					    <p class="card-text">전 카테고리 10% 할인 </p>
					  </div>
					</div>
					
					<div class="card mt-3 me-5" style="width: 18rem;">
					  <img src="<%=request.getContextPath()%>/resources/image/promotion/promotion.png" class="card-img-top" alt="..." onclick="location.href='<%=request.getContextPath()%>/host/promotionView.do'">
					  <div class="card-body">
					    <p class="card-text">전 카테고리 10% 할인 </p>
					  </div>
					</div>
					 
					<div class="card mt-3 me-5" style="width: 18rem;">
					  <img src="<%=request.getContextPath()%>/resources/image/promotion/promotion.png" class="card-img-top" alt="..." onclick="location.href='<%=request.getContextPath()%>/host/promotionView.do'">
					  <div class="card-body">
					    <p class="card-text">전 카테고리 10% 할인 </p>
					  </div>
					</div> 
				
				
				</article>
				
		
		
		</section>

	</main>
	<div style="margin:300px;"></div>
	<footer id="footer"></footer>
	

</body>
</html>