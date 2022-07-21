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
	<style>
	ul {
	  	float : left;
		list-style-type: none;
		margin-top :95px;
		padding: 0;
		width: 11%;
		background-color: #CFCFCF;
		position: fixed; left : 0;
		overflow: auto;
		padding-bottom:15px;
		}
	
	li a {
		display: block;
		color: white;
		padding: 8px 16px;
		text-decoration: none;
		position : relative;
		margin-top : 20px;
		text-align:center;
		}
	li a:before{
		content: '';
		position: absolute; /*부모 요소에는 position: relative를 주어야 함*/
		background-color: #FF007F;
		height: 50px;
		width: 0; /*초기에 보이지 않도록*/
		bottom: -5px; /*a태그 아래에 위치*/
		transition: 0.7s; /*애니메이션 동작 실행 시간 정의*/
		margin-left:30px;
		left:0;
		z-index : -1;
		}
		
	li a:hover:before{
		width: 84%;
		}
	li a:hover{
		color:white;	
		}
		
	#bookBox{
		margin : 10% 0 0 37%;
		float : right;
		background: #F2F2F2;
		width : 45%;
		height: 100%;
		text-align:center;
	
		}
	table {
		width : 400px;
		margin-left:auto;
		margin-right:auto;
		
		}
	table,tr,td {
		height : 40px;
		text-align: center;
		}
		
	#regBtn {
		margin-right: 13px;
		float:right;
		border-radius:15px;
		border : 1px solid #2F506D;
		background : #2F506D;
		color : white;
		width : 90px;
		height : 30px;
		}
	#regBtn:hover {
		border : 0px;
		background-color:#3FC1C9;
		}
		
	#MyPageBox{
		text-align:center;
		color:white;
		background:#2F506D;
		padding-bottom: 10px;
		padding-top: 10px;
			
		}
	#infoText {
		border : 0;
		background : #D8D8D8;
		width : 250px;
		
		
		}
	
	</style>
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
 		 <li><a href="myInfo.do?uidx=${login.uidx}">내 정보</a></li>
 		 <li><a href="#">쿠폰 등록</a></li>
  		 <li><a href="bookStatus.do?uidx=${login.uidx}"><strong>예약 현황</strong></a></li>
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
   <div id = "bookBox">
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




