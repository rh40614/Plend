<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table table-borderless caption-top">
	<caption class="ms-4 text-black fw-bold fs-5">이용후기</caption>
	<tr> 
		<td>
			<!-- 08.26 김연희 : 리뷰 사진 슬릭 슬라이더 -->
			<c:choose>
				<c:when test="${reviewImgs == ''}">
					<P class="m-auto" style="min-height:300px; display: inline-block; margin: 20px 0px 20px 0px; vertical-align: top; font-size: 20px; color: grey; padding-top: 200px;">
						리뷰 사진이 없습니다. 
					</P>
				</c:when>
				<c:otherwise>
				  	<div id="reviewSlide" style="display: flex; width: 1000px;" >
						<c:forEach var ="reivewImg" items="${reviewImgs}" >
							<img src="<%=request.getContextPath()%>/reviewImg.do?realFileName=${reivewImg.realFileName}" class="card-img-top" alt="사진 로딩 오류" style="width: 10rem!important; height: 10rem; margin: 5px;">
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
			<script>
				if(${reviewImgs.size() > 5} == true){
					$('#reviewSlide').slick({
						  slidesToShow: 5,
						  slidesToScroll: 1,
						  autoplay: true,
						  autoplaySpeed: 2000,
						  prevArrow : "<button type='button' class='slick-prev' style='border:none; background: white; padding: 0px 40px 30px 0px'><i class='fa-solid fa-angle-left' style='font-size:40px; '></i></button>",		// 이전 화살표 모양 설정
						  nextArrow : "<button type='button' class='slick-next' style='border:none; background: white; padding: 0px 40px 30px 40px'><i class='fa-solid fa-angle-right' style='font-size:40px; '></i></button>",		// 다음 화살표 모양 설정
						});
				}else{
				}
			</script>
		</td>
	</tr>
	<tbody class="reviewListMap" style="border-top: none;">
		<c:if test="${not empty reviewList}">
			<c:forEach var="review" items="${reviewList}">
				<tr>
					<td>
						<p>
							<c:choose>
								<c:when test="${review.rate == '0' || review.rate == '1'}">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16" style="color: #2F506D ;">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="0" end="${review.rate-1}">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16" style="color: #2F506D ;">
										  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
										</svg>
									</c:forEach>
								</c:otherwise>			
							</c:choose>
						</p>
						<a href="<%=request.getContextPath()%>/review/detail.do?rvidx=${review.rvidx}">${review.title}</a>
					</td>
				</tr>
				<tr>
					<td>${review.content}</td>
				</tr>
				<tr style="border-bottom: 1px solid lightgray; color: gray; font-size: xx-small;">
					<td style="padding: 0px; padding-bottom: 5px;">${review.date.substring(0,10)}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<c:if test="${not empty reviewList}">
	<nav id="pagenation" class="row">
	  <ul class="pagination justify-content-center">
	  	<c:if test="${pagination.startPage > 5}">
		    <li class="page-item">
		      <a class="page-link text-black" onclick="review(${reviewVO.pidx},4)" role="button">&laquo;</a>
		    </li>
	  	</c:if>
	  	<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="p">
			<c:choose>
				<c:when test="${p == pagination.nowPage }">
					<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" onclick="review(${reviewVO.pidx},${p})" role="button">${p}</a></li>
				</c:when>
				<c:when test="${p != pagination.nowPage }">
					<li class="page-item"><a class="page-link text-black" onclick="review(${reviewVO.pidx},${p})" role="button">${p}</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	    <c:if test="${pagination.endPage != pagination.lastPage}">
		    <li class="page-item">
		      <a class="page-link text-black" onclick="review(${reviewVO.pidx},${pagination.endPage +1})" role="button">&raquo;</a>
		    </li>
	    </c:if>
	  </ul>
	</nav>
</c:if>