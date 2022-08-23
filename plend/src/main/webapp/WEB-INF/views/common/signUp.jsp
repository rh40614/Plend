<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>회원가입</title>
	<!-- 07.07 김영민 헤더,푸터 로드사용 -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id" content="229501873706-7g1g5tqh1jeitmnhmnkft67koof6th6e.apps.googleusercontent.com">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="<%=request.getContextPath() %>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/resources/css/signUp.css" rel="stylesheet">
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("../resources/article/footer.jsp");
		})
		
	$(document).ready(function(){
		$("#user").trigger('click');
	});
	$(function(){
		$("#user").click(function(){
			$('#birth').css("display","block");
			$('#regnum').css("display", "none");
		});
		$("#host").click(function(){
			$('#birth').css("display","none");
			$('#regnum').css("display", "block");
		});
	});
		
	$(function(){
		$("#user").click(function(){
			$("#user").css("background-color","#2F506D");
			$("#host").css("background-color","#CFCFCF");
		});
		$("#host").click(function(){
			$("#host").css("background-color","#2F506D");
			$("#user").css("background-color","#CFCFCF");
		});
	});
		
	$(function(){
		$("#M1").click(function(){
			$("#M1").css("background-color","#2F506D");
			$("#F1").css("background-color","#CFCFCF");
		});
		$("#F1").click(function(){
			$("#F1").css("background-color","#2F506D");
			$("#M1").css("background-color","#CFCFCF");
		});
	});
	
	var idchk = 0;
	$(function() {
		$("#dbchk").click(function(){
			var id = $("input[name=id]").val();
			
			$.ajax({
				async:true,
				url : "idCheck.do",
				method : "post",
				data : id,
				dataType :"json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
						alert("중복된 아이디가 존재합니다.");
						$("input[name=id]").focus();
					} else if(id == "") {
						alert("사용하실 아이디를 입력해주세요.")
						$("input[name=id]").focus();
					} else {
						alert("사용가능한 아이디입니다.");
						$("#dbchk").css("display", "none");
						$("input[name=id]").attr('readonly', true);
						$("input[name=id]").addClass("w300");
						idchk = 0;
					}
				},
				error : function(error){
					alert("error : " + error);
					console.log(JSON.stringify(error));
				}
			});
		});
	});
	
	var nickchk = 0;
	$(function() {
		$("#dbchk2").click(function(){
			var nickName = $("input[name=nickName]").val();
			
			$.ajax({
				async:true,
				url : "nickNameCheck.do",
				method : "post",
				data : nickName,
				dataType :"json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
						alert("중복된 닉네임이 존재합니다.");
						$("input[name=nickName]").focus();
					} else if(nickName == "") {
						alert("사용하실 닉네임을 입력해주세요.")
						$("input[name=id]").focus();
					} else {
						alert("사용가능한 닉네임입니다.");
						$("#dbchk2").css("display", "none");
						$("input[name=nickName]").attr('readonly', true);
						$("input[name=nickName]").addClass("w300");
						nickchk = 0;
					}
				},
				error : function(error){
					alert("error : " + error);
					console.log(JSON.stringify(error));
				}
			});
		});
	});
	
	function check() {
		var frm = document.frm;
		
		if (frm.id.value == "") {
			alert("아이디를 입력해주세요.")
			return;
		} else if (frm.password.value == ""){
			alert("비밀번호를 입력해주세요.")
			return;
		} else if (frm.passwordOk.value == "") {
			alert("비밀번호 확인을 입력해주세요.");
			return;
		} else if (frm.password.value != frm.passwordOk.value) {
			alert("비밀번호가 맞지 않습니다.");
			return;
		} else if (frm.name.value == "") {
			alert("이름을 입력해주세요.");
			return;
		} else if (frm.nickName.value == "") {
			alert("닉네임을 입력해주세요");
			return;
		}  else if (frm.userPhone.value == "") {
			alert("핸드폰 번호를 입력해주세요. ex) 010-1234-1234");
			return;
		} else if (!/^\d{3}-\d{3,4}-\d{4}$/.test($("input[name='userPhone']").val())){
			alert("연락처에 하이픈(-)을 포함해서 입력해주세요. ex)010-1234-1234");
			return;
		} else if (frm.email.value == "") {
			alert("이메일을 입력해주세요.");
			return;
		}  else if (document.querySelector('#regnum').style.display == 'none' && frm.birth.value == "") {
			alert("생년월일을 입력해주세요. ex) 19940324");
			return;
		} else if (document.querySelector('#regnum').style.display == 'none' && birth.toString().length != 8) {
			alert("생년월일을 8자로 입력해주세요. ex) 19940324");
			return;
		} else if (isNaN(frm.birth.value) == true){
			alert("생년월일은 숫자만 입력해주세요. ex) 19990707");
			return;
		}  else if (document.querySelector('#birth').style.display == 'none' && frm.regnum.value == "") {
			alert("사업자 번호를 입력해주세요.");
			return;
		} else if (document.querySelector('#dbchk').style.display != 'none') {
			alert("아이디 중복확인을 해주세요.");
			return;
		} else if (document.querySelector('#dbchk2').style.display != 'none') {
			alert("닉네임 중복확인을 해주세요.");
			return;
		} else if (!frm.essential.checked) {
			alert("필수항목을 체크해주세요.");
			return;
		} else {
			frm.submit();
		}
	}
	
	
	function gender1() {
		var val = $('#M1').val();
		var val2 = $('#hidden').attr('value',val);
	}
	
	function gender2() {
		var val = $('#F1').val();
		var val2 = $('#hidden').attr('value',val);
	}
	
	function role1(){
		$('#regumRole').removeAttr();
		$("input[name=role]").val(2);
	}
	function role2(){
		$('#birthRole').removeAttr();
		$("input[name=role]").val(3);
	}
	
	</script>

</head>
<body>
<div id = "wrap">
	<header id="header"></header>
<main style="flex: 1; margin: 0px 20% 20% 20%; display: flex; flex-direction: column; align-items: center;">
	<div style = "text-align:center;">
	 <br>
	<div class="signUpBox">
		<p  class="mb-2 mt-3" style="font-size: 24px;font-weight:bold; ">회원가입</p>
		<div class="role mt-4 mb-1">
			회원 구분 
			<button id ="user" class = "chkcolor btn btn-l" onclick="role1();" style="width: 100px;">개인</button>
			<button id = "host" class = "chkcolor btn btn-l" onclick="role2();" style="width: 100px;">사업자</button> <br>
		</div>
		<form action = "signUp.do" method ="post" name = "frm" id = "frm" style = "margin-bottom:0px;">
			<div class="identity">
				<input type = "text" name = "id" placeholder = "아이디" id = "chkbox" maxlength='20' class="checkInput"> 
				<button type="button" id="dbchk" class="btn btn-sm">중복확인</button>
			</div>
			<div class="pwd">
				<input type = "password" name = "password" placeholder = "비밀번호" maxlength='20'>
				<input type = "password" name = "passwordOk" placeholder = "비밀번호 확인" maxlength='20'>
				<input type = "text" name = "name" placeholder = "이름" maxlength='8'>
			</div>
			<div class="nick">	
				<input type = "text" name = "nickName" placeholder = "닉네임" id = "chkbox" maxlength='15' class="checkInput"> 
				<button type = "button" id = "dbchk2" class="btn btn-sm">중복확인</button>
			</div>
			<div class="gender mb-1">
				<input type = "hidden" name = "gender" value = "" id ="hidden">
				성별 
				<button type = "button" value = "M" id = "M1" class = "chkcolor btn btn-l" onclick = "gender1();" style="width: 125px;">남</button>
				<button type = "button" value = "F" id = "F1" class = "chkcolor btn btn-l" onclick = "gender2();" style="width: 125px;">여</button>
			</div>
			<input type = text name = "userPhone" placeholder = "핸드폰 번호 ex) 010-1234-1234">
			<input type = "email" name = "email" placeholder = "이메일 ex) plend@naver.com">	
		
			<div id = "birth">
				<input type = "text" name = "birth" placeholder = "생년월일 ex)19990707" id = "birthRole">
			</div>
			<div id = "regnum">
				<input type = "text" name = "regnum" placeholder = "사업자 번호 숫자만 입력" id = "regnumRole">
			</div>
			<div class="detail">
				<details>
					<summary> <input type = "checkbox" name = "terms" id = "essential"> 이용약관(필수)</summary>
					<span id = "sum">동의해주세요.</span>
				</details>
				<details>
					<summary> <input type = "checkbox"> 이용약관(선택)</summary>
					<span id = "sum">필수는 아닙니다.</span>
				</details>
			</div>
			<input type = "hidden" name = "role" value = "">
 			<input type = "button" onclick = "check();" value = "회원가입" id = "joinBtn">
		</form>
		<div class="mb-2" style="color: gray;">--------------------- 또는 ---------------------</div>
		<a href="${naver.apiURL}"><img height="45" width="183" style = "margin:7px;" src="<%=request.getContextPath()%>/resources/image/btnG_naver.png"/></a>
	 	<a href='${kakao.apiURL}'><img alt="카카오 로그인" src="<%=request.getContextPath()%>/resources/image/kakao_login_medium_narrow.png"></a>
	</div>
	</div>
</main>
<script>
/*
 * 페이지가 로드 되면 회원 구분을 개인으로 선택해준다
 * 페이지가 모두 로드 된 후에 실행 되어야 하므로 내가 실행 시키고 싶은 코드보다
 * 스크립트 태그가 아래에 위치해야한다.
 */
$(document).ready(function(){
	$("#user").trigger('click');
});
$(document).ready(function(){
	$("#M1").trigger('click');
});

$('input[name=id]').on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9|a-z|A-Z]/g,"") );});
$('input[name=name]').on("keyup", function() {$(this).val( $(this).val().replace(/[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"") );});
$('input[name=nickName]').on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9|a-z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"") );});
</script>
	<footer id="footer"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>