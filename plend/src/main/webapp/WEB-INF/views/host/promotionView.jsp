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

	<header id="header"></header>
	
	<main style="margin-top:40px;">
	
		<!-- 슬라이드 배너  -->
		<div class="banner-container">
		  <div class="banner">
		    <div data-index=1><img src="<%=request.getContextPath()%>/resources/image/slideBanner/slideBanner.png" alt="슬라이드 1" onclick="location.href='<%=request.getContextPath()%>/host/promotionView.do'"></div>
		    <div data-index=2><img src="<%=request.getContextPath()%>/resources/image/slideBanner/slideBanner.png" alt="슬라이드 2"></div>
		    <div data-index=3><img src="<%=request.getContextPath()%>/resources/image/slideBanner/slideBanner.png" alt="슬라이드 3"></div>
		    <div data-index=4><img src="<%=request.getContextPath()%>/resources/image/slideBanner/slideBanner.png" alt="슬라이드 4"></div>
		  </div>
		</div>
		<div class="list-button">
		  <span class="list-button-item active"></span> 
		  <span class="list-button-item"></span> 
		  <span class="list-button-item"></span> 
		  <span class="list-button-item"></span> 
		</div>  
	
	
	
		<!--제목  -->
		<section>
			<span class="frmTitle mb-5" style="margin-top:100px;">프로모션 리스트</span>
		
			<div class="promotionViewDIV">
			
			<table class="promotionTable" id="promotionTable">
				<tr>
					<td colspan="3" class="frmSemiTitle">제목</td>
				</tr>
				<tr>
					<td rowspan="4"><img style="width: 100%; height: 80%;" src="<%=request.getContextPath()%>/resources/image/promotion/promotionM.png" alt="프로모션 이미지"></td><td>부제목: </td><td>10% 상설 할인</td>
				</tr>
				<tr>
					<td>기간: </td>
					<td>2022.07.12~2022.08.12</td>
				</tr>
				<tr>
					<td>내용: </td>
					<td>여름을 맞이하여 제휴  업체들에게는 10% 할인 쿠폰을 제공합니다.5000원 이상 구매시 사용가능업체당 100매</td>
				</tr>
				<tr>
					<td>약관(조건):</td>
					<td></td>
				</tr>
			
			
			</table>
			
			
			
			
			
			</div>
		
		
		
		
		
		
		</section>

	</main>
	<div style="margin:300px;"></div>
	
	

</body>
</html>