<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<c:if test="${list2.size() == 0}">
	<div class=" m-auto" style="height: 400px;">	
		<P class="title2 m-auto">등록된 장소가 없습니다. 더 많은 장소로 찾아오겠습니다. </P>
	</div>
</c:if>
<c:if test="${list2.size() > 0 }">
	<c:forEach var ="e" items="${list2}" varStatus="status"> 
	
	<div class="card  mb-5 border-0" style="width: 22rem; height: 25rem">
				<c:choose>
					<c:when test="${e.placeImg == null}">
						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${e.pidx}">
							<img src="<%=request.getContextPath()%>/img/alternative/noPhoto.png" class="card-img-top" alt="등록된 사진이 없습니다." style="height: 13rem;">
						</a>
					</c:when>
					<c:when test="${e.placeImg != null}">
						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${e.pidx}">
							<img src="<%=request.getContextPath()%>/imageView.do?originFileName=${e.placeImg}" class="card-img-top" alt="사진 로딩 오류" style="height: 13rem;">
						</a>
					</c:when>
				</c:choose>
		<div class="card-body">
			<h5 class="card-title title2-1" class=""><a href="<%=request.getContextPath()%>/place/view.do?pidx=${e.pidx}">${e.placeName}</a></h5>
			<p class="card-text">${e.address}</p>
			<span class="card-text title3">${e.price}</span><span>원/시간</span>
			<i class="fa-regular fa-star" style="float:right">${e.avgRate}</i>
			<i class="fa-regular fa-heart" onclick="like(this,${e.pidx})"  style="color: red;"></i>
		</div>
	</div>
	
	</c:forEach>
</c:if>

<script>
	function newEvent(){
		
		$.ajax({
			url: "eventPlace.do",
			type: "GET",
			success: function(data){
				$("#eventPlace").html(data);
			}
		});
	}


</script>


