<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
	
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<script src="resources/js/jquery.shuffle-images.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link href="resources/css/global.css" rel="stylesheet">
	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("resources/article/footer.jsp");
		})
	</script>
</head>
<body>
<%
	int status = response.getStatus(); 
	pageContext.setAttribute("status", status); 
%> 


<c:choose>
	<c:when test="${pageScope.status eq '400'}">
		<img src="<%=request.getContextPath()%>/resources/image/400ERROR.png">
	</c:when>
	<c:when test="${pageScope.status eq '404'}">
		<img src="<%=request.getContextPath()%>/resources/image/404ERROR.png">
	</c:when>
	<c:when test="${pageScope.status eq '405'}">
		<img src="<%=request.getContextPath()%>/resources/image/405ERROR.png">
	</c:when>
	<c:when test="${pageScope.status eq '500'}">
		<img src="<%=request.getContextPath()%>/resources/image/500ERROR.png">
	</c:when>
	
</c:choose>

</body>
</html>