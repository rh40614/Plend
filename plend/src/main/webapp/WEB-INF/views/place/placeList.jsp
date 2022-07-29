<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<!-- 반응형 viewport  -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
	<title>plend에서 원하는 장소를 찾아보세요</title>
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/home.css" rel="stylesheet">
	<!-- 07.29 김연희 : 플랫피커 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/headerwithCate.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
	<!-- 찜 -->
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
	<!-- 마이페이지 클릭시 세션 값이 있는지 확인 -->
	<script>
	function check(){
		var login = "${login.uidx}";
		if (login == "") {
			alert("로그인이 필요합니다.");
			location.href="<%=request.getContextPath()%>/common/signIn.do";
		} else {
			location.href="<%=request.getContextPath()%>/myPage/myInfo.do?uidx=${login.uidx}";
		}
		
	}
	
	</script>
	
	<!-- 달력 -->
	<script>
	$(function(){
		$(".selector").flatpickr({
			/* 시간은 안쓸거라 삭제 */
			minDate: "today", //과거의 날짜 비활성화
			maxDate: new Date().fp_incr(120), // 지금부터 120일 이내 

		});
	})
	</script>
	<!-- 날짜, 인원, 지역 검색  -->
	<script>
	var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
	var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
	  return new bootstrap.Popover(popoverTriggerEl)
	})
	
	
	</script>
	<!-- 부트 스트랩 팝오버 수정 -->
	<script>
  	$( function () {
    	$( '[data-toggle="popover"]' ).popover()
  	} );
	</script>
</head>

<body>
<div id="wrap">
	<header id="header" style ="background: white; "></header>
	<main style="margin: 5% 19% 10% 19%; flex: 1;">
	
	<!-- 검색 버튼 그룹 -->
	<div  style="margin-top: 25; float: right;" class="d-flex">
		<input class="selector" placeholder="날짜" style="width:100px; text-align: center;">
		
		<button type="button" class="btn btn-secondary" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="bottom" data-bs-content="Bottom popover">
  Popover on bottom
</button>
		<button type="button" class="btn">인원</button>
		<button type="button" class="btn btn-outline-secondary me-2">지역</button>
		<button type="button" class="btn btn-secondary me-2">검색</button>
	</div>
	
	<!-- 카테고리 제목 -->
	<div>
    	<span class="navbar-brand title1">|  ${category.category}</span>
  	</div>
  	
	<section class=" d-flex, flex-row  flex-start flex-wrap justify-content-between align-items-start ">
		<c:if test="${list.size() == 0}">
			<P class="title2 m-auto">등록된 장소가 없습니다. 더 많은 장소로 찾아오겠습니다. </P>
		</c:if>
	
		<c:if test="${list.size() > 0 }">
			<c:forEach var ="c" items="${list}" varStatus="status"> 
			
			<div class="card  mb-5" style="width: 22rem; height: 25rem">
  				<c:choose>
  					<c:when test="${c.placeImg == null}">
  						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
  							<img src="<%=request.getContextPath()%>/imageView.do?originFileName=매실1.PNG" class="card-img-top" alt="등록된 사진이 없습니다." style="height: 13rem;">
  						</a>
  					</c:when>
  					<c:when test="${c.placeImg != null}">
  						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
  							<img src="<%=request.getContextPath()%>/imageView.do?originFileName=${c.placeImg}" class="card-img-top" alt="사진 로딩 오류" style="height: 13rem;">
  						</a>
  					</c:when>
  				</c:choose>
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title title2-1" class=""><a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">${c.placeName}</a></h5>
 				<p class="card-text">${c.address}</p>
 				<span class="card-text title3">${c.price}</span><span>원/시간</span>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
  			</div>
			</div>
			
			</c:forEach>
		</c:if>
	</section>
	


</main>


<footer id="footer" class="mt-5"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>
