<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

aud : ${info.aud} <br>
sub : ${sub} <br>
name : ${info.name} <br>
email : ${info.email}
<button onclick="location.href='rebork.do'">연결해제</button>


</body>
</html>