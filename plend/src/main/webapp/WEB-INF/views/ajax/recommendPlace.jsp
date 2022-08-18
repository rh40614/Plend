<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>


<c:if test="${list.size() == 0}">
	<div class=" m-auto" style="height: 400px;">	
		<P class="m-auto" style="min-height:300px; display: inline-block; margin: 20px 0px 20px 0px; vertical-align: top; font-size: 20px; color: grey; padding-top: 200px;">
				등록된 장소가 없습니다. 더 많은 장소로 찾아오겠습니다. 
		</P>
	</div>
</c:if>
<c:if test="${list.size() > 0 }">
	<c:forEach var ="c" items="${list}" varStatus="status"> 
	
	<div class="card mb-5 border-0 col-md-4" style="width: 22rem; height: 25rem; margin-right: 40px;">
				<c:choose>
					<c:when test="${c.placeImg == null}">
						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
							<img src="<%=request.getContextPath()%>/img/alternative/noPhoto.png" class="card-img-top" alt="등록된 사진이 없습니다." style="height: 13rem;">
						</a>
					</c:when>
					<c:when test="${c.placeImg != null}">
						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
							<img src="<%=request.getContextPath()%>/imageView.do?originFileName=${c.placeImg}" class="card-img-top" alt="사진 로딩 오류" style="height: 13rem;">
						</a>
					</c:when>
				</c:choose>
		<div class="card-body">
			<c:if test="${c.eventYN == 'Y'}">
				<h5 class="card-title title2-1" ><a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">[특가 진행중] ${c.placeName}</a></h5>
			</c:if>
			<c:if test="${c.eventYN == 'N'}">
				<h5 class="card-title title2-1" ><a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">${c.placeName}</a></h5>
			</c:if>
			<p class="card-text">${c.address}</p>
			<span class="card-text title3"><fmt:formatNumber value="${c.price}" type="currency"/></span><span>원/시간</span>
			<i class="fa-regular fa-star" style="float:right"> ${c.avgRate}</i>
			 <!-- 찜하기 -->
			 <c:choose>
				<c:when test="${c.heart eq '0'}">
					<a class="me-2 ms-2" style="cursor: pointer;"><i onclick="like(this, ${c.pidx})" class="fa-regular fa-heart" style="color: red;"></i></a>
				</c:when>
				<c:when test="${c.heart eq '1'}">
					<a class="me-2 ms-2" style="cursor: pointer;"><i onclick="like(this, ${c.pidx})" class="fa-solid fa-heart" style="color: red;" ></i></a>
				</c:when>
			</c:choose> 
			
			</div>
		</div>
	</c:forEach>
</c:if>
<script>
function newList(){
	
	
	$.ajax({
		url: "recommendPlace.do",
		type: "GET",
		success: function(data){
			$("#recommendPlace").html(data);
		}
	});

}
</script>

