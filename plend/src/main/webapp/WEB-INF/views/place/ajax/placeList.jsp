<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

	<section class=" d-flex, flex-row  flex-start flex-wrap justify-content-between align-items-start ">
	<c:if test="${list.size() == 0}">
		<P class="title2 m-auto">해당하는 장소가 없습니다. 더 많은 장소로 찾아오겠습니다. </P>
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

