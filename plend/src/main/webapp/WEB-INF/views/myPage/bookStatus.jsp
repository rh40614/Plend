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
	<link href="<%=request.getContextPath()%>/resources/css/bookStatus.css" rel="stylesheet">
	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
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
  		 <li><a href="bookStatus.do?uidx=${login.uidx}" id = "select"><strong>예약 현황</strong></a></li>
 		 <li><a href="heartList.do?uidx=${login.uidx}" id = "select">찜 목록</a></li>
 		 <li><a href="#" id = "select">마이 리뷰</a></li>
 		 <li><a href="withdraw.do?uidx=${login.uidx}" id = "select">회원 탈퇴</a></li>
 		 <br>
	    </ul>
	    </div>
   	</nav>
   	
   	
   <div id = "bookBox">
   	
		<h5><strong>| 예약 현황</strong></h5>
		<br>
		<c:forEach var = "vo" items = "${list}">
		<c:if test = "${vo.approvalYN ne 'Y' }">
		<div id = "bookView">
			<table>
				<tr>
					<th>장소 이름 : </th>
					<td><a href = "bookDetail.do?bidx=${vo.bidx }"><strong>${vo.title }</strong></a></td>
				</tr>
				<tr>
					<th>이용 날짜 :</th>
					<td>${vo.useTime }</td>
				</tr>
				<tr>
					<th>이용 인원 : </th>
					<td>${vo.cntPeople }명</td>
				</tr>
				<tr>
					<th>금액 : </th>
					<td><fmt:formatNumber value="${vo.price }" type="currency"/>원</td>
				</tr>
				<tr>
					<th>업체 승인 여부 : </th>
					<td>${vo.approvalYN }</td>
				</tr>
			</table>
		</div>
		</c:if>
		</c:forEach>
		<br>
		<hr style = "height:2px;background:black;">
		<h5><strong>| 이용 리스트</strong></h5>
		<br>
		<c:forEach var = "vo" items = "${list2}">
		<c:if test = "${vo.approvalYN ne 'N' }">
		<div id = "bookView">
			<table>
				<tr>
					<th>장소 이름 : </th>
					<td>${vo.title }</td>
				</tr>
				<tr>
					<th>이용 날짜 :</th>
					<td>${vo.useTime }</td>
				</tr>
				<tr>
					<th>이용 인원 : </th>
					<td>${vo.cntPeople }명</td>
				</tr>
				<tr>
					<th>금액 : </th>
					<td><fmt:formatNumber value="${vo.price }" type="currency"/>원</td>
				</tr>
				<tr>
					<th>업체 승인 여부 : </th>
					<td>${vo.approvalYN }</td>
				</tr>
			</table>
			</div>
			<br>
		</c:if>
		</c:forEach>
		<br>
		<c:if test="${not empty list2}">
			<nav id="pagenation" class="row">
			  <ul class="pagination justify-content-center">
			  	<c:if test="${pagenation.startPage > 5}">
				    <li class="page-item">
				      <a class="page-link" href="bookStatus.do?nowPage=4">&laquo;</a>
				    </li>
			  	</c:if>
			  	<c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="p">
					<c:choose>
						<c:when test="${p == pagenation.nowPage }">
							<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="bookStatusdo?nowPage=${p}">${p}</a></li>
						</c:when>
						<c:when test="${p != pagenation.nowPage }">
							<li class="page-item"><a class="page-link" href="bookStatus.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			    <c:if test="${pagenation.endPage != pagenation.lastPage}">
				    <li class="page-item">
				      <a class="page-link" href="bookStatus.do?nowPage=${pagenation.endPage +1}">&raquo;</a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</c:if>
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




