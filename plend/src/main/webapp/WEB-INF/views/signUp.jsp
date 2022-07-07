<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>회원가입</title>
	<!-- 07.07 김영민 헤더,푸터 로드사용 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="resources/css/global.css" rel="stylesheet">
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#header").load("resources/article/header.jsp");
			$("#footer").load("resources/article/footer.jsp");
		})
	</script>
	
</head>
<body>
	
	<header id="header"></header> <br>
	
	<h1>회원가입 </h1>
	
	<footer id="footer"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
