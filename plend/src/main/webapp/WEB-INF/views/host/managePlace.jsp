<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-장소 관리</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
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
		$(function(){
			//장소 로딩
			$.ajax({
				url: "placeList.do",
				type: "GET",
				success: function(data){
					$("#placeList").html(data);
				}
			});
			//예약 로딩
			$.ajax({
				url: "bookList.do",
				type: "GET",
				success: function(data){
					$("#bookList").html(data);
				}
			});
			//리뷰 로딩
			$.ajax({
				url: "reviewList.do",
				type: "GET",
				success: function(data){
					$("#reviewList").html(data);
				},
				error: function(){
					console.log("아이고");
				}
			});
			
		});
	</script>
	

</head>
<body>

	<header id="header"></header>
	
	<main>
	<!-- 장소관리 리스트 -->
		<section>
		<div class="container" style=" margin-left: 100px; display: flex;  justify-content: space-between; align-items: baseline; margin-left: 100px;">
			<span class="title1" style="margin:0px;">플레이스 리스트</span>
			<button class="mb-3 btnBig " onclick="location.href='<%=request.getContextPath()%>/host/insertPlace.do'">플레이스 등록</button>
		</div>		
			<div class=".table-responsive container " style="margin-left: 100px;" >
				<div id="placeList" style="height:550px;justify-content: space-between;align-items: center;" class="d-flex flex-column" >
					<!-- 데이터 들어오는 곳 -->
				</div>
			    <hr width="100%">
			</div>
		</section>
	<!-- 예약현황 리스트 -->	
		<section>
			<span class="title1 mt-5 mb-5" style="margin-left: 120px;">예약 현황</span>
				<div class=".table-responsive container " style="margin-left: 100px;" >
					<div id="bookList"  style="height:400px; justify-content: space-between;align-items: center;" class="d-flex flex-column ">
						<!-- 데이터 들어오는 곳 -->
					</div>
					<hr width="100%">
				</div>
		</section>		
	<!-- 후기 리스트 -->	
		<section>
			<span class="title1 mt-5 mb-5" style="margin-left: 120px;">후기</span>
				<div class=".table-responsive container " style="margin-left: 100px;" >
					<div id="reviewList" style="height:400px; justify-content: space-between;align-items: center;" class="d-flex flex-column">
						<!-- 데이터 들어오는 곳 -->
					</div>
					<hr width="100%">
				</div>
		</section>	

	</main>

	<footer id="footer"></footer>
</body>
</html>