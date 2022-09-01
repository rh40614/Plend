<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${hashList.size() == 0}">
	<P class="m-auto" style="min-height:300px; display: inline-block; margin: 20px 0px 20px 0px; vertical-align: top; font-size: 20px; color: grey; padding-top: 200px;">
		등록된 장소가 없습니다. 더 많은 장소로 찾아오겠습니다. 
	</P>
</c:if>
<c:if test="${hashList.size() > 0 }">
	<!-- 슬릭 슬라이더 -->
	<div style=" background-color: white;">
	  	<div id="slider-div" style="display: flex;">
			<c:forEach var ="c" items="${hashList}" varStatus="status">
				<div class="card border-0 mb-5 me-5" style="width: 22rem; height: 25rem; margin-right: 35px;  display: flex; flex-direction: column;">
					<c:choose>
						<c:when test="${c.placeImg == null}">
							<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
								<img src="<%=request.getContextPath()%>/img/alternative/noPhoto.png" class="card-img-top" alt="등록된 사진이 없습니다." style="height: 13rem; width:20rem;">
							</a>
						</c:when>
						<c:otherwise >
							<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
								<img src="<%=request.getContextPath()%>/imageView.do?realFileName=${c.placeImg}" class="card-img-top" alt="사진 로딩 오류" style="height: 13rem; width:20rem;">
							</a>
						</c:otherwise>
						
					</c:choose>
					<div class="card-body" >
						<h5 class="card-title title2-1" ><a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">${c.placeName}</a></h5>
						<p class="card-text">${c.address}</p>
						<span class="card-text title3"><fmt:formatNumber value="${c.price}" pattern="#,###"/></span><span>  원/시간</span>
						<i class="fa-regular fa-star" style="float:right;margin-top: 7px;"> ${c.avgRate}</i>
						<!-- 찜하기 -->
					 <c:choose>
						<c:when test="${c.heart eq '0'}">
							<a class="me-2 ms-2" style="cursor: pointer;">
								<i onclick="like(this, ${c.pidx})" class="fa-regular fa-heart" style="color: red;"></i>
								<span class="cntHeartOff${c.pidx}" style="color:red"> ${c.cntHeart}</span>
							</a>
						</c:when>
						<c:when test="${c.heart eq '1'}">
							<a class="me-2 ms-2" style="cursor: pointer;">
								<i onclick="like(this, ${c.pidx})" class="fa-solid fa-heart" style="color: red;" ></i>
								<span class="cntHeartOn${c.pidx}" style="color:red"> ${c.cntHeart}</span>
							</a>
						</c:when>
					</c:choose> 
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>
<!-- 슬릭슬라이더 -->
<script>
	if(${hashList.size() > 3} == true){
		$('#slider-div').slick({
			  slidesToShow: 3,
			  slidesToScroll: 1,
			  autoplay: true,
			  autoplaySpeed: 2000,
			  prevArrow : "<button type='button' class='slick-prev' style='border:none; background: white; padding: 0px 40px 130px 40px'><i class='fa-solid fa-angle-left' style='font-size:40px; '></i></button>",		// 이전 화살표 모양 설정
			  nextArrow : "<button type='button' class='slick-next' style='border:none; background: white; padding: 0px 40px 130px 40px'><i class='fa-solid fa-angle-right' style='font-size:40px; '></i></button>",		// 다음 화살표 모양 설정
			});
	}else{
		$('#slider-div').css("margin-left","80px");
	}

</script>
