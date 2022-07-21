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
	
	function like (obj){
		if($(obj).hasClass("fa-regular") == true){
			$(obj).removeClass("fa-regular");
			$(obj).addClass("fa-solid");
		}else{
			$(obj).removeClass("fa-solid");
			$(obj).addClass("fa-regular");
		}
		
	}
	
	</script>
	
</head>

<body>
<div id="wrap">	
	<header id="header" style = "height:0;"></header>
	<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-black sidebar collapse">
     	<ul>
     	<br>
     	<div id = "MyPageBox">
     		<h4>My Page</h4>
     	</div>
     	<br>
     	<!-- 나중에 해당링크 들어간 곳 글씨 진하게하는 css 추가하기 -->
 		 <li><a href="myInfo.do?uidx=${login.uidx}"><strong>내 정보</strong></a></li>
 		 <li><a href="#">쿠폰 등록</a></li>
  		 <li><a href="bookStatus.do">예약 현황</a></li>
 		 <li><a href="#">찜 목록</a></li>
 		 <li><a href="#">마이 리뷰</a></li>
 		 <li><a href="#">회원 탈퇴</a></li>
 		 <br>
 		 <br>
 		 <br>
 		 <br>
 		 <br>
 		 <br>
 		 <br>
	    </ul>
      </div>
    </nav>
   </div>
   <div id = "infoBox">
   	<br>
		<h4>내 정보</h4>
		<hr>
		<br>
		<br>
		<form name = "frm" action = "myInfo.do?uidx=${vo.uidx}" method = "post">
			<table>
				<tr>
					<th>아이디</th>
					<td colspan = "3">${vo.id }</td>
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
					<th>주소</th>
					<td colspan = "3"><input type = "text" name = "addr" value = "${vo.addr }" id = "infoText" required></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td colspan = "3"><input type = "text" name = "birth" id = "infoText" value = "${vo.birth }" required></td>
				</tr>
			</table>
			<br>
			<button id = "regBtn" >수정하기</button>
		</form>
		<br>
		<br>
   </div>
<div>
<footer id="footer" class="mt-5" style = "position:fixed;bottom:0;"></footer>
</div>
</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>



