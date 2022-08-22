<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${hashList.size() == 0}">
	<P class="m-auto" style="min-height:300px; display: inline-block; margin: 20px 0px 20px 0px; vertical-align: top; font-size: 20px; color: grey; padding-top: 200px;">
		등록된 장소가 없습니다. 더 많은 장소로 찾아오겠습니다. 
	</P>
</c:if>
<c:if test="${hashList.size() > 0 }">
	<!-- 슬릭 슬라이더 -->
	<div style="padding:300px 100px; background-color: white;">
	  	<div id="slider-div" style="display: flex;">
			<c:forEach var ="c" items="${hashList}" varStatus="status">
				<div class="card border-0 mb-5 me-5" style="width: 22rem; height: 25rem; margin-right: 35px;  display: flex; flex-direction: column;">
					<c:choose>
						<c:when test="${c.placeImg == null}">
							<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
								<img src="<%=request.getContextPath()%>/imageView.do?originFileName=매실1.PNG" class="card-img-top" alt="등록된 사진이 없습니다." style="height: 13rem; width:22rem;">
							</a>
						</c:when>
						<c:otherwise >
							<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
								<img src="<%=request.getContextPath()%>/imageView.do?originFileName=${c.placeImg}" class="card-img-top" alt="사진 로딩 오류" style="height: 13rem; width:22rem;">
							</a>
						</c:otherwise>
						
					</c:choose>
					<div class="card-body" >
						<h5 class="card-title title2-1" ><a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">${c.placeName}</a></h5>
						<p class="card-text">${c.address}</p>
						<span class="card-text title3">${c.price}</span><span>원/시간</span>
						<i class="fa-regular fa-star" style="float:right"> ${c.avgRate}</i>
						<!-- 찜하기 -->
					 <c:choose>
						<c:when test="${c.heart eq '0'}">
							<a class="me-2 ms-2" style="cursor: pointer;"><i onclick="like(this, ${c.pidx})" class="fa-regular fa-heart" style="color: red;"> ${c.cntHeart}</i></a>
						</c:when>
						<c:when test="${c.heart eq '1'}">
							<a class="me-2 ms-2" style="cursor: pointer;"><i onclick="like(this, ${c.pidx})" class="fa-solid fa-heart" style="color: red;" > ${c.cntHeart}</i></a>
						</c:when>
					</c:choose> 
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>
<script>
$('#slider-div').slick({
	  slidesToShow: 3,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 2000,
	  prevArrow : "<button type='button' class='slick-prev' style='border:none; background: white;'><i class='fa-solid fa-angle-left' style='font-size:40px; '></i></button>",		// 이전 화살표 모양 설정
	  nextArrow : "<button type='button' class='slick-next' style='border:none; background: white;'><i class='fa-solid fa-angle-right' style='font-size:40px; '></i></button>",		// 다음 화살표 모양 설정
	});
			

</script>
