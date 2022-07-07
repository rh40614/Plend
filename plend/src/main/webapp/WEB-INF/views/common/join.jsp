<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#test1").click(function(){
			$('#birth').css("display","block");
			$('#regnum').css("display", "none");
		});
		$("#test2").click(function(){
			$('#birth').css("display","none");
			$('#regnum').css("display", "block");
	});
	});
	function passOk() {
		var frm = document.frm;
		
		if (frm.password.value != frm.passwordOk.value){
			alert("비밀번호가 일치하지 않습니다.");
			frm.password.focus();
			return;
		}
	}
	
	
	
</script>
<style>
#regnum {
	display : none;
}
</style>
</head>
<body>
	<button id ="test1" >개인</button><button id = "test2">사업자</button> <br>
	<form action = "join.do" method ="post" name = "frm">
		아이디 : <input type = "text" name = "id"> <br>
		비밀번호 : <input type = "password" name = "password"> <br>
		비밀번호 확인 : <input type = "password" name = "passwordOk"> <br>
		이름 : <input type = "text" name = "name"> <br>
		닉네임 : <input type = "text" name = "nickName"> <br>
		성별 : <input type = "radio" name = "gender" value = "M">남 <input type = "radio" name = "gender" value = "F">여 <br>
		주소 : <input type = "text" name = "addr"> <!-- 주소 api -->  <br>	
		핸드폰 번호 : <input type = text name = "userPhone"> <br>
		이메일 : <input type = "email" name = "email"> <br> 	
		
		<div id = "regnum">
			사업자 번호 : <input type = "text" name = "regnum"> <br>
					  <input type = "hidden" value = "2" name = "role">
		</div>
		
		<div id = "birth">
			생일 : <input type = "text" name = "birth"> <br>
				 <input type = "hidden" value = "1" name = "role">
		</div>
 		<input type = "submit" onclick = "passOk();" value = "가입하기">
	</form>
</body>
</html>