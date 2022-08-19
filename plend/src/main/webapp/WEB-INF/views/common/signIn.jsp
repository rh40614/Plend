<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>로그인</title>
	<!-- 07.07 김영민 헤더,푸터 로드사용 -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id" content="229501873706-7g1g5tqh1jeitmnhmnkft67koof6th6e.apps.googleusercontent.com">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="../resources/css/global.css" rel="stylesheet">
	<link href="../resources/css/signIn.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	<!--08.08 김하진 아이디 저장 쿠키 생성 -->
	$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("../resources/article/footer.jsp");
			//쿠키값 읽어오기
			var id = getCookie("Cookie_id");

			if (id) {
				$("input[name=id]").val(id);
				$("#idChk").attr("checked", true);
			}
		})

	function check1() {
		var frm = document.frm;
		var keyCode = window.event.keyCode;
		var idChk = $("#idChk").is(":checked");
		if (keyCode == 13){
		if (frm.id.value == "") {
			alert("아이디를 입력해주세요.");
			return;
		} else if (frm.password.value == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		} else if (idChk){
			setCookie("Cookie_id", frm.id.value, 3);
			// 체크박스가 선택된 경우 Cookie_id 라는 이름으로 id 값이 3일간 저장

		} else if(!idChk){
			
			frm.submit();
		}else {

			deleteCookie("Cookie_id");
		}
		frm.submit();
	}
	}

	function check2(){
		var frm = document.frm;
		var idChk = $("#idChk").is(":checked");
		
		if (frm.id.value == "") {
			alert("아이디를 입력해주세요.");
			return;
		} else if (frm.password.value == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		} else if (idChk){
			setCookie("Cookie_id", frm.id.value, 3);
			// 체크박스가 선택된 경우 Cookie_id 라는 이름으로 id 값이 3일간 저장

		} else if(!idChk){
			
			frm.submit();
		}else {

			deleteCookie("Cookie_id");
		}
		frm.submit();
		
	}
	
	//쿠키 생성 함수(쿠키이름, 쿠키값, 저장기간)
	function setCookie(cookieName, value , exdays){
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	//생성된 쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + "=";
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';

		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1) end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
	//쿠키 지우기
	function deleteCookie(cookieName) {
		var expireData = new Data();
		expireData.setData(expireData.getData() - 1);
		document.cookie = cookieName + "=" + "; expires = " + expireData.toGMTString();
	}
	
	</script>
</head>
<body onkeyup = "javascript:check1();">
<div id="wrap">
	<header id="header"></header>
		<!-- 08.10 김연희 : flex 1 으로 하단 고정 -->
		<main style="flex: 1; margin: 50px 20% 20% 20%; display: flex; flex-direction: column; align-items: center;">
			<br>
				<!-- 2022.08.10 김연희 : 디자인 이것저것 시도중 -->
				<%-- <div class="g-signin2" data-onsuccess="onSignIn" style = "display: flex; flex-direction: row-reverse;flex-wrap: nowrap;align-content: center;justify-content: center; margin:7px;"></div>
				<a href="${navervo.apiURL }"><img height="50" style = "margin:7px;" src="../resources/image/naverLogin.png"/></a> <br>
				<button type="button" style = "margin:7px;" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=ab7da9e9cfc38c18cc1cac5e5ddc71f0&redirect_uri=http://localhost:8090/controller/common/kakaoLogin&response_type=code'"><img alt="카카오 로그인" src="<%=request.getContextPath()%>/resources/image/kakao_login_medium_narrow.png"></button><br>	<div class="hr-sect">또는</div>
				<br> --%>
			<div class="loginBox">
			<p  class="mb-4 mt-5 loginLetter">로그인</p>
				<form action = "signIn.do" method ="post" name = "frm" id = "frm">
					<input type = "text" name = "id" placeholder = "아이디" class = "textbox loginId" id = "ID"><br>
					<input type = "password" name = "password" placeholder = "비밀번호" class = "textbox mb-3 loginpwd" id = "PWD">
					<div style="margin-right: auto;" class="mb-3">
						<input type = "checkbox" id = "idChk" > 아이디 기억하기
					</div>
			 			<input type = "button" onclick = "check2();" value = "로그인" id = "signBtn">
			 			<hr style = "margin-left : 280px; margin-right: 280px;">
					<div class="d-flex;">
			 			<a href = "searchId.do">아이디 찾기</a> | <a href = "searchPwd.do">비밀번호 찾기</a>
			 		</div>
			 		<div style = "align-items: center; " class="mt-2">
						<a href = "signUp.do" >회원가입</a>
					</div>
				</form>
				<div class="mb-1" style="color: gray;">--------------------- 또는 ---------------------</div>
				<a href="${naver.apiURL}"><img height="45" width="183" style = "margin:7px;" src="<%=request.getContextPath()%>/resources/image/btnG_naver.png"/></a>
	 			<a href='${kakao.apiURL}'><img alt="카카오 로그인" src="<%=request.getContextPath()%>/resources/image/kakao_login_medium_narrow.png"></a>
			</div>
		</main>

	<footer id="footer"></footer> 
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>
