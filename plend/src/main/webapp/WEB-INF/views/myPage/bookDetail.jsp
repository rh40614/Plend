<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<link href="<%=request.getContextPath()%>/resources/css/bookDetail.css" rel="stylesheet">
                                                                                                                                   
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
	<script>
	//예약 취소
	function canChk() {
		
		if(confirm("예약을 취소하시겠습니까?")){
			location.href = "bookDetail.do";  
		} else {
			return;
		}
	}
	</script>
</head>

<body>
<div id="wrap">	
	<header id="header" style = "height:0;"></header>
   <br>
   	<div style="display:flex;">
   	<nav style="display: flex;flex-direction: column;width:11%;margin-top:72px;background: #CFCFCF;height:770px;">
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
  		 <li><a href="bookStatus.do?uidx=${login.uidx}" id = "select"><strong>예약 현황</strong></a></li>
 		 <li><a href="#" id = "select">찜 목록</a></li>
 		 <li><a href="#" id = "select">마이 리뷰</a></li>
 		 <li><a href="withdraw.do?uidx=${login.uidx}" id = "select">회원 탈퇴</a></li>
 		 <br>
	    </ul>
	    </div>
   	</nav>
   	
   	
   <div id = "bookBox">
   		   <h5><strong>| 예약 현황</strong></h5>
		<br>
		<table class="table table-striped">
   			<tr>
   				<th>공간 이름</th>
   				<td>${bv.title }</td>
   			</tr>
   			<tr>
   				<th>시간</th>
   				<td>${bv.useTime }</td>
   			</tr>
   			<tr>
   				<th>인원</th>
   				<td>${bv.cntPeople }명</td>
   			</tr>
   			<tr>
   				<th>총 금액</th>
   				<td><fmt:formatNumber value="${bv.price }" type="currency"/>원</td>
   			</tr>
   			<tr>
   				<th>비고(옵션)</th>
   				<td>
   				<c:if test = "${bv.option1 ne ''}">
   				없음
   				</c:if>
   				<c:if test = "${bv.option1 eq ''}">
   				${bv.option1 }
   				</c:if>
   				</td>
   			</tr>
   			<tr>
   				<th>승인 여부</th>
   				<td>${bv.approvalYN }</td>
   			</tr>
   		</table>
   		<br>
   		<div style = "text-align:center;">
	   		<input type = "button" value = "예약정보 변경하기" id = "modiBtn" onclick = "location.href = ''">
	   		<input type = "button" value = "예약 취소하기" id = "canBtn" onclick = "location.href='bookDel.do?bidx=${bv.bidx}'">
   		</div>
   </div>
   </div>
   
<div style="margin-top: -48px;">
<footer id="footer" class="mt-5"></footer>
</div>
</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>




