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
	<link href="<%=request.getContextPath()%>/resources/css/placeDetail.css" rel="stylesheet">
	<!-- header/footer -->	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
	<style type="text/css">
		.nav-scroller{
			background-color: #D9D9D9 ;
			border-color: #D9D9D9;
		}
		.link-secondary {
			vertical-align: middle;
			text-align: center;
		}
		#QnAsubmit {
			justify-content: center;
	    	align-items: center;
		}
	</style>
</head>

<body>
<div class="container">	
	<header class="row" id="header"></header>
	<br>
	<main class="row">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<textarea class="form-control" placeholder="Leave a comment here"></textarea>
			<a id="QnAsubmit" href="QnA.do" class="btn btn-primary btn-sm rounded-3 me-2 col-1 d-inline-flex">등록</a>
		</div>
	</main>
</div>
<footer id="footer" class="row mt-5"></footer>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- nav 클릭시 색상변화 -->
<script>
	$(".detailNav").children("a").click(function(){
		$(".detailNav").children("a").removeClass("active2");
		$(this).addClass("active2");
	});
</script>
</body>
</html>




