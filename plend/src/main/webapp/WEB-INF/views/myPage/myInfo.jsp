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
	<link href="<%=request.getContextPath()%>/resources/css/myInfo.css" rel="stylesheet">
	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
	<script>
		function pwdChk(){
			var frm = document.frm;
			
			if (frm.password.value == "") {
				alert("비밀번호를 입력해주세요.");
				return;
			} else if (frm.pwdCheck.value == "") {
				alert("비밀번호 확인을 입력해주세요.");
				return;
			} else if (frm.password.value != frm.pwdCheck.value) {
				alert("비밀번호가 일치하지 않습니다.");
				return;
			} else if (frm.userPhone.value == "") {
				alert("연락처를 입력해주세요. ex)010-7777-7777");
				return;
			} else if (frm.email.value == "") {
				alert("이메일을 입력해주세요.");
				return;
			} else if (frm.birth.value == "") {
				alert("생년월일을 입력해주세요. ex) 19940324");
				return;
			} else if (isNaN(frm.birth.value) == true) {
				alert("생년월일은 숫자만 입력해주세요.");
				return;
			} else {
				frm.submit();
			}
		}
	</script>
</head>

<body>
<div id="wrap">	
	<header id="header" style = "height:0;"></header>
   <br>
   	<div style="display:flex; ">
   	<nav style="display: flex;flex-direction: column;width:11%;margin-top:48px;background: #CFCFCF">
   		<div id = "MyPageBox">
   			<br>
   			<br>
     		<h4>My Page</h4>
    	</div>
    	<div>
 		<ul id = "naviBar">
     	<!-- 나중에 해당링크 들어간 곳 글씨 진하게하는 css 추가하기 -->
 		 <li><a href="myInfo.do?uidx=${login.uidx}" id = "select"><strong>내 정보</strong></a></li>
 		 <li><a href="#" id = "select">쿠폰 등록</a></li>
  		 <li><a href="bookStatus.do?uidx=${login.uidx}" id = "select">예약 현황</a></li>
 		 <li><a href="heartList.do?uidx=${login.uidx}" id = "select">찜 목록</a></li>
 		 <li><a href="#" id = "select">마이 리뷰</a></li>
 		 <li><a href="withdraw.do?uidx=${login.uidx}" id = "select">회원 탈퇴</a></li>
 		 <br>
	    </ul>
	    </div>
   	</nav>  	
   	
   <div id = "infoBox">
   	<br>
		<h4>내 정보</h4>
		<hr>
		<br>
		<form name = "frm" action = "myInfo.do?uidx=${vo.uidx}" method = "post">
			<table>
				<tr>
					<th>아이디</th>
					<td colspan = "3">${vo.id }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan = "3"><input type = "password" name = "password" value = "" id = "infoText"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td colspan = "3"><input type = "password" name = "pwdCheck" value = "" id = "infoText"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td colspan = "3">${vo.nickName }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan = "3"><input type = "text" name = "userPhone" value = "${vo.userPhone }" id = "infoText" required></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan = "3"><input type = "email" name = "email" value = "${vo.email }" id = "infoText" required></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td colspan = "3"><input type = "text" name = "birth" id = "infoText" value = "${vo.birth }" required></td>
				</tr>
			</table>
			<br>
			<button type = "button" id = "regBtn" onclick = "pwdChk();">수정하기</button>
		</form>
		<br>
		<br>
   </div>
   </div>
   </div>
<div style="margin-top: -48px;">
<footer id="footer" class="mt-5" style = "float:none;display:inline-block;"></footer>
</div>
</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>




