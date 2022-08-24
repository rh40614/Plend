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
	<link href="<%=request.getContextPath()%>/resources/css/heartList.css" rel="stylesheet">
	
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
   	<div style="display:flex; flex:1; ">
   	<nav style="display: flex;flex-direction: column;width:11%;margin-top:3%;background: #CFCFCF">
   		<div id = "MyPageBox">
   			<br>
   			<br>
     		<h4 style = "margin-top:20px;">My Page</h4>
    	</div>
    	<div>
 		<ul id = "naviBar">
     	<!-- 나중에 해당링크 들어간 곳 글씨 진하게하는 css 추가하기 -->
 		 <li><a href="myInfo.do?uidx=${login.uidx}" id = "select">내 정보</a></li>
 		 <li><a href="#" onclick = "alert('서비스 준비중 입니다.');" id = "select">쿠폰 등록</a></li>
  		 <li><a href="bookStatus.do?uidx=${login.uidx}" id = "select">예약 현황</a></li>
 		 <li><a href="heartList.do?uidx=${login.uidx}" id = "select"><strong>찜 목록</strong></a></li>
 		 <li><a href="myReviewList.do?uidx=${login.uidx}" id = "select">마이 리뷰</a></li>
 		 <li><a href="withdraw.do?uidx=${login.uidx}" id = "select">회원 탈퇴</a></li>
 		 <br>
	    </ul>
	    </div>
   	</nav>  	
   	
   <div id = "infoBox" style="flex:1;">
   	<br>
		<h5><strong>찜 목록</strong></h5>
		<section>
		<c:if test="${list.size() == 0}">
			<div class=" m-auto" style="height: 400px;">	
				<P class="title2 m-auto">찜한 장소가 없습니다. </P>
			</div>
		</c:if>
		<c:if test="${list.size() > 0 }">
			<c:forEach var ="e" items="${list}" varStatus="status"> 
				<div class="card " style="width: 16rem; margin-right: 20px;margin-top:20px;">
					<!-- imageView 아주 잘 썼습니다. -->
	  				<img  src="<%=request.getContextPath()%>/imageView.do?originFileName=${e.placeImg}" class="card-img-top" alt="..." style = "height:13rem;">
	 			<div class="card-body">
	 				<h5 class="card-title"><a href="<%=request.getContextPath()%>/place/view.do?pidx=${e.pidx}" class="">${e.placeName}</a></h5>
	 				<p class="card-text">${e.address}</p>
	 				<p class="card-text"><fmt:formatNumber value="${e.price}" pattern="#,###"/>원</p>
	 				<i class="fa-regular fa-star" style="float:right">${e.avgRate}</i>
	 				<!-- 찜하기 -->
			 <c:choose>
				<c:when test="${e.heart eq '0'}">
					<a class="me-2 ms-2" style="cursor: pointer;"><i onclick="like(this, ${e.pidx})" class="fa-regular fa-heart" style="color: red;"></i></a>
				</c:when>
				<c:when test="${e.heart eq '1'}">
					<a class="me-2 ms-2" style="cursor: pointer;"><i onclick="like(this, ${e.pidx})" class="fa-solid fa-heart" style="color: red;" ></i></a>
				</c:when>
			</c:choose> 
	
	  			</div>
			</div>
			</c:forEach>
		</c:if>
		
		</section>
		<br>
		<br>
  <c:if test="${not empty list}">
			<nav id="pagenation" class="row">
			  <ul class="pagination justify-content-center">
			  	<c:if test="${pagenation.startPage > 5}">
				    <li class="page-item">
				      <a class="page-link" href="heartList.do?nowPage=4">&laquo;</a>
				    </li>
			  	</c:if>
			  	<c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="p">
					<c:choose>
						<c:when test="${p == pagenation.nowPage }">
							<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="heartList.do?nowPage=${p}">${p}</a></li>
						</c:when>
						<c:when test="${p != pagenation.nowPage }">
							<li class="page-item"><a class="page-link" href="heartList.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			    <c:if test="${pagenation.endPage != pagenation.lastPage}">
				    <li class="page-item">
				      <a class="page-link" href="heartList.do?nowPage=${pagenation.endPage +1}">&raquo;</a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</c:if>
		
   </div>
	   <!-- 08.17 김연희: go UP -->
		<div class="footer_text goUP" >
		   	<p class="float-end mb-1">
		   	 	<button onclick="location.href='#'" style="border: none; background-color:transparent; ">
		   	 			<img alt="" src="<%=request.getContextPath()%>/img/up.png" style=" width:50px; ">
		   	 	</button>
		   	</p>
		</div>
   </div>
   </div>
<div style="margin-top: -48px;">
<footer id="footer" class="mt-5" style = "float:none;display:inline-block;"></footer>
</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

		function like (obj, idx){
	
			if(${login ne null}){
				if($(obj).hasClass("fa-regular") == true){
					$.ajax({
						url: "<%=request.getContextPath()%>/myPage/heart.do?pidx="+idx+"&like=add",
						success: function(data){
							console.log(data);
							if(data == 1){
								$(obj).removeClass("fa-regular");
								$(obj).addClass("fa-solid");
								alert("찜목록에 등록되었습니다.");
							}else{
								alert("찜목록 등록에 실패했습니다.");
							}
						},
						error: function(){
							alert("찜목록 등록에 실패했습니다.");
						}
					});
	
				}else{
					$.ajax({
						url: "<%=request.getContextPath()%>/myPage/heart.do?pidx="+idx+"&like=delete",
						success: function(data){
							if(data == 1){
								$(obj).removeClass("fa-solid");
								$(obj).addClass("fa-regular");
								alert("찜목록에서 삭제했습니다.");
							}else{
								alert("찜목록 삭제에 실패했습니다.");
							}
						},
						error: function(){ 
							alert("찜목록 삭제에 실패했습니다.");
						}
					});
				}
			}else{
				alert("로그인을 해주세요.");
			}
		}

	</script>
</body>
</html>




