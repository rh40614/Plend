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
	$(function(){
			$("#header").load("../resources/article/header.jsp");
			$("#footer").load("../resources/article/footer.jsp");
		})
		
	function check() {
		var frm = document.frm;
		
		if (frm.id.value == "") {
			alert("아이디를 입력해주세요.");
			return;
		} else if (frm.password.value == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		} else {
			frm.submit();
		}
		
	}
	</script>
</head>
<body>
	<header id="header"></header>
<main>
	<div style = "text-align:center;height:75%;margin-left:13%;margin-right:13%;background-color:#F2F2F2;"><br>
		<div class="g-signin2" data-onsuccess="onSignIn" style = "display: flex; flex-direction: row-reverse;flex-wrap: nowrap;align-content: center;justify-content: center; margin:7px;"></div>
		<a href="${navervo.apiURL }"><img height="50" style = "margin:7px;" src="../resources/image/naverLogin.png"/></a> <br>
		<button type="button" style = "margin:7px;" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=ab7da9e9cfc38c18cc1cac5e5ddc71f0&redirect_uri=http://localhost:8090/controller/common/kakaoLogin&response_type=code'"><img alt="카카오 로그인" src="<%=request.getContextPath()%>/resources/image/kakao_login_medium_narrow.png"></button><br>	<div class="hr-sect">또는</div>
		<br>
		<form action = "signIn.do" method ="post" name = "frm" id = "frm">
		
			<input type = "text" name = "id" placeholder = "아이디" class = "textbox"><br><br>
			<input type = "password" name = "password" placeholder = "비밀번호" class = "textbox"> <br><br>
			
			<div style = "margin-right:410px;">
				<input type = "checkbox"> 아이디 기억하기 <br><br>
			</div>
			
 			<input type = "button" onclick = "check();" value = "로그인" id = "signBtn">
 			<br>
 			<hr style = "margin-left : 280px; margin-right: 280px;">
 			<a href = "searchId.do">아이디 찾기</a> | <a href = "searchPwd.do">비밀번호 찾기</a> <br>
			<a href = "signUp.do">회원가입</a>
 			
		</form>
	</div>
</main>
<script>
$(document).ready(function(){
	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#id").val(key); 
     
    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    if($("#id").val() != ""){ 
        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
// 쿠키 저장하기 
// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value)
			+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}
// 쿠키 삭제
function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires="
			+ expireDate.toGMTString();
}
 
// 쿠키 가져오기
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if (start != -1) { // 쿠키가 존재하면
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
			end = cookieData.length;
            console.log("end위치  : " + end);
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}
</script>
	<footer id="footer"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>