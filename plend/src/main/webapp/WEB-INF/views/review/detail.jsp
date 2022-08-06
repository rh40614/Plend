<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>장소 상세 페이지</title>
	<!-- BootStrap css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- jquery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<!-- css -->
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/review.css" rel="stylesheet">
	<!-- header/footer -->	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		});
	</script>
</head>
<body>
<div class="container">	
	<header class="row" id="header"></header>
	<br>
	<main class="row">
		<table>
			<tbody>
				<c:forEach var="img" items="${imgs}">
					<tr> 
						<td>
							<img width="750" height="350" alt="img" src="<%=request.getContextPath() %>/reviewImg.do?originFileName=${img.originFileName}"/>
						</td>
					</tr>				
				</c:forEach>
				<tr class="" style="border-top: 2px solid black;"> 
					<td>${review.title}</td>
				</tr>
				<tr> 
					<td>
					  <div class="rating"> 
			          	  <input type="radio" name="rate" value="5" id="5" disabled="disabled"><label for="5">☆</label> 
			          	  <input type="radio" name="rate" value="4" id="4" disabled="disabled"><label for="4">☆</label> 
			          	  <input type="radio" name="rate" value="3" id="3" disabled="disabled"><label for="3">☆</label> 
			          	  <input type="radio" name="rate" value="2" id="2" disabled="disabled"><label for="2">☆</label> 
			          	  <input type="radio" name="rate" value="1" id="1" disabled="disabled"><label for="1">☆</label> 
		          	  </div>
		          	  
					</td>
				</tr>
				<tr> 
					<td>${review.content}</td>
				</tr>
				<tr>
					<td style="text-align: end;">
						<a class="btn btn-sm">수정</a>
						<a class="btn btn-sm">삭제</a>
						<a class="btn btn-sm">신고하기</a>
						<a class="btn btn-sm">블랙리스트 등록</a>
						<a class="btn btn-sm">뒤로가기</a>
					</td>
				</tr>
			</tbody>
		</table>
	</main>
</div>
<footer id="footer" class="row mt-5"></footer>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 리뷰 별점 표현하기 -->
<script type="text/javascript">
	console.log(${review.rate});
	$("#${review.rate}").prop("checked", true);
</script>
</body>
</html>




