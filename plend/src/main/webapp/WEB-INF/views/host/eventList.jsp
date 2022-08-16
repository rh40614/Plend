<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-이벤트</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	
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
					console.log("성공");
					$("#list").html(data);
				},
				error: function(){
					console.log("실패");
				}
				
			});
		}
		
		</script>
	
</head>
<body>
	<!-- header -->
	<header id="header"></header>
	<!-- main -->
	<!-- 2022.07.18 김연희: main에 margin top150dl 기본으로 되어있으나 배너 부분은  딱맞게 시작하게 설정 -->
	<main style="margin-top: 53px; margin-right: 0px;important!" class="d-flex flex-column" >
		<!-- 슬라이드 배너  -->
		<div id="carouselExampleIndicators" class="carousel slide " data-bs-ride="carousel" style="width:100%; ">
		  <div class="carousel-indicators">
		  	<c:forEach var ="b" items="${list}" varStatus="status">
		 		 <c:choose>
		 		 	<c:when test="${status.index == '0'}">
 						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class=" active " aria-current="true" aria-label="Slide 1"></button>
    				</c:when>
    				<c:otherwise>
				    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" aria-label="Slide 2" class=""></button>   				
				    </c:otherwise>
    			</c:choose>
			  </c:forEach>
		  
		  </div>
		  <div class="carousel-inner">
		  		<c:if test="${empty list}">
			    	<div class="carousel-item active">
	   					<img src="<%=request.getContextPath()%>/img/alternative/noEventNow.png" alt='진행중인 이벤트가 없습니다. ' class="d-block w-100 " style="height: 400px;" >
	   				</div>
	   			</c:if>	
			  	<c:forEach var ="b" items="${list}" varStatus="status">
			 		 <c:choose>
			 		 	<c:when test="${status.index == '0'}">
					    	<div class="carousel-item active">
		      					<img src="<%=request.getContextPath()%>/eventImg.do?originFileName=${b.banner}" alt='${b.semiTitle}' onclick="location.href='<%=request.getContextPath()%>/host/eventView.do?eidx='+${b.eidx}" class="d-block w-100" style="height: 400px;" >
		    				</div>
	    				</c:when>
	    				<c:otherwise >
					    	<div class="carousel-item">
		      					<img src="<%=request.getContextPath()%>/eventImg.do?originFileName=${b.banner}" alt='${b.semiTitle}' onclick="location.href='<%=request.getContextPath()%>/host/eventView.do?eidx='+${b.eidx}" class="d-block w-100 " style="height: 400px;" >
		    				</div>
	    				</c:otherwise>
    			</c:choose>
			  </c:forEach>
		    
		  </div>
		  <c:if test="${not empty list}"> 
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		  </c:if>
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
				<article id="list" style="width: 100%; height: 300px; align-items: center;">
				
				<c:if test="${list.size() == 0}">
					<div style="display:flex; justify-content: center;width: 100%;">
					    <p class="title2 ">현재 진행 이벤트가 없습니다. </p>
					</div>
				</c:if>
				
				<c:if test="${not empty list}">
					<c:forEach var="event" items="${list}">
						<div class="card mt-3 me-5"  style="width: 18rem; height: 280px;">
							 <img src="<%=request.getContextPath()%>/eventImg.do?originFileName=${event.image}" style="height: 230px;" class="card-img-top" alt="${event.semiTitle}" onclick="location.href='<%=request.getContextPath()%>/host/eventView.do?eidx='+${event.eidx}">
							 <div class="card-body">
							    <p class="card-text"  onclick="location.href='<%=request.getContextPath()%>/host/eventView.do?eidx='+${event.eidx}">${event.semiTitle}</p>
							 </div>
						</div>
						<input type="hidden" value="${event.eidx}" id="eidx">
					</c:forEach>
				</c:if>
				
				</article>
				
			<c:if test="${login.role == '1'}">
			<div class="container d-flex justify-content-end mb-5">
				<button class="btnBig" onclick="location.href='<%=request.getContextPath()%>/developer/event.do'" >이벤트 등록</button>	
			</div>
			</c:if>	
					
		</section>
		
		
	</main>
	
	<footer id="footer"></footer>
	

</body>
</html>