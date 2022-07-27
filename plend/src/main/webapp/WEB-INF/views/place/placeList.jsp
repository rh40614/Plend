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

	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/headerwithCate.jsp");
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
	

</head>

<body>
<div id="wrap">
	<header id="header" style ="background: white; "></header>
	<main style="margin: 5% 19% 10% 19%; flex: 1;">
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
  					<c:when test="${imageList[status.index].originFileName == null}">
  						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
  							<img src="<%=request.getContextPath()%>/imageView.do?originFileName=매실1.PNG" class="card-img-top" alt="등록된 사진이 없습니다." style="height: 13rem;">
  						</a>
  					</c:when>
  					<c:when test="${imageList[status.index].originFileName != null}">
  						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
  							<img src="<%=request.getContextPath()%>/imageView.do?originFileName=${imageList[status.index].originFileName}" class="card-img-top" alt="사진 로딩 오류" style="height: 13rem;">
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
