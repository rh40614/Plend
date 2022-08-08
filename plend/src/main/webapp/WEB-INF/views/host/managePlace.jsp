<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-장소 관리</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
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
			$("#footer").load("<%=request.getContextPath()%>/resources/article/hostfooter.jsp");
		})
	</script>
	
	<script>
		$(function(){
			//장소 로딩
			$.ajax({
				url: "placeManage.do",
				type: "POST",
				success: function(data){
					$("#placeList").html(data);
				}
			});
			//예약 로딩
			$.ajax({
				url: "bookManage.do",
				type: "POST",
				success: function(data){
					$("#bookList").html(data);
				}
			});
			
		});
	</script>
	
	
	<!-- 장소 페이징 -->
	<script>
	
	function nowPage(p){
		$.ajax({
			url: "placeList.do",
			type: "GET",
			data: "nowPage="+p,
			success: function(data){
				$("#placeList").html(data);
			},
			error: function(){
				console.log("장소페이징 실패");
			}
			
		});
	}
	</script>
	<!-- 예약 페이징 -->
	<script>
	function nowPage2(p){
		$.ajax({
			url: "bookList.do",
			type: "GET",
			data: "nowPage="+p,
			success: function(data){
				console.log("에이작스 페이징");
				$("#bookList").html(data);
			},
			error: function(){
				console.log("예약 페이징 실패");
			}
			
		});
	}
		
	</script>

</head>
<body>

	<header id="header"></header>
	
	<main>
	<!-- 장소관리 리스트 -->
		<section>
		<div class="container" style=" margin-left: 100px; display: flex;  justify-content: space-between; align-items: baseline; margin-left: 100px;">
			<span class="title1" style="margin:0px;">플레이스 리스트</span>
			<button class="mb-3 btnBig " onclick="location.href='<%=request.getContextPath()%>/host/insertPlace.do'">플레이스 등록</button>
		</div>		
			<div class=".table-responsive container " style="margin-left: 100px;" >
				<div id="placeList" style="height:550px;justify-content: space-between;align-items: center;" class="d-flex flex-column" >
					<table class="table table-hover text-center clearfix " >
						<thead class="table-dark">
							<tr style="text-al">
								<td class="col-md-1">번호</td>
								<td class="col-md-2">플레이스명</td>
								<td class="col-md-3">태그</td>
								<td class="col-md-4">소개</td>
								<td class="col-md-1">승인여부</td>
								<td class="col-md-1">수정</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list_p.size() == 0}">	
								<tr>
									<td colspan="6">등록된 장소가 없습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${list_p.size() > 0}">
								<c:forEach var="pv" items="${list_p}" varStatus="status">
									<tr >
										<td>${status.count}</td>
										<td>${pv.placeName}</td>
										<!-- 반복문을 돌리는 아이디값에 변수를 주기위해 아이디 뒤에 변수 넣기 -->
										<td id="tag${pv.pidx}"></td>
										<script>
											var tags = JSON.parse('${pv.tag}');
											var tag = "";
											tags.forEach(element => 
												tag += "#"+ element.value + "&nbsp;" 
											);
											$("#tag${pv.pidx}").html(tag);
										</script>
										<td style="text-align: left;">${pv.placeDetail}</td>
										<td>${pv.approvalYN}</td>
										<td><button class="btnDefault" type="button" onclick="location.href='/host/placeView.do'">수정</button></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
			
					<!-- 페이징 -->
					<c:if test="${not empty list_p}">
						<nav aria-label="Page navigation example" style="margin-bottom: 0px!important;">
						  <ul class="pagination justify-content-center" >
						  	
							<c:if test="${pagination.startPage > 5}">
								<li class="page-item">
						      		<a class="page-link" onclick="nowPage(4)">&laquo;</a>
						    	</li>
						    </c:if>
						    
							<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="p">
								<c:choose>
									<c:when test="${p == pagination.nowPage }">
										 <li class="page-item text-secondary">
										 <a class="page-link text-secondary" onclick="nowPage(${p})">${p}</a></li>
									</c:when>
									<c:when test="${p != pagination.nowPage }">
										<li class="page-item text-secondary">
										 <a class="page-link text-secondary" onclick="nowPage(${p})">${p}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
						
					    	<c:if test="${pagination.endPage != pagination.lastPage}">
							    <li class="page-item">
							      <a class="page-link" onclick="nowPage(${pagination.endPage +1})">&raquo;</a>
							    </li>
					    	</c:if>
						  </ul>
						</nav>
					</c:if> 
				</div>
			</div>
				
		</section>
	
	<!-- 예약현황 리스트 -->	
		<section>
			<span class="title1 mt-5 mb-5" style="margin-left: 120px;">예약 현황</span>
			
				<div class=".table-responsive container " style="margin-left: 100px;" >
					<div id="bookList"  style="height:400px; justify-content: space-between;align-items: center;" class="d-flex flex-column ">
					<table class="table table-hover text-center clearfix" >
						<thead class="table-dark">
							<tr style="text-al">
								<td class="col-md-1">no</td>
								<td class="col-md-1">예약번호</td>
								<td class="col-md-2">플레이스명</td>
								<td class="col-md-3">기간</td>
								<td class="col-md-1">인원</td>
								<td class="col-md-2">예약자</td>
								<td class="col-md-1">승인여부</td>
								<td class="col-md-1">승인</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list_b.size() == 0}">	
								<tr>
									<td colspan="6">등록된 장소가 없습니다.</td>
								</tr>
							</c:if>
							<!--  -->
							<c:if test="${list_b.size() > 0}">
								<c:forEach var="pv" items="${list_b}">
									<tr >
										<td>${pv.rnum}</td>
										<td>${pv.bidx}</td>
										<td>${pv.placeName}</td>
										<td>${pv.useTime}</td>
										<td>${pv.cntPeople}</td>
										<td>${pv.nickName}</td>
										<c:choose>
											<c:when test="${pv.approvalYN eq 'N'}">
												<td>승인 대기</td>
											</c:when>
											<c:when test="${pv.approvalYN eq 'Y'}">
												<td>승인 완료</td>
											</c:when>
										</c:choose>
										
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
					
						<!-- 페이징 -->
						<c:if test="${not empty list_b}">
							<nav aria-label="Page navigation example" >
							  <ul class="pagination justify-content-center " >
							  	
								<c:if test="${pagination2.startPage > 5}">
									<li class="page-item">
							      		<a class="page-link" onclick="nowPage2(4)">&laquo;</a>
							    	</li>
							    </c:if>
							    
								<c:forEach begin="${pagination2.startPage}" end="${pagination.endPage}" var="p">
									<c:choose>
										<c:when test="${p == pagination2.nowPage }">
											 <li class="page-item text-secondary">
											 <a class="page-link text-secondary" onclick="nowPage2(${p})">${p}</a></li>
										</c:when>
										<c:when test="${p != pagination2.nowPage }">
											<li class="page-item text-secondary">
											 <a class="page-link text-secondary" onclick="nowPage2(${p})">${p}</a></li>
										</c:when>
									</c:choose>
								</c:forEach>
							
						    	<c:if test="${pagination2.endPage != pagination2.lastPage}">
								    <li class="page-item">
								      <a class="page-link" onclick="nowPage2(${pagination2.endPage +1})">&raquo;</a>
								    </li>
						    	</c:if>
							  </ul>
							</nav>
						</c:if>
					</div>
				</div>
		</section>		
	<!-- 후기 리스트 -->	
		<section>
			<span class="title1" style="margin-left: 120px;">후기</span>
			
				
				<div class=".table-responsive container " style="margin-left: 100px;" >
					
					<table class="table table-hover text-center clearfix" >
						<thead class="table-dark">
							<tr style="text-al">
								<td class="col-md-1">번호</td>
								<td class="col-md-2">장소</td>
								<td class="col-md-1">평점</td>
								<td class="col-md-6">후기</td>
								<td class="col-md-1">아이디</td>
								<td class="col-md-1">작성일</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${lis_r.size() == 0}">	
								<tr>
									<td colspan="6">등록된 장소가 없습니다.</td>
								</tr>
							</c:if>
							<!--  -->
							<c:if test="${list_r.size() > 0}">
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
					
				<!-- 페이징 -->
					<c:if test="${not empty list_r}">
						<nav aria-label="Page navigation example" class="m-auto">
						  <ul class="pagination justify-content-center " >
						  	
							<c:if test="${pagination3.startPage > 5}">
								<li class="page-item">
						      		<a class="page-link" onclick="nowPage3(4)">&laquo;</a>
						    	</li>
						    </c:if>
						    
							<c:forEach begin="${pagination3.startPage}" end="${pagination3.endPage}" var="p">
								<c:choose>
									<c:when test="${p == pagination3.nowPage }">
										 <li class="page-item text-secondary">
										 <a class="page-link text-secondary" onclick="nowPage3(${p})">${p}</a></li>
									</c:when>
									<c:when test="${p != pagination3.nowPage }">
										<li class="page-item text-secondary">
										 <a class="page-link text-secondary" onclick="nowPage3(${p})">${p}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
						
					    	<c:if test="${pagination3.endPage != pagination.lastPage}">
							    <li class="page-item">
							      <a class="page-link" onclick="nowPage3(${pagination3.endPage +1})">&raquo;</a>
							    </li>
					    	</c:if>
						  </ul>
						</nav>
					</c:if> 
				</div>
		</section>	

	</main>

	<footer id="footer"></footer>
</body>
</html>