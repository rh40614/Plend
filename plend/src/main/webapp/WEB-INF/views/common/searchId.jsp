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
	<link href="<%=request.getContextPath() %>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/resources/css/signUp.css" rel="stylesheet">
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("../resources/article/footer.jsp");
		})
	
	function check() {
		var frm = document.frm;
		
		if (frm.name.value == "") {
			alert("가입한 이름를 입력해주세요.");
			return;
		} else if (frm.email.value == "") {
			alert("가입한 이메일를 입력해주세요.");
			return;
		} 
		var name = $("input[name=name]").val();
		var email = $("input[name=email]").val();
		
		console.log("name = "+name+" email = " +email);
		
		var sendData = "name="+name+"&email="+email;
		
		$.ajax({
			url : "searchId.do",
			method : "post",
			data : sendData,
			dataType : "text",
			success : function(text) {
				if (text != "") {
					$("#searchedId").html("<h2>등록된 아이디는  " + text +" 입니다.</h2>");
					console.log(text);
				} else if (text == ""){
					$("#searchedId").html("등록된 정보가 없습니다.");
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
<main style="flex: 1; margin: 0px 20% 20% 20%; display: flex; flex-direction: column; align-items: center;">
	<div class="searchBoxB">
	<p  class="mb-2 mt-5" style="font-size: 24px;font-weight:bold; ">아이디 찾기</p>
		<form class="mt-2" action = "signIn.do" method ="post" name = "frm" id = "frm">
			<input type = "text" name = "name" placeholder = "이름" >
			<input type = "email" name = "email" placeholder = "이메일">
 			<input type = "button" onclick = "check();" value = "아이디 찾기" id = "searchBtn">
 			<div style="height: 1px; width: 300px; background-color: lightgrey; margin-bottom: 20px;"></div>
			<a href = "signIn.do">로그인 하러 가기</a>
		</form>
		<div id = "searchedId">
		</div>
	</div>
</main>

	<footer id="footer"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>