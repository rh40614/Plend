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
	<link href="resources/css/serchPwd.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(function(){
			$("#header").load("../resources/article/header.jsp");
			$("#footer").load("../resources/article/footer.jsp");
		})
	
	function check() {
		var frm = document.frm;
		
		if (frm.name.value == "") {
			alert("가입한 이름를 입력해주세요.");
			return;
		} else if(frm.id.value == "") {
			alert("가입한 아이디를 입력해주세요.");
			return;
		} else if (frm.email.value == "") {
			alert("가입한 이메일를 입력해주세요.");
			return;
		} 
		var name = $("input[name=name]").val();
		var email = $("input[name=email]").val();
		var id = $("input[name=id]").val();
		
		console.log("name = "+name+" email = " +email + " id = " + id);
		
		var sendData = 'name='+name+'&email='+email+'&id='+id;
		console.log(sendData);
		$.ajax({
			url : "searchPwd.do",
			method : "post",
			data : sendData,
			dataType : "text",
			success : function(text) {
				if (text != "") {
					$("#searchedPwd").html("임시 비밀번호를 등록된 이메일로 발송 했습니다. 이메일을 확인해주세요.");
					console.log("text"+text);
				} else if (text == ""){
					$("#searchedPwd").html("등록된 정보가 없습니다.");
				}
			},
			error : function(xhr) {
				alert("에러코드 = " + xhr.status);
			}
		});
		
	}
	</script>

</head>
<body>
	<header id="header"></header>
<main>
	<div style = "text-align:center;height:75%;margin-left:13%;margin-right:13%;background-color:#F2F2F2;">
		<br>
		<br>
		<br>
		<form action = "signPwd.do" method ="post" name = "frm" id = "frm">
		
			<input type = "text" name = "name" placeholder = "이름" class = "textbox"> <br><br>
			<input type = "text" name = "id" placeholder = "아이디" class = "textbox"> <br><br>
			<input type = "email" name = "email" placeholder = "이메일" class = "textbox"> <br><br>
			
 			<input type = "button" onclick = "check();" value = "비밀번호 찾기" id = "searchBtn">
 			<br>
 			<hr style = "margin-left : 300px; margin-right: 300px;">
			<a href = "signIn.do">로그인 하러 가기</a>
		</form>
		<div id = "searchedPwd">
			
		</div>
	</div>
</main>

	<footer id="footer"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>