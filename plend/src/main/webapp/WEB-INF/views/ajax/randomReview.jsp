<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<c:if test="${list3.size() == 0}">
	<div class=" m-auto" style="height: 400px;">	
		<P class="title2 m-auto">등록된 리뷰가 없습니다.</P>
	</div>
</c:if>
<c:if test="${list3.size() > 0 }">
	<c:forEach var ="r" items="${list3}" varStatus="status"> 
	
	<div class="card  mb-5" style="width: 22rem;">
		<c:choose>
			<c:when test="${r.reviewImg == null}">
				<a href="<%=request.getContextPath()%>/place/view.do?pidx=${r.pidx}#review">
					<img src="<%=request.getContextPath()%>/img/alternative/noPhoto.png" class="card-img-top" alt="등록된 사진이 없습니다." style="height: 13rem;">
				</a>
			</c:when>
			<c:when test="${r.reviewImg != null}">
				<a href="<%=request.getContextPath()%>/place/view.do?pidx=${r.pidx}">
					<img src="<%=request.getContextPath()%>/reviewImg.do?originFileName=${r.reviewImg}" class="card-img-top" alt="사진 로딩 오류" style="height: 13rem;">
				</a>
			</c:when>
			
		</c:choose>
		<div class="card-body">
			<h5 class="card-title title2-1" class=""><a href="<%=request.getContextPath()%>/place/view.do?pidx=${r.pidx}#review">${r.placeName}</a></h5>
			<p class="card-text">${r.address}</p>
			<i class="fa-regular fa-star mb-3" > ${r.rate}</i>
			<p>${r.title}</p>
		</div>
	</div>
	<br> 
	</c:forEach>
</c:if>





<script>
$(".shuffle-me").shuffleImages({
   trigger: "imageMouseMove",     // Choose which type of trigger you want here. Available options are "imageMouseMove", "imageHover", "documentMouseMove", and "documentScroll". "imageMouseMove" will trigger when your mouse over the image and move your cursor. "imageHover" will trigger when you mouse over without moving your cursor. "documentMouseMove" will trigger when cursor is being moved anywhere on the page. "documentScroll" will trigger when you scroll the page. The default value is "imageMouseMove"
   triggerTarget: false,          // For "imageMouseMove", and "imageHover" only, you can set which element to trigger the image shuffle when mouse over. For example, if you want a container ".main" to trigger an image shuffle instead of the image itself, put $(".main") for this option. Default value is false.
   mouseMoveTrigger: 50,          // For "imageMouseMove" only, you can set how many pixels you have to move in order to trigger one image shuffle. The lower the faster. The default value is 50.
   hoverTrigger: 200,             // For "imageHover" only, you can set how long you have to hover the image until it shuffles to other images. The option accepts milliseconds without unit. The default value is 200.
   scrollTrigger: 100,          // For "documentScroll" only, you can set how many pixels you have to scroll to see the image shuffle. The default value is 100.
   target: "> img"              // In case you have a complete HTML structure, you can set your own custom selector to your images here. The default value is "> img" which means images that are directly under the "shuffle-me" will be used to shuffle.
 });
 
</script>

