<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>plend</title>
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	<!-- include libraries(jQuery, bootstrap) -->
	<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
	<script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/bookStatus.css" rel="stylesheet">
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer_mypage.jsp");
		})
	</script>
</head>

<body>
<div id="wrap">	
	<header id="header" style = "height:0;"></header>
   	<br>
   	<!-- 08.15 김연희 : 푸터하단고정 및 화면 최소 크기 지정 -->
   	<div style="display:flex; flex: 1; min-height: 1000px;">
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
	 		 <li><a href="#" onclick = "alert('서비스 준비중 입니다.');" id = "select">쿠폰 등록</a></li>
	  		 <li><a href="bookStatus.do?uidx=${login.uidx}" id = "select"><strong>예약 현황</strong></a></li>
	 		 <li><a href="heartList.do?uidx=${login.uidx}" id = "select">찜 목록</a></li>
	 		 <li><a href="myReviewList.do?uidx=${login.uidx}" id = "select">마이 리뷰</a></li>
	 		 <li><a href="withdraw.do?uidx=${login.uidx}" id = "select">회원 탈퇴</a></li>
	 		 <br>
		    </ul>
		    </div>
	   	</nav>
   		<div id="reviewTable">
   			<table class="table table-hover caption-top">
   				<caption class="mb-3">
   					<strong style="font-size: 1.25rem; color: black;">| 마이리뷰</strong>
   				</caption>
   				<thead class="table-light text-center">
   					<tr>
   						<th scope="col">글번호</th>
   						<th scope="col">제목</th>
   						<th scope="col">평점</th>
   						<th scope="col">작성일</th>
   					</tr>
   				</thead>
   				<tbody class="text-center">
   					<c:forEach var="myReview" items="${myReviewList}" varStatus="status">
   						<c:if test="${myReview.delYN eq 'N'}">
	   						<tr>
		   						<td scope="row">${myReview.rvidx}</td>
		   						<td><a href="<%=request.getContextPath()%>/place/view.do?pidx=${myReview.pidx}#review">${myReview.title}</a></td>
								<td>${myReview.rate}점</td>	
								<td>${myReview.date.substring(0,10)}</td>	
		   					</tr>
   						</c:if>
   					</c:forEach>
   				</tbody>
   			</table>
	   		<c:if test="${not empty myReviewList}">
				<nav id="pagenation" class="row">
				  <ul class="pagination justify-content-center">
				  	<c:if test="${pagenation.startPage > 5}">
					    <li class="page-item">
					      <a class="page-link" href="myReviewList.do?nowPage=4&uidx=${login.uidx}">&laquo;</a>
					    </li>
				  	</c:if>
				  	<c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="p">
						<c:choose>
							<c:when test="${p == pagenation.nowPage }">
								<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="myReviewList.do?nowPage=${p}&uidx=${login.uidx}">${p}</a></li>
							</c:when>
							<c:when test="${p != pagenation.nowPage }">
								<li class="page-item"><a class="page-link" href="myReviewList.do?nowPage=${p}&uidx=${login.uidx}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				    <c:if test="${pagenation.endPage != pagenation.lastPage}">
					    <li class="page-item">
					      <a class="page-link" href="myReviewList.do?nowPage=${pagenation.endPage +1}&uidx=${login.uidx}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</c:if>
   		</div>
   </div>
<!-- <div style="margin-top: -48px;"> -->
<!-- 08.15 김연희 : 푸터하단 고정 -->
<footer id="footer" class=" " style="float:none;display:inline-block;"></footer>
<!-- </div> -->
</div> 
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>




