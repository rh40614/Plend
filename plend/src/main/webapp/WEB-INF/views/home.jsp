<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="229501873706-7g1g5tqh1jeitmnhmnkft67koof6th6e.apps.googleusercontent.com">
	
	<title>Home</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="resources/css/global.css" rel="stylesheet">
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://accounts.google.com/gsi/client" async defer></script>
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
	
	<h1>Hello world! </h1>


	<P>  The time on the server is ${serverTime}.</P>

	<a href="${navervo.apiURL }"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	<a href="${kakaovo.apiURL }"><img alt="카카오 로그인" src="<%=request.getContextPath()%>/resources/image/kakao_login_medium_narrow.png"></a>	
	<div id="g_id_onload"
     data-client_id="229501873706-7g1g5tqh1jeitmnhmnkft67koof6th6e.apps.googleusercontent.com"
     data-login_uri="http://localhost:8090/controller/common/googleloginGo.do"
     data-auto_prompt="false"></div>
  	<div class="g_id_signin"
  	 	data-type="standard" 
  	 	data-size="large"
     	data-theme="outline" 
    	data-text="sign_in_with" 
    	data-shape="rectangular"
     	data-logo_alignment="left">
	</div>

	<footer id="footer"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>




