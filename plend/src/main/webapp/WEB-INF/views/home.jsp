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
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<link href="resources/css/global.css" rel="stylesheet">
	<link href="resources/css/home.css" rel="stylesheet">

	<script type="text/javascript">
		$(function(){
			$("#header").load("resources/article/headerwithCate.jsp");
			$("#footer").load("resources/article/footer.jsp");
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
	<header id="header"></header>
	<br>

	<main style="margin: 5% 19% 10% 19%; flex: 1;">
	<br>

	<!-- 
	07.28 김하진 role 별로 로그인을 하고 navi바에서 들어가시길 바랍니다. 
	불편하시면 따로 링크를 빼셔도 됩니다. 
	 -->
	<a href="host/managePlace.do">장소등록 </a>
	<button type="button" onclick="check();">마이페이지</button>
    <a href="developer/userList.do">유저리스트 </a>
    <a href="test.do">테스트 </a>

  	<div>
    	<span class="navbar-brand title1">| 추천 장소 </span>
  	</div>
	<section class=" d-flex, flex-row  flex-start flex-wrap justify-content-between align-items-start ">
		<c:if test="${list.size() == 0}">
			<div class=" m-auto" style="height: 400px;">	
				<P class="title2 m-auto">등록된 장소가 없습니다. 더 많은 장소로 찾아오겠습니다. </P>
			</div>
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


<hr>

	<br>
	<div>
    	<h3 class="navbar-brand title1" >| 이벤트</h3>
  	</div>
  		<section class=" d-flex, flex-row  flex-start flex-wrap justify-content-between align-items-start ">
		<c:if test="${list2.size() == 0}">
			<div class=" m-auto" style="height: 400px;">	
				<P class="title2 m-auto">등록된 장소가 없습니다. 더 많은 장소로 찾아오겠습니다. </P>
			</div>
		</c:if>
		<c:if test="${list2.size() > 0 }">
			<c:forEach var ="e" items="${list2}" varStatus="status"> 
			
			<div class="card  mb-5" style="width: 22rem; height: 25rem">
  				<c:choose>
  					<c:when test="${e.placeImg == null}">
  						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${e.pidx}">
  							<img src="<%=request.getContextPath()%>/imageView.do?originFileName=매실1.PNG" class="card-img-top" alt="등록된 사진이 없습니다." style="height: 13rem;">
  						</a>
  					</c:when>
  					<c:when test="${e.placeImg != null}">
  						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${e.pidx}">
  							<img src="<%=request.getContextPath()%>/imageView.do?originFileName=${e.placeImg}" class="card-img-top" alt="사진 로딩 오류" style="height: 13rem;">
  						</a>
  					</c:when>
  				</c:choose>
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title title2-1" class=""><a href="<%=request.getContextPath()%>/place/view.do?pidx=${e.pidx}">${e.placeName}</a></h5>
 				<p class="card-text">${e.address}</p>
 				<span class="card-text title3">${e.price}</span><span>원/시간</span>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>
  			</div>
			</div>
			
			</c:forEach>
		</c:if>
	</section>






	<br>
	<div class="container" style="width: 1100px;">
    	<h3 class="navbar-brand">| 리뷰존</h3>
  	</div>
  		<section>
		<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>

  			</div>
		</div>

		<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>

  			</div>
		</div>

	<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>

  			</div>
		</div>

	<div class="card " style="width: 16rem; margin-right: 10px;">
  				<img  src="<%=request.getContextPath()%>/resources/image/place/placeImg.png" class="card-img-top" alt="...">
  				<i class="fa-solid fa-bolt bolt"></i>
 			<div class="card-body">
 				<h5 class="card-title"><a href="#" class="">장소이름</a></h5>
 				<p class="card-text">장소위치</p>
 				<p class="card-text">가격</p>
 				<i class="fa-regular fa-star" style="float:right">별점</i>
 				<i class="fa-regular fa-heart" onclick="like(this)"  style="color: red;"></i>

  			</div>
		</div>
	</section>





</main>


<footer id="footer" class="mt-5"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>
