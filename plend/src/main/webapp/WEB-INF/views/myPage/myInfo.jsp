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
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer_mypage.jsp");
		})
	</script>
	<script>
		function pwdChk(){
			var frm = document.frm;
			var birth = $("input[name=birth]").val();
			var phone = $("input[name=userPhone]").val();
			
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
				alert("연락처를 입력해주세요. ex)010-1234-1234");
				return;
			} else if (!/^\d{3}-\d{3,4}-\d{4}$/.test($("input[name='userPhone']").val())) {
				alert("연락처에 하이픈(-)을 포함해서 입력해주세요. ex)010-1234-1234");
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
			} else if (birth.toString().length != 8){
				alert("생년월일을 8자로 입력해주세요. ex) 19940324");
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
   	<div style="display:flex;  min-height: 1000px; flex: 1;">
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
 		 <li><a href="myReviewList.do?uidx=${login.uidx}" id = "select">마이 리뷰</a></li>
 		 <li><a href="withdraw.do?uidx=${login.uidx}" id = "select">회원 탈퇴</a></li>
	    </ul>
	    </div>
   	</nav>  
      	
      	
      	<br>
      	<br>
      	<br>
      	<section class="row px-1" style="margin-left:25%;">
      	<form name = "frm" action = "myInfo.do?uidx=${vo.uidx}" method = "post">
      	<div style = "text-align:center;">
      	<span style = "font-size: 1.25rem;font-weight: 700!important;">내 정보</span>
      	</div>
      	<br>
      	<table class="col table border-top border-dark">
					  <tbody>
					    <tr>
					      <td scope="row" class="align-middle text-center">아이디</td>
					      <td><span style = "font-weight: 700!important;">${vo.id }</span></td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">비밀번호</td>
					      <td> <input type="password" class="form-control" name="password" value = "" required></td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">비밀번호 확인</td>
					      <td> <input type="password" class="form-control" name="pwdCheck" value="" required></td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">닉네임</td>
					      <td><span style = "font-weight: 700!important;">${vo.nickName }</span></td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">연락처</td>
					      <td> <input type="text" class="form-control" name="userPhone" value="${vo.userPhone }" required></td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">이메일</td>
					      <td> <input type="text" class="form-control" name="email" value="${vo.email }" required></td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">생년월일</td>
					      <td> <input type="text" class="form-control" name="birth" value="${vo.birth }" required></td>
					    </tr>
					  </tbody>
				   </table>
				   <button type = "button" id = "regBtn" onclick = "pwdChk();">수정하기</button>
		</form>
		</section>
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



