<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- 07.13 김영민 뷰제작 -->
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 블랙리스트</title>
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<!-- css -->
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/developer.css" rel="stylesheet">
	<!-- font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
	<!-- header/footer 불러오기 -->	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/developerHeader.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
</head>
<body>
	<!-- h-100을 제거하면 푸터가 올라오고...고쳐야함 -->
	<div id="wrap" class="container-fluid h-100 overflow-auto">	
		<header id="header" class="row"></header>
		<br><br>
		<div class="row mt-3">
			<div class="col category">
				<p class="h5 fw-bold category-title"> 업체블랙리스트 </p>
			</div>
		</div>
		<section class="row px-1">
			<table class="col table text-center table-hover">
			  <thead class="table-dark">
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">업체명</th>
			      <th scope="col">대표자명</th>
			      <th scope="col">업체번호</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td>jjangjjangEnter</td>
			      <td>김연희</td>
			      <td>010-1234-5678</td>
			    </tr>
			  </tbody>
			</table>
		</section>
		<nav id="pagenation" class="row">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">&raquo;</a>
		    </li>
		  </ul>
		</nav>
		<div class="row mt-3">
			<div class="col category">
				<p class="h5 fw-bold"> 업체별 사용자 블랙리스트 - 업체명 </p>
			</div>
		</div>
		<section class="row px-1">
			<table class="col table text-center table-hover">
			  <thead class="table-dark">
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">회원명</th>
			      <th scope="col">가입/탈퇴</th>
			      <th scope="col">등록일</th>
			      <th scope="col" class="col col-5">사유</th>
			      <th scope="col">삭제</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td>김연희</td>
			      <td>Y</td>
			      <td>2022-07-13</td>
			      <td> 그냥 </td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="#" role="button">삭제</a></td>
			    </tr>
			  </tbody>
			</table>
		</section>
		<nav id="pagenation" class="row">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">&raquo;</a>
		    </li>
		  </ul>
		</nav>
		<div class="flex-grow-1"></div>
		<footer id="footer" class="row"></footer>
	</div>
	<!-- 승인/반려 버튼 클릭 이벤트 -->
	<script type="text/javascript">
		$(".confirm").click(function(){
			$(this).closest("tr").css("color","#BDBDBD");
		})
		
		$(".reject").click(function(){
			$(this).closest("tr").css("color","#FF0000");
		})
	</script>	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>




