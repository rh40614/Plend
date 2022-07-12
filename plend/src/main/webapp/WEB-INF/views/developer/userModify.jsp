<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보수정</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/developer.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
		
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/developerHeader.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>	
</head>

<body>
	<div id="wrap" class="container-fluid h-100">	
		<header id="header" class="row"></header>
		<br><br>
		<div class="row mt-3">
			<div class="col category">
				<p class="h5 fw-bold"> 회원정보수정 </p>
				<p class="blockquote-footer mt-1"> 회원기본정보 </p>
			</div>
		</div>
		<section class="row px-1">
			<table class="col table border-top border-dark">
			  <tbody>
			    <tr >
			      <td scope="row">아이디</td>
			      <td>Mark</td>
			    </tr>
			    <tr>
			      <td scope="row">비밀번호</td>
			      <td>Mark</td>
			    </tr>
			    <tr>
			      <td scope="row">이름</td>
			      <td>Mark</td>
			    </tr>
			    <tr>
			      <td scope="row">이메일</td>
			      <td>Mark</td>
			    </tr>
			  </tbody>
			</table>
		</section>
		<div class="flex-grow-1"></div>
		<footer id="footer" class="row"></footer>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>




