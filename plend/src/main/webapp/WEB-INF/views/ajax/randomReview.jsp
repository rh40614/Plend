<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<c:if test="${list3.size() == 0}">
	<div class=" m-auto" style="height: 400px;">	
		<P class="title2 m-auto">등록된 리뷰가 없습니다.</P>
	</div>
</c:if>
<c:if test="${list3.size() > 0 }">
	<c:forEach var ="r" items="${list3}" varStatus="status"> 
	
	<div class="card  mb-5 border-0" style="width: 22rem; height: 25rem; margin:20px;">
		<c:choose>
			<c:when test="${r.reviewImg == null}">
				<a href="<%=request.getContextPath()%>/place/view.do?pidx=${r.pidx}#review">
					<img src="<%=request.getContextPath()%>/img/alternative/noPhoto.png" class="card-img-top" alt="등록된 사진이 없습니다." style="height: 13rem;">
				</a>
			</c:when>
			<c:when test="${r.reviewImg != null}">
				<a href="<%=request.getContextPath()%>/place/view.do?pidx=${r.pidx}#review">
					<img src="<%=request.getContextPath()%>/reviewImg.do?realFileName=${r.reviewImg}" class="card-img-top" alt="사진 로딩 오류" style="height: 13rem;">
				</a>
			</c:when>
			
		</c:choose>
		<div class="card-body">
			<h5 class="card-title title2-1" class=""><a href="<%=request.getContextPath()%>/place/view.do?pidx=${r.pidx}#review">${r.placeName}</a></h5>
			<p class="card-text">${r.address}</p>
			<i class="fa-regular fa-star mb-3"  > ${r.rate}</i>
			<p>${r.title}</p>
		</div>
	</div>
	<br> 
	</c:forEach>
</c:if>


