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
				<tr> 
					<td>이미지</td>
				</tr>
				<tr class="" style="border-top: 2px solid black;"> 
					<td>제목</td>
				</tr>
				<tr> 
					<td>별점</td>
				</tr>
				<tr> 
					<td>내용</td>
				</tr>
				<tr>
					<td>
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
</body>
</html>




