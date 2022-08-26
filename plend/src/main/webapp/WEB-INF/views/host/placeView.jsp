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
	<main class="d-flex flex-column col-9" style="margin-top:100px;">
			<!-- 장소 이름/주소/짧은 기능 -->
			<section id="placeTitle" style="display:block!important;">
			<!-- 디자인 라벨 -->
			<div style="width: 1250px; background: #606e79; height: 40px;"></div>
			<div class="triangle"></div>
			<div style="height: 4000px; width: 1px; position: absolute; background: #525252; margin-left: 29px;top: 180px; margin-right:100px; "></div>
			
				<div class="d-flex place_name ms-5 mt-3 mb-2 fs-3 fw-bold" style="margin-left: 150px!important;">
						${placeOne.placeName}
				</div>
				<div class="d-flex place_tag ms-5 "id="tag${placeOne.pidx}" style="font-size: 14px; color:#7f8b93; flex-wrap: wrap; margin-left: 150px!important;"></div>
					<script>
						var tags = JSON.parse('${placeOne.tag}');
						var tag = "";
						tags.forEach(element => 
							tag += "<a href='<%=request.getContextPath()%>/place/searchPlace.do?searchValue="+element.value+"'> #"+ element.value + "&nbsp;</a>" 
						);
						console.log(tag);
						
						$("#tag${placeOne.pidx}").html(tag);
						 
					</script>
				<div class="d-flex place_addr ms-5 me-5 mt-4 mb-1 fw-bold" style="border-bottom: 1px solid lightgray; margin-left: 150px!important;">${placeOne.address}</div>
				<div class="icon d-flex ms-5 mt-2 me-5 pb-1" style="border-bottom: 1px solid lightgray; justify-content: right; margin-left: 150px!important;">
					<i class="fa-regular fa-star me-2 ms-2" style="float:right"> ${placeOne.avgRate}</i>
				</div>
				<div style="float: right; margin-left: 150px!important;" class="me-5 mt-3">
					<span class="card-text title3" style="margin: 0px;"><fmt:formatNumber value="${placeOne.price}" pattern="#,###"/></span><span>  원/시간</span>
				</div>
			</section>
			<section id="explanation_place" style="margin-left: 150px!important;">
				<table class="table caption-top table-borderless ms-5" >
					<caption class="ms-4 text-black fw-bold fs-5" >공간 이미지 및 공간소개</caption>
					<tbody>
						<c:forEach var="img" items="${imageList}">
							<tr> 
								<td style="padding: 0;"> 
									<img width="700" height="600" style="margin-left:50px;" alt="공간 이미지" src="<%=request.getContextPath() %>/imageView.do?realFileName=${img.realFileName}"/>
								</td>
							</tr>		
						</c:forEach>
						<tr>
							<td class="pt-5 ps-5">${placeOne.placeDetail}</td>
						</tr>						
					</tbody>
				</table>
			</section>
				<section id="facilities" style="min-height: 400px; padding-top: 150px; margin-left: 150px!important;">
					<table class="table caption-top ms-5">
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
				<section id="notice"  style="min-height: 400px; padding-top: 150px; margin-left: 150px!important;">
					<table class="table caption-top ms-5">
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
		</main>
	</div>
</div>
		

	<footer id="footer"></footer>
	
</body>
</html>