<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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
		console.log("access_token: "+ '${access_token}');
		console.log("snsId: "+ '${snsId.id}');
		console.log("userProfile: "+ '${userProfile.gender}');
	</script>
</head>
<body>
<!-- modal -->
<div class="signUpModal">
	<div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header justify-content-center">
	        <h5 class="modal-title" id="signUpModalLabel">정보가 없는 회원입니다.</h5> <br>
	      </div>
	      <div class="modal-body">
	        <h6>추가 정보를 입력하고 회원가입 하시겠습니까?</h6>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" onclick="location.href='cancelSnsSignUp.do?access_token=${access_token}'">취소</button>
	        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<div id="wrap">
	<header id="header"></header>
		<!-- 08.10 김연희 : flex 1 으로 하단 고정 -->
		<main style="flex: 1; margin: 50px 20% 20% 20%; display: flex; flex-direction: column; align-items: center;">
			<br>
			<div class="loginBox">
			<p  class="mb-4 mt-5 loginLetter">추가 사항</p>
				<form action = "signUp.do" method ="post">
					<input type="hidden" name="user_type" value="${user_type}">
					<input type="hidden" name="role" value="2">
					<input type="hidden" name="${user_type}_id" value="${snsId.id}">
					<input type = "text" name = "name" placeholder = "이름" class = "textbox" value="${userProfile.name}"><br>
					<input type = "text" name = "nickName" placeholder = "닉네임" class = "textbox" value="${userProfile.nickname}"><br>
					<input type = "email" name = "email" placeholder = "이메일" class = "textbox" value="${userProfile.email}"><br>
					<input type = "text" name = "userPhone" placeholder = "핸드폰 번호" class = "textbox" value="${userProfile.mobile}"><br>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="M">
					  <label class="form-check-label" for="inlineRadio1">남</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="F">
					  <label class="form-check-label" for="inlineRadio2">여</label>
					</div>
		 			<button id = "signBtn">회원가입</button>
				</form>
			</div>
		</main>

	<footer id="footer"></footer> 
</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 가입할건지 확인 모달 -->
<script type="text/javascript">
const myModal = new bootstrap.Modal('#signUpModal', {
	backdrop: 'static'
});
myModal.show();
</script>
<!-- value값 있는 input에 값 넣어주기/ 값 있으면 히든으로 없는 값만 입력받기 -->
<script type="text/javascript">
	$(function(){
		$("form>input[type!='radio']").each(function(i){
			if($(this).val() != ""){
				$(this).prop("type","hidden");
			}
		});
	});
</script>
</body>
</html>
