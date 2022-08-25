<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-장소 등록</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	
	<!-- 2022.07.13 김연희 : js 파일은 가장 아래쪽에 있음 -->
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<!-- bootstrap  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- flatPicker -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

	<!--  fontAwesome -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	
	<!-- DAUM POSTCODE  -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
	//프론트 디자인
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/hostfooter.jsp");
		})
	</script>
	

</head>

<body>

	<header id="header"></header>
			
<div class="container">	
	<header class="row" id="header"></header>
	<br>
	<div class="row">
	<main class="d-flex flex-column col-9" style="margin-top:200px;">
		<section id="placeHeader" class=" mt-1 mb-5" >
			<!-- 장소 이름/주소/짧은 기능 -->
			<section id="placeTitle" style="display:block!important;">
				
				<div class="d-flex place_name ms-5 mt-3 mb-2 fs-3 fw-bold">
					<c:if test="${placeOne.eventYN eq 'Y'}">
						[특가 진행중] ${placeOne.placeName}
					</c:if>
					<c:if test="${placeOne.eventYN ne 'Y'}">
						${placeOne.placeName}
					</c:if> 
				</div>
				<div class="d-flex place_tag ms-5 "id="tag${placeOne.pidx}" style="font-size: 14px; color:#7f8b93; flex-wrap: wrap;"></div>
					<script>
						var tags = JSON.parse('${placeOne.tag}');
						var tag = "";
						tags.forEach(element => 
							tag += "<a href='<%=request.getContextPath()%>/place/searchPlace.do?searchValue="+element.value+"'> #"+ element.value + "&nbsp;</a>" 
						);
						console.log(tag);
						
						$("#tag${placeOne.pidx}").html(tag);
						 
					</script>
				<div class="d-flex place_addr ms-5 me-5 mt-4 mb-1 fw-bold" style="border-bottom: 1px solid lightgray;">${placeOne.address}</div>
				<div class="icon d-flex ms-5 mt-2 me-5 pb-1" style="border-bottom: 1px solid lightgray; justify-content: right;">
					<i class="fa-regular fa-star me-2 ms-2" style="float:right"> ${placeOne.avgRate}</i>
				</div>
				<div style="float: right;" class="me-5 mt-3">
					<span class="card-text title3" style="margin: 0px;"><fmt:formatNumber value="${placeOne.price}" pattern="#,###"/></span><span>  원/시간</span>
				</div>
			</section>
		</section>
		<section id="viewNav">
			<div id="simple-list-example" class="nav-scroller mb-2 simple-list-example-scrollspy list-group">
			    <nav class="nav d-flex row detailNav">
			      <a class="p-2 col link-secondary text-white list-group-item list-group-item-action active" href="#explanation_place">공간 소개</a>
			      <a class="p-2 col link-secondary text-white list-group-item list-group-item-action" href="#facilities">편의 시설</a>
			      <a class="p-2 col link-secondary text-white list-group-item list-group-item-action" href="#notice">유의사항</a>
			      <a class="p-2 col link-secondary text-white list-group-item list-group-item-action" href="#QnA">QnA</a>
			      <a class="p-2 col link-secondary text-white list-group-item list-group-item-action" href="#review">이용후기</a>
			    </nav>
			</div>
			<div id="scrollPosition" >
				<section id="explanation_place">
					<table class="table caption-top table-borderless">
						<caption class="ms-4 text-black fw-bold fs-5" >공간소개</caption>
						<tbody>
							<c:forEach var="img" items="${imageList}">
								<tr> 
									<td style="padding: 0;"> 
										<img width="700" height="600" alt="img" src="<%=request.getContextPath() %>/imageView.do?realFileName=${img.realFileName}"/>
									</td>
								</tr>		
							</c:forEach>
							<tr>
								<td>${placeOne.placeDetail}</td>
							</tr>						
						</tbody>
					</table>
				</section>
				<section id="facilities" style="min-height: 400px; padding-top: 150px;">
					<table class="table caption-top">
						<caption class="ms-4 text-black fw-bold fs-5">편의시설</caption>
						<tbody style="border-top: none;">
							<c:choose>
								<c:when test="${placeOne.option1 eq null}">
									<tr> 
										<td style="text-align-last: center;"> 등록된 편의시설이 없습니다. </td>
									</tr>		
								</c:when>
								<c:otherwise>
									<c:set var="option" value="${placeOne.option1.split(',')}"/>
									<c:forEach var="opt" items="${option}">
										<tr>
											<td class="ps-4 pb-3">${opt}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</section>
				<section id="notice"  style="min-height: 400px; padding-top: 150px;">
					<table class="table caption-top">
						<caption class="ms-4 text-black fw-bold fs-5">유의사항</caption>
						<tbody style="border-top: none;">
							<c:choose>
								<c:when test="${placeOne.guide eq null}">
									<tr> 
										<td style="text-align-last: center;"> 등록된 유의사항이 없습니다. </td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:set var="guid" value="${placeOne.guide.split('/')}" />
									<c:forEach var="g" items="${guid}" varStatus="status">
										<tr> 
											<td class="ps-4"> <p class="fw-bold d-inline-flex">${status.count}.</p> ${g}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</section>
				<section id="kakaoMap" style="min-height: 400px; padding-top: 150px;">
					<p class="ms-4 text-black fw-bold fs-5" style="padding-bottom:20px;"> 위치</p>
					<div style="width: 800; border-top: 1px var(--bs-gray-300)solid; background-color: var(--bs-gray-200);">
						<p class="ms-4 text-black fw-bold pt-2"><i class="fa-solid fa-location-dot"></i> ${placeOne.placeName} </p>
						<p style="padding-left:24px; padding-bottom: 16px; margin-bottom: 0px;"> ${placeOne.address} </p> 	
					</div>
					<div class="map_wrap" style="border: 1px var(--bs-gray-300) solid;">
					    <div id="map" style="width:800; height:400; position:relative; overflow:hidden;"></div> 
					    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
					    <div class="custom_zoomcontrol radius_border"> 
					        <span onclick="zoomIn()"><i class="fa-solid fa-plus" style="margin-top: 12px;"></i></span>  
					        <span onclick="zoomOut()"><i class="fa-solid fa-minus" style="margin-top: 12px;"></i></span>
					    </div>
					</div>
				</section>
				<section id="QnA" style="min-height: 400px; padding-top: 150px;">
					<table class="table caption-top">
						<caption class="ms-4 text-black fw-bold fs-5"> QnA</caption>
						<tbody>
							<c:if test="${empty QnaList}">
								<tr>
									<td style="text-align-last: center;">등록된 QnA가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="qna" items="${QnaList}" varStatus="status">
								<!-- QnA 질문 표시 -->
								<c:if test="${qna.depth eq 0}">
									<tr class="table-secondary">
										<td class="text-center col-2">Q.</td>
										<td>${qna.content}</td>
										<td class="col-3 text-end justify-content-md-end">
											<c:if test="${placeOne.uidx eq login.uidx && QnaList[status.index+1].depth ne 1}">
												<a class="btn btn-primary btn-sm rounded-3" onclick="QnAToggle('QnAToggle${status.index}')">답변</a>
											</c:if>
											<c:if test="${qna.uidx eq login.uidx}">
												<a class="btn btn-primary btn-sm rounded-3" onclick="modifyToggle('Modify${status.index}')">수정</a>
												<a class="btn btn-primary btn-sm rounded-3 me-2" href="deleteQna.do?qidx=${qna.qidx}&pidx=${placeOne.pidx}">삭제</a>
											</c:if>
										</td>								
									</tr>
									<!-- QnA 답변 등록 창 -->
									<tr class="QnAToggle${status.index} d-none">
										<td colspan="3">
											<div class="d-grid gap-1 d-md-flex justify-content-md-end">
												<form action="answer.do" method="post" class="col-12 text-end">
													<textarea class="form-control" name="content" style="resize: none;" required></textarea>
													<input type="hidden" name="uidx" value="${login.uidx}" readonly>
													<input type="hidden" name="pidx" value="${placeOne.pidx}" readonly>
													<input type="hidden" name="originQidx" value="${qna.qidx}" readonly>
													<a class="btn btn-sm rounded-3 mt-1" onclick="QnAToggle('QnAToggle${status.index}')">취소</a>
													<button class="btn btn-sm rounded-3 mt-1">답변 등록</button>
												</form>
											</div>
										</td>
									</tr>
									<!-- 질문 수정 창 -->
									<tr class="Modify${status.index} d-none">
										<td colspan="3">
											<div class="d-grid gap-1 d-md-flex justify-content-md-end">
												<form action="questionModify.do" method="post" class="col-12 text-end">
													<textarea class="form-control" name="content" style="resize: none;" required>${qna.content}</textarea>
													<input type="hidden" name="uidx" value="${login.uidx}" readonly>
													<input type="hidden" name="pidx" value="${placeOne.pidx}" readonly>
													<input type="hidden" name="qidx" value="${qna.qidx}" readonly>
													<input type="hidden" name="originQidx" value="${qna.originQidx}" readonly>
													<a class="btn btn-sm rounded-3 mt-1" onclick="modifyToggle('Modify${status.index}')">취소</a>
													<button class="btn btn-sm rounded-3 mt-1">수정</button>
												</form>
											</div>
										</td>
									</tr>
								</c:if>
								<!-- QnA 답변 표시 -->
								<c:if test="${QnaList[status.index+1].depth eq 1}">
									<tr>
										<td class="text-center col-2">A.</td>
										<td>${QnaList[status.index+1].content}</td>
										<td class="col-3 text-end justify-content-md-end">
											<c:if test="${qna.uidx eq login.uidx}">
												<a class="btn btn-primary btn-sm rounded-3" onclick="modifyToggle('Modify${status.index+1}')">수정</a>
												<a class="btn btn-primary btn-sm rounded-3 me-2" href="deleteQna.do?qidx=${QnaList[status.index+1].qidx}&pidx=${placeOne.pidx}">삭제</a>
											</c:if>
										</td>
									</tr>
									<!-- 답변 수정 창 -->					
									<tr class="Modify${status.index+1} d-none">
										<td colspan="3">
											<div class="d-grid gap-1 d-md-flex justify-content-md-end">
												<form action="questionModify.do" method="post" class="col-12 text-end">
													<textarea class="form-control" name="content" style="resize: none;" required>${QnaList[status.index+1].content}</textarea>
													<input type="hidden" name="uidx" value="${login.uidx}" readonly>
													<input type="hidden" name="pidx" value="${placeOne.pidx}" readonly>
													<input type="hidden" name="qidx" value="${QnaList[status.index+1].qidx}" readonly>
													<input type="hidden" name="originQidx" value="${QnaList[status.index+1].originQidx}" readonly>
													<a class="btn btn-sm rounded-3 mt-1" onclick="modifyToggle('Modify${status.index+1}')">취소</a>
													<button class="btn btn-sm rounded-3 mt-1">수정</button>
												</form>
											</div>
										</td>
									</tr>							
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${login ne null}">
						<div class="d-grid gap-1 d-md-flex justify-content-md-end">
							<a class="btn btn-primary btn-sm rounded-3 me-2 QnAToggle" onclick="QnAToggle('QnAToggle')">질문하기</a>
							<form action="question.do" method="post" class="QnAToggle d-none col-12 text-end">
								<textarea class="form-control" name="content" style="resize: none;" required></textarea>
								<input type="hidden" name="uidx" value="${login.uidx}">
								<input type="hidden" name="pidx" value="${placeOne.pidx}">
								<a id="QnAsubmit" class="btn btn-sm rounded-3 mt-1" onclick="QnAToggle('QnAToggle')">취소</a>
								<button id="QnAsubmit" class="btn btn-sm rounded-3 mt-1">등록</button>
							</form>
						</div>
					</c:if>
				</section>
				<section id="review" style="min-height: 400px; padding-top: 150px; margin-bottom: 100px;">
					<table class="table table-borderless caption-top">
						<caption class="ms-4 text-black fw-bold fs-5">이용후기</caption>
						<tbody class="reviewListMap" style="border-top: none;">
							<c:if test="${empty reviewList}">
								<tr> 
									<td style="text-align-last: center;"> 아직 등록된 후기가 없습니다.</td>
								</tr>		
							</c:if>
							<c:if test="${not empty reviewList}">
								<c:forEach var="review" items="${reviewList}">
									<tr>
										<td>
											<a href="<%=request.getContextPath()%>/review/detail.do?rvidx=${review.rvidx}">${review.title}</a>
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
							      <a class="page-link text-black" onclick="review(${placeOne.pidx},4)" role="button">&laquo;</a>
							    </li>
						  	</c:if>
						  	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="p">
								<c:choose>
									<c:when test="${p == pagination.nowPage}">
										<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" onclick="review(${placeOne.pidx},${p})" role="button">${p}</a></li>
									</c:when>
									<c:when test="${p != pagination.nowPage}">
										<li class="page-item"><a class="page-link text-black" onclick="review(${placeOne.pidx},${p})" role="button">${p}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
						    <c:if test="${pagination.endPage != pagination.lastPage}">
							    <li class="page-item">
							      <a class="page-link text-black" onclick="review(${placeOne.pidx},${pagination.endPage +1})" role="button">&raquo;</a>
							    </li>
						    </c:if>
						  </ul>
						</nav>
					</c:if>
				</section>
			</div>
		</section>
		
		<div>
		
		</div>
		</main>
		</div>
		</div>
		
		

	<div style="margin:300px;"></div>
	<footer id="footer"></footer>
	
</body>
</html>