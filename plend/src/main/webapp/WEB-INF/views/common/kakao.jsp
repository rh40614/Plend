<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<h5>안녕하세요</h5>

<script>
$(function(){
	let code = new URL(window.location.href).searchParams.get('code');
	$("#kkk").html(code);
})



</script>


<div id="kkk"></div>
</body>
</html>