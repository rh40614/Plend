<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-장소 관리</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/insertPlace_HOST.css" rel="stylesheet">
	
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<!-- bootstrap  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!--  fontAwesome -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	
	
	<script type="text/javascript">
	//프론트 디자인
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
		})
	</script>
		

</head>
<body>

	<header id="header"></header>
	
	<main>
		<section style="margin-left:300px;">
			<span class="frmTitle">플레이스 리스트</span>
			
				
				<div class=".table-responsive container " style="margin-left: 100px;" >
					<button class="mb-3  btnBig" style="float: right;" onclick="location.href='<%=request.getContextPath()%>/host/insertPlace.do'">플레이스 등록</button>
					<table class="table table-hover text-center clearfix" >
						<thead class="table-dark">
							<tr style="text-al">
								<td>번호</td><td>플레이스명</td><td>태그</td><td>소개</td><td>승인여부</td><td>수정</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list_p.size() == 0}">	
								<tr>
									<td colspan="6">등록된 장소가 없습니다.</td>
								</tr>
							</c:if>
							<!--  -->
							<c:if test="${list_p.size() > 0}">
								<c:forEach var="pv" items="${list_p}">
									<tr >
										<td>${pv.pidx}</td>
										<td>${pv.placeName}</td>
										<td>${pv.tag}</td>
										<td style="text-align: left;">${pv.placeDetail}</td>
										<td>${pv.approvalYN}</td>
										<td><button class="btnDefault" type="button" onclick="location.href='/host/placeDetail.do'">수정</button></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					
				<nav aria-label="Page navigation example" class="m-auto">
				  <ul class="pagination justify-content-center " >
				    <li class="page-item text-secondary">
				      <a class="page-link text-secondary" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">1</a></li>
				    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">2</a></li>
				    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">3</a></li>
				    <li class="page-item text-secondary">
				      <a class="page-link text-secondary" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
				
		</section>
		
		<section style="margin-left:300px;">
			<span class="frmTitle ">예약 현황</span>
			
				
				<div class=".table-responsive container " style="margin-left: 100px;" >
					
					<table class="table table-hover text-center clearfix" >
						<thead class="table-dark">
							<tr style="text-al">
								<td>번호</td><td>장소</td><td>기간</td><td>인원</td><td>예약자</td><td>승인여부</td><td>승인</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list_p.size() == 0}">	
								<tr>
									<td colspan="6">등록된 장소가 없습니다.</td>
								</tr>
							</c:if>
							<!--  -->
							<c:if test="${list_p.size() > 0}">
								<c:forEach var="pv" items="${list_p}">
									<tr >
										<td>${pv.pidx}</td>
										<td>${pv.placeName}</td>
										<td>2022.07.15 12:00 ~ 2022.07.15 15:00</td>
										<td>3명</td>
										<td>김영민</td>
										<td>${pv.approvalYN}</td>
										<td><button class="btnDefault" type="button" onclick="location.href='/host/placeDetail.do'">확인</button></td>
										<!-- 2022.07.15 김연희:
										 확인 버튼 누르면 예약정보 상세창이 팝업으로 뜨고  승인, 거절 버튼이 주어지고 
										 승인을 누르면 approval값 변경. 
										 승인 거절을 누르면 ajax로 팝업 화면을 변경해서
										 승인거절 항목(selectbox) 선택할 수 있도록하고 
										 승인 사유 적도록하기 
										 취소하기, 등록하기 버튼을 제공하고 등록을 누르면  
										 approval 변경 및 db에 승인 거절 사유 등록
										 취소를 누르면 예약정보 상세창이 뜨도록 하기  -->
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					
					<nav aria-label="Page navigation example" class="m-auto">
					  <ul class="pagination justify-content-center " >
					    <li class="page-item text-secondary">
					      <a class="page-link text-secondary" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">1</a></li>
					    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">2</a></li>
					    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">3</a></li>
					    <li class="page-item text-secondary">
					      <a class="page-link text-secondary" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
		</section>		
		
		<section style="margin-left:300px;">
			<span class="frmTitle ">후기</span>
			
				
				<div class=".table-responsive container " style="margin-left: 100px;" >
					
					<table class="table table-hover text-center clearfix" >
						<thead class="table-dark">
							<tr style="text-al">
								<td>번호</td><td>장소</td><td>평점</td><td>후기</td><td>아이디</td><td>작성일</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list_p.size() == 0}">	
								<tr>
									<td colspan="6">등록된 장소가 없습니다.</td>
								</tr>
							</c:if>
							<!--  -->
							<c:if test="${list_p.size() > 0}">
								<c:forEach var="pv" items="${list_p}">
									<tr >
										<td>${pv.pidx}</td>
										<td>${pv.placeName}</td>
										<td><i class="fa-regular fa-star"> 9.5</i>${pv.tag}</td>
										<td style="text-align: left;">${pv.placeDetail}</td>
										<td>김하진</td>
										<td><button class="btnDefault" type="button" onclick="location.href='/host/placeDetail.do'">수정</button></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					
					<nav aria-label="Page navigation example" class="m-auto">
					  <ul class="pagination justify-content-center " >
					    <li class="page-item text-secondary">
					      <a class="page-link text-secondary" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">1</a></li>
					    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">2</a></li>
					    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">3</a></li>
					    <li class="page-item text-secondary">
					      <a class="page-link text-secondary" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
		</section>	

	</main>
	<div style="margin:300px;"></div>
	
	
	
	
</body>
</html>