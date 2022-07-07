<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
</head> 
<body>
<h1>
	Hello world!  

</h1>
<P>  The time on the server is ${serverTime}.</P>

<a href= "common/join.do">회원가입</a>
<a href = "common/login.do">로그인</a>
<a href = "host/host.do">호스트메인</a>
<a href = "host/host3.do">호스트화면</a>
<a href = "common/googleLogin.do">구글 로그인</a>
<a href = "common/logout.do">로그아웃</a>
</body>
</html>
