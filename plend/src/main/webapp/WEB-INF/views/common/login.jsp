<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
button{
	background: none;
	border: none;
}
</style>
</head>
<body>


<button type="button" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=ab7da9e9cfc38c18cc1cac5e5ddc71f0&redirect_uri=http://localhost:8090/controller/common/kakaoLogin&response_type=code'"><img alt="카카오 로그인" src="<%=request.getContextPath()%>/resources/image/kakao_login_medium_narrow.png"></button>

</body>
</html>