<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>장소 상세 페이지</title>
	<!-- fontAwesome -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	<!-- BootStrap css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- jquery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<!-- css -->
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/placeDetail.css" rel="stylesheet">
	<!-- kakaoMap api -->
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b685739baf5af3ec44e96933a3116f08&libraries=services,clusterer,drawing"></script>
	<!-- 슬릭 슬라이더 -->
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
				
	<!-- header/footer -->	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		});
	</script>
	<!-- calendar/ timeTable -->
	<script>
		$(function(){
			$(".dateCalendar").load("<%=request.getContextPath()%>/resources/article/calendar.jsp");
			$(".timeTable").load("<%=request.getContextPath()%>/resources/article/timeTable.jsp");
		});
	</script>
</head>
<body data-bs-spy="scroll" data-bs-target="#simple-list-example" data-bs-offset="0" data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
<div class="container">	
	<header class="row" id="header"></header>
	<br>
	<div class="row">
	<main class="d-flex flex-column col-9">
		<section id="placeHeader" class="d-inline-flex mt-1 mb-5">
			<!-- 이미지 불러오기 -->
			<section id="placeImg" class="col-6">
				<!-- image slide -->
				<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
			      <div class="carousel-indicators">
			      	<c:forEach var="img" items="${imageList}" varStatus="status">
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="active" aria-current="true"></button>			      		
			      	</c:forEach>
			      </div>
			      <div class="carousel-inner">
	          		<c:forEach var="img" items="${imageList}" varStatus="status">
				        <c:if test="${status.index eq 0 }">
					        <div class="carousel-item active">
								<img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="800" height="400" alt="img" src="<%=request.getContextPath() %>/imageView.do?realFileName=${img.realFileName}"/>
					        </div>
				        </c:if>
				        <c:if test="${status.index ne 0 }">
					        <div class="carousel-item">
								<img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="800" height="400" alt="img" src="<%=request.getContextPath() %>/imageView.do?realFileName=${img.realFileName}"/>
					        </div>
				        </c:if>
					</c:forEach>
			      </div>
			    </div>
			</section>
			<!-- 장소 이름/주소/짧은 기능 -->
			<section id="placeTitle" class="col-5 ms-3">
				<div class="ms-5 me-5" >
					<a href="<%=request.getContextPath()%>/place/host.do?uidx=${placeOne.uidx}" style="color: #7f8b93;">
						<i class="fa-solid fa-angles-right" title="이 호스트의 다른 공간 보러가기"> ${placeOne.nickName}</i>
					</a>
					&nbsp;
					<%-- <a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
						<i class="fa-solid fa-angles-right" >갤러리</i>
					</a> --%>
					<c:choose>
			    		<c:when test="${placeOne.category == 'gallery'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 갤러리</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'homeGym'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 운동시설</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'meeting'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 회의실</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'dancePractice'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 춤연습실</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'office'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 독립오피스</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'shareOffice'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 공유오피스</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'partyRoom'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 파티룸</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'recording'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 녹음실</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'shareKitchen'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 공유주방</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'singPractice'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 노래연습실</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'studio'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 갤러리</i>
							</a>
			    		</c:when>
			    		<c:when test="${placeOne.category == 'smallWedding'}">
				    		<a href="<%=request.getContextPath()%>/place/placeList.do?category=${placeOne.category}" style="color: #7f8b93">
								<i class="fa-solid fa-angles-right" > 스몰웨딩</i>
							</a>
			    		</c:when>
			    	</c:choose>
				</div>
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
					<!-- 클립보드 -->
					<a class="me-2 ms-2" onclick="setClipboard()" style="cursor: pointer;"><i class="fa-solid fa-link"></i></a>
					<!-- 찜하기 -->
					<c:choose>
						<c:when test="${empty heartList}">
							<a class="me-2 ms-2" style="cursor: pointer;"><i onclick="like(this)" class="fa-regular fa-heart" style="color: red;"> ${placeOne.cntHeart}</i></a>
						</c:when>
						<c:when test="${not empty heartList}">
							<a class="me-2 ms-2" style="cursor: pointer;"><i onclick="like(this)" class="fa-solid fa-heart" style="color: red;"> ${placeOne.cntHeart}</i></a>
						</c:when>
					</c:choose>
					<i class="fa-regular fa-star me-2 ms-2" style="float:right"> ${placeOne.avgRate}</i>
				</div>
				<div style="float: right;" class="me-5 mt-3">
					<span class="card-text title3" ><fmt:formatNumber value="${placeOne.price}" pattern="#,###"/></span><span>  원/시간</span>
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
										<img width="700" height="400" alt="img" src="<%=request.getContextPath() %>/imageView.do?realFileName=${img.realFileName}"/>
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
		
	</main>
	<!-- 예약하기 -->
	<div class="d-flex flex-column col-3">
		<div id="book" class="bookSticky text-center">
			<form action="book.do" onsubmit="return calTime()" method="post">
				<div id="book_Timepiker" class="border-2 rounded-3 m-2 pt-4 pb-4 d-grid gap-1" style="border: solid var(--bs-gray-800);">
					<div class="dateCalendar d-none"></div>
					<input type="hidden" class="selectDate">
					<div class="timeTable d-none"></div>
					<input type="hidden" class="selectTime">
					<input type="hidden" name="useTime" class="useTime">
					<div class="cntPeople d-none">
						<div class="d-inline-flex">인원 선택</div>
						<input name="cntPeople" type="number" class="d-inline-flex form-control m-1" style="width: auto;">
					</div>
					<a class="datePicker btn btn-sm ms-1 me-1"> <i class="fa-regular fa-calendar"></i> 예약날짜 </a>
					<a class="timePicker btn btn-sm ms-1 me-1"> <i class="fa-regular fa-clock"></i> 예약시간 </a>
					<a class="peopleCnt btn btn-sm ms-1 me-1"> <i class="fa-regular fa-clock"></i> 예약인원 </a>
					<button class="bookBtn btn btn-lg m-1">예약 하기</button>
					<input type="hidden" name="pidx" value="${placeOne.pidx}">
				</div>
			</form>
		</div>
	</div>
	<!-- 2022.08.22 김연희 : 해쉬태그 기반 장소 추천 -->
	<section>
	<hr>
		<c:if test="${login.nickName != null}">
			<p style="padding-left: 100px; font-weight: bold;" class="mt-5">${login.nickName}님 이 장소가 마음에 드셨나요? 비슷한 장소를 추천해 드릴게요!</p>
			<p style="padding-left: 100px; font-weight: bold;">이런 장소는 어떠세요?</p>
			<br>
		</c:if>
		<c:if test="${login.nickName == null}">
			<p style="text-align: center; font-weight: bold;" class="mt-5">이런 장소는 어떠세요?</p>
			<br>
		</c:if>
		<div id="hashList"></div>
	</section>
		
	</div>
</div>
<footer id="footer" class="row mt-5"></footer>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 해쉬 태그 기반 장소  -->
<script>
	$(function(){
		
		var tags = JSON.parse('${placeOne.tag}');
		var tag = "";
		tags.forEach(element => 
			tag += element.value + ","
		);
		console.log(tag);
	
		$.ajax({
			url: "hashList.do",
			data: "tag=" + tag,
			ContentType: "text/plain; charset=utf-8",
			success: function(data){
				console.log("해쉬성공");
				$("#hashList").html(data);
			},
			error: function(data){
				console.log("해쉬 실패");
			}
		})
	});
	
</script>

<!-- 질문하기/답변 버튼 클릭시 토글 -->
<script type="text/javascript">
	function QnAToggle(obj){
		$('.'+obj).toggleClass("d-none");
	}
</script>
<!-- 수정버튼 클릭시 토글 -->
<script type="text/javascript">
	function modifyToggle(obj){
		$('.'+obj).toggleClass("d-none");
	}
</script>
<!-- 예약 날짜/시간/인원 보이기 클릭이벤트 -->
<script>
	$(".datePicker").click(function(){
		if(${login eq null}){
			alert("로그인 해주세요");
		}else{
			$(".timeTable").addClass("d-none");
			$(".cntPeople").addClass("d-none");
			$(".dateCalendar").toggleClass("d-none");
		}
	})
	
	$(".timePicker").click(function(){
		if(${login eq null}){
			alert("로그인 해주세요");
		}else{
			$(".dateCalendar").addClass("d-none");
			$(".cntPeople").addClass("d-none");
			$(".timeTable").toggleClass("d-none");
		}
	});
	
	$(".peopleCnt").click(function(){
		if(${login eq null}){
			alert("로그인 해주세요");
		}else{
			$(".dateCalendar").addClass("d-none");
			$(".timeTable").addClass("d-none");
			$(".cntPeople").toggleClass("d-none");
		}
	});
</script>
<!-- 예약전 예약시간 계산/ 빈값 유효성 검사 -->
<script type="text/javascript">
	function calTime(){
		
	    if(${login eq null}){
			alert("로그인을 해주세요");
			return false;
	    }else if($(".selectDate").val()==""){
			alert("날짜를 선택해주세요.");
			return false;
		}else if($(".selectTime").val()==""){
			alert("시간을 선택해주세요");
			return false;
		}else if($("input[name='cntPeople']").val()==""){
			alert("인원을 입력해주세요");
			return false;
		}else{
			const selectDate = $(".selectDate").val().split(",");
			const time = $(".selectTime").val().split(",");
			let year = selectDate[0];
			let month = selectDate[1];
			if(month < 10){
				month = '0' + month;
			}
			let date = selectDate[2];
			
			var data = new Date();
			var usetime = year+"-"+month+"-"+date+" "+time[0]+":00 ~ "+year+"-"+month+"-"+date+" "+time[1]+":00";
			$(".useTime").val(usetime);
		}
	}
</script>
<!-- 클립보드 복사 -->
<script type="text/javascript">
	function setClipboard() {
		const url = window.location.href; 
	    const type = "text/plain";
	    const blob = new Blob([url], {type});
	    const data = [new ClipboardItem({ [type]: blob })];
	
	    navigator.clipboard.write(data).then(
	        function () {
	        	alert("클립보드에 복사하였습니다.");
	        },
	        function () {
	        	alert("클립보드에 복사 실패했습니다.");
	        }
	    );
	}
</script>
<!-- 지도생성 코드 -->
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch('${placeOne.address}', function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {
	
	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
		} 
	});    
</script>
<!-- 좋아요 버튼 클릭시 찜목록에 들어감 -->
<script>
	function like(obj){
		if(${login ne null}){
			if($(obj).hasClass("fa-regular") == true){
				$.ajax({
					url: "heart.do?pidx=${placeOne.pidx}&like=add",
					success: function(data){
						console.log(data);
						if(data == 1){
							$(obj).removeClass("fa-regular");
							$(obj).addClass("fa-solid");
							alert("찜목록에 등록되었습니다.");
						}else{
							alert("찜목록 등록에 실패했습니다.");
						}
					},
					error: function(){
						alert("찜목록 등록에 실패했습니다.");
					}
				});
				
			}else{
				$.ajax({
					url: "heart.do?pidx=${placeOne.pidx}&like=delete",
					success: function(data){
						if(data == 1){
							$(obj).removeClass("fa-solid");
							$(obj).addClass("fa-regular");
							alert("찜목록에서 삭제했습니다.");
						}else{
							alert("찜목록 삭제에 실패했습니다.");
						}
					},
					error: function(){
						alert("찜목록 삭제에 실패했습니다.");
					}
				});
			}
		}else{
			alert("로그인을 해주세요.");
		}
	}
</script>
<!-- 리뷰 페이징 ajax -->
<script type="text/javascript">
	function review(pidx,nowPage){
		var param = "pidx="+pidx+"&nowPage="+nowPage;
		$.ajax({
			url: "<%=request.getContextPath()%>/ajax/viewPagination.do?"+param,
			success: function(data){
				$("#review").html(data.trimStart());
			}
		});
	}
</script>
<!-- 이미 예약시간이 있는 시간 처리를 위한 ajax -->
<script type="text/javascript">
	$(function(){
		$(".selectDate").change(function(){
			$(".btn.w-100").removeClass("diableTime");
			$(".btn.w-100").removeClass("chooseTime");
			const selectDate = $(".selectDate").val().split(",");
			let year = selectDate[0];
			let month = selectDate[1];
			if(month < 10){
				month = '0' + month;
			}
			let date = selectDate[2];
			var useTime = year+"-"+month+"-"+date;
			
			var pre = 0;
			var next = 0;
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/disableTime.do?pidx=" +${placeOne.pidx}+ "&useTime=" +useTime,
				success: function(data){
					data.forEach(function(element){
						pre = element.substring(0,2);
						next = element.substring(3,5);
						$(".btn.w-100").slice(pre,next).addClass("diableTime");
						$(".btn.w-100").slice(pre,next).prop("disabled",true);
					});
				}
			})
			
		});
	});
</script>

</body>
</html>




