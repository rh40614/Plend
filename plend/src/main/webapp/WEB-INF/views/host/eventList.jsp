<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-이벤트</title>

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
	
	<!-- 프론트 디자인 -->
	<script type="text/javascript">
	
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/hostfooter.jsp");
		})
	</script>
	
<!--슬라이드 배너 -->
	<script>
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
		  $('.list-button span:eq(${activeIndex})').addClass('active');
		}
	
	</script>
	
	<!-- 이벤트 버튼 -->
	<script>
		function btn(obj){
			
			if($(obj).hasClass("btnDisabled") == true){
				$("#btnGroup").children("button").addClass("btnDisabled");
			
				$(obj).removeClass("btnDisabled");	 
				$(obj).addClass("btnBig");
			}
		}
	</script>
	
	<!-- 진행중인 이벤트 -->
	<script>
	function startList(start){
		
		$("#eventOFF").addClass("btnDisabled");
		$("#eventON").removeClass("btnDisabled");	 
		$("#eventON").addClass("btnBig");

		
		$.ajax({
			url: "startList.do",
			type: "GET",
			data: "startEnd="+ $(start).val(),
			success: function(data){
				console.log("성공");
				$("#list").html(data);
			},
			error: function(){
				console.log("실패");
			}
			
		})
	}
	
	</script>

	<!-- 종료된 이벤트 리스트  -->
	<script>
		function endList(end){
			
			$("#eventON").addClass("btnDisabled");
			$("#eventOFF").removeClass("btnDisabled");	 
			$("#eventOFF").addClass("btnBig");
			
			$.ajax({
				url: "startList.do",
				type: "GET",
				data: "startEnd="+ $(end).val(),
				success: function(data){
					//console.log("성공");
					$("#list").html(data);
				},
				error: function(){
					console.log("실패");
				}
				
			});
		}
		
		</script>
		<!-- 2022.08.09 이벤트 배너 가지고 오기  -->
		
		

	
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
		  	<div data-index=1>
		  		<c:forEach var ="b" items="${list}">
					<img src="<%=request.getContextPath()%>/eventImg.do?originFileName=${b.image}" alt='${b.semiTitle}' onclick="location.href='<%=request.getContextPath()%>/host/eventView.do?eidx='+${b.eidx}">
				</c:forEach>
			</div>
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
			<span class="title1 mb-5" style="margin-top:100px; margin-left:0px;">이벤트 리스트</span>
			<!-- 버튼 그룹 -->
			<div class="btn-group" role="group" id="btnGroup" >
				<button class="btnBig" id="eventON" onclick="startList(this)" value="start">진행중</button>	
				<button class="btnBig btnDisabled" id="eventOFF" onclick="endList(this)" value="end">진행 종료</button>	
			</div>
		
		
				<!--진행 중 이벤트 -->
				<article id="list">
				
				<c:if test="${list.size() == 0}">
				
					<div class=" mt-3 me-5"  style="width: 18rem;">
					    <p class="title2 ms-auto">현재 진행 이벤트가 없습니다. </p>
					</div>
				</c:if>
				
				<c:if test="${not empty list}">
					<c:forEach var="event" items="${list}">
						<div class="card mt-3 me-5"  style="width: 18rem;">
							 <img src="<%=request.getContextPath()%>/eventImg.do?originFileName=${event.image}" class="card-img-top" alt="${event.semiTitle}" onclick="location.href='<%=request.getContextPath()%>/host/eventView.do?eidx='+${event.eidx}">
							 <div class="card-body">
							    <p class="card-text"  onclick="location.href='<%=request.getContextPath()%>/host/eventView.do?eidx='+${event.eidx}">${event.semiTitle}</p>
							 </div>
						</div>
						<input type="hidden" value="${event.eidx}" id="eidx">
					</c:forEach>
				</c:if>
				
				</article>
				
				
		
		
		</section>

	</main>
	<div style="margin:300px;"></div>
	<footer id="footer"></footer>
	

</body>
</html>