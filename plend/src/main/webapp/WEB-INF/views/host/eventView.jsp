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
	<!--이벤트 버튼 -->
	<script>
		function btn(obj){
			
			if($(obj).hasClass("btnDisabled") == true){
				$("#btnGroup").children("button").addClass("btnDisabled");
			
				$(obj).removeClass("btnDisabled");	 
				$(obj).addClass("btnBig");
			}
		}
	</script>
	<script>
		$(function(){
			$.ajax({
				url: "eventList.do",
				type: "GET",
				data: "startEnd=start",
				success: function(){
					console.log("성공");
				},
				error: function(){
					console.log("실패");
				}
			});
		})
	</script>

</head>
<body>

	<header id="header"></header>
	
	<!-- 2022.07.18 김연희: main에 margin top150 기본으로 되어있으나 배너 부분은  딱맞게 시작하게 설정 -->
	<main style="margin-top: 53px;" >
		<!--제목  -->
		<section class="w-100">
			<span class="title1 mb-5" style="margin-top:100px; margin-left: 5%;">이벤트</span>
			<div class="w-100">
				<table class="table " id="promotionTable">
					<tbody>
						
						<tr class="border-top">
							<td rowspan="5" class="col-md-5" style="text-align: center;"><img style="width: 25rem; height: 22rem;"  src="<%=request.getContextPath()%>/eventImg.do?realFileName=${e.image}" alt="이벤트 이미지"></td>
							<td class="col-md-2">제목: </td>
							<td class=" col-md-5">${e.title}</td>
						</tr>
						<tr>
							<td class="col-md-2">부제목: </td>
							<td class="col-md-5">${e.semiTitle}</td>
						</tr>
						<tr>
							<td class="col-md-2">기간: </td>
							<td class="col-md-5">${e.edate}</td>
						</tr>
						<tr>
							<td class="col-md-2">내용: </td>
							<td class="col-md-5">${e.content }</td>
						</tr>
						<tr>
							<td class="col-md-2">약관(조건):</td>
							<td class="col-md-5">${e.conditions}</td>
						</tr>
					</tbody>
				</table>
			<br>
			</div>
			<div class="d-flex" style="display: flex!important; width: 100%; justify-content: flex-end;">
				<button class="btnBig" onclick="location.href='<%=request.getContextPath()%>/host/eventList.do?startEnd=start'" >목록</button>
			</div>
		</section>

	</main>
		<div style="margin:200px;"></div>	
	<footer id="footer"></footer>

</body>
</html>