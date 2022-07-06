<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
 
 

</head>
<body>
<h5> 로그인 성공시 리다이렉트 되는 경로 </h5>

   <!--  -->
  <c:if test="${nickname != null}">
        <h1>로그인 성공입니다</h1>
        <h3>${session.nickname}</h3>
        <input type="button" value="로그아웃" onclick="location.href='<%=request.getContextPath()%>/common/logout'">
  </c:if>
  
  <c:if test="${nickname == null}">
        <h1>세션 없음</h1>
        
  </c:if>

</body>
</html>