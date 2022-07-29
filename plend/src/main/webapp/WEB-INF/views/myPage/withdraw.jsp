<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>plend</title>
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/home.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/withdraw.css" rel="stylesheet">
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
	
	<script>
	//비밀번호 확인
	function chk(){
	var password = $("input[type=password]").val();
	var uidx = $("input[type=hidden]").val();
	
	var frm = document.frm;
	
	if (frm.password.value == "") {
		alert("비밀번호를 입력해주세요.");
		return;
	}
	
	var sendData = "password="+password+"&uidx="+uidx;
			$.ajax({
				url : "withdraw.do",
				method : "post",
				data : sendData,
				success : function(text) {
					 if (text == 0){
						alert("비밀번호가 일치하지 않습니다.");
						return;
					} else if (text == 1) {
						$("#pwdCheck").html("정말 탈퇴하시겠습니까?<br><br><button id = 'withdrawBtn2' onclick ='withdraw();' type = 'button'>확인</button> <input type = 'hidden' name= 'uidx' value = '${login.uidx }'>");
					}
				},
				error : function(xhr) {
					alert("에러코드 = "+ xhr.status);
				}
			});
	}
	</script>
	<script>
	//회원 탈퇴
	function withdraw (){
		
		var uidx = "uidx="+${login.uidx};
		
		$.ajax({
			url : "withdraw2.do",
			method : "post",
			data : uidx,
			success : function(text) {
				 if (text == 0){
						alert("회원 탈퇴에 실패하였습니다. 잠시후 다시 시도해주세요.");
						return;
					} else if (text > 0) {
						$("#pwdCheck").html("탈퇴가 완료되었습니다. 그동안 Plend를 이용해주셔서 감사합니다.<br><br><button type ='button' id = 'withdrawBtn2' onclick ='location.href="+"/controller/"+"'>메인으로 가기</button> ");
					}
			},
			error : function(xhr) {
				alert("에러코드2 = "+ xhr.status);
			}
		});
		
	}
	</script>

</head>

<body>
<div id="wrap">	
	<header id="header" style = "height:0;"></header>
   <br>
   	<div style="display:flex; ">
   	<nav style="display: flex;flex-direction: column;width:11%;margin-top:72px;background: #CFCFCF">
   		<div id = "MyPageBox">
   			<br>
   			<br>
     		<h4>My Page</h4>
    	</div>
    	<div>
 		<ul id = "naviBar">
     	<!-- 나중에 해당링크 들어간 곳 글씨 진하게하는 css 추가하기 -->
 		 <li><a href="myInfo.do?uidx=${login.uidx}" id = "select">내 정보</a></li>
 		 <li><a href="#" id = "select">쿠폰 등록</a></li>
  		 <li><a href="bookStatus.do?uidx=${login.uidx}" id = "select">예약 현황</a></li>
 		 <li><a href="heartList.do?uidx=${login.uidx}" id = "select">찜 목록</a></li>
 		 <li><a href="#" id = "select">마이 리뷰</a></li>
 		 <li><a href="withdraw.do?uidx=${login.uidx}" id = "select"><strong>회원 탈퇴</strong></a></li>
 		 <br>
	    </ul>
	    </div>
   	</nav>  	
   	
   <div id = "withdrawBox">
   	<br>
   	<br>
		<h2>회원 탈퇴</h2>
		<br>
		<hr>
		<br>
		<form action = "withdraw.do" method = "post" name = "frm">
			<div id = "pwdCheck">
			<input type = "hidden" name= "uidx" value = "${login.uidx }">
				비밀번호를 다시 한번 입력해주세요.
				<br>
				<br>
				<input type = "password" name = "password" id = "pwdBox">
				<br>
				<br>
				<button id = "withdrawBtn" type="button" onclick = "chk();">확인</button>
			</div>
		</form>
		<br>
		<br>
   </div>
   </div>
   </div>
<div style="margin-top: -48px;">
<footer id="footer" class="mt-5" style = "float:none;display:inline-block;"></footer>
</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>




