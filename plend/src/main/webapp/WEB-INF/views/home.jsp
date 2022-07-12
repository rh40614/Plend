<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="resources/css/global.css" rel="stylesheet">
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#header").load("resources/article/developerHeader.jsp");
			$("#footer").load("resources/article/footer.jsp");
		})
	</script>
	
</head>

</head> 

<body>
	
	<header id="header"></header> <br>
	
	<c:if test = "${login != null }">
		${login.id}님 환영합니당!
	</c:if> 
	<h1>Hello world! </h1>


	<P>  The time on the server is ${serverTime}.</P>
	<a href="test.do">test</a>
	<a href="testGet.do"> testGet </a>
	<a href="headerWithCate.do">headerWithCate</a>
	<a href="sns/redirect.do">kakao</a>
	<a href="sns/googleRedirect.do">google</a>
	<a href="sns/googlelogin.do">googlelogin</a>
	<a href="common/signIn.do">signIn</a>
	<a href="common/signOut.do">signOut</a>
	<a href="common/signUp.do"> signup</a>
	<a href="login.do">kakkaoLogin</a>
	<footer id="footer"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>






</h1>
<P>  The time on the server is ${serverTime}.</P>

<a href= "common/join.do">회원가입</a>
<a href = "common/login.do">로그인</a>
<a href = "host/host.do">호스트메인</a>
<a href = "host/host3.do">호스트화면</a>
<a href = "common/googleLogin.do">구글 로그인</a>

</body>
</html>




