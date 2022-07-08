<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="6376522390-jl2ldl1oicg3v38pq83n8d6q5fe781of.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<title>Insert title here</title>
</head>
<body>
	<div id="g_id_onload"
         data-client_id="6376522390-jl2ldl1oicg3v38pq83n8d6q5fe781of.apps.googleusercontent.com"
         data-login_uri="http://localhost:8090/controller/sns/googleRedirect.do"
         data-auto_prompt="false">
      </div>
      <div class="g_id_signin"
         data-type="standard"
         data-size="large"
         data-theme="outline"
         data-text="sign_in_with"
         data-shape="rectangular"
         data-logo_alignment="left">
      </div>

</body>
</html>