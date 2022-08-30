<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-매출&#38;정산</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
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
	
	<style>
		tr>td{
			vertical-align: middle;
		}
	</style>
	

</head>
<body>

	<header id="header"></header>
	<main>
		<section style="align-items: center; font-weight: 700; font-size: x-large;">
			<p>이번달에 정산된 금액은 총 <fmt:formatNumber value="${incomeVO.totalIncome}" pattern="#,###"/> 원이며 </p>
			<p>현재까지  '호스트닉네임'님의 장소를 총 '${incomeVO.totalPeople}'명이 이용하였습니다.</p>	
			<p>저희 PLEND와 공간을 공유해 주셔서 감사합니다.</p>		
		</section>
	
		<!-- 매출현황 리스트 -->	
		<section>
			<span class="title1 mt-5 mb-5" style="margin-left: 120px;">매출</span>
				<div class=".table-responsive container " style="margin-left: 100px;" >
					<div id="bookList"  style="min-height:600px; justify-content: space-between; align-items: center;" class="d-flex flex-column ">
						<table class="table table-hover text-center clearfix" >
							<thead class="table-dark">
								<tr style="text-al">
									<td class="col-md-1">번호</td>
									<td class="col-md-1">예약번호</td>
									<td class="col-md-3">플레이스명</td>
									<td class="col-md-4">기간</td>
									<td class="col-md-1">인원</td>
								</tr>
							<thead>
							<tbody>
								<c:if test="${bookList eq null}">	
									<tr>
										<td colspan="8">
										PLEND를 이용하는 고객님들을 위해 공간을 등록해보아요!<br>
										공간을 홍보해 볼까요?
										</td>
									</tr>
								</c:if>
								<c:if test="${bookList.size() > 0}">
									<c:forEach var="pv" items="${bookList}" >
										<tr>
											<td>${pv.rnum}</td>
											<td>${pv.bidx}</td>
											<td>${pv.placeName}</td>
											<td>${pv.useTime}</td>
											<td>${pv.cntPeople}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<c:if test="${not empty bookList}">
						<nav id="pagination" class="row">
						  <ul class="pagination justify-content-center">
						  	<c:if test="${pagination.startPage > 5}">
							    <li class="page-item">
							      <a class="page-link" href="income.do?nowPage=4">&laquo;</a>
							    </li>
						  	</c:if>
						  	<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="p">
								<c:choose>
									<c:when test="${p == pagination.nowPage }">
										<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="income.do?nowPage=${p}">${p}</a></li>
									</c:when>
									<c:when test="${p != pagination.nowPage }">
										<li class="page-item"><a class="page-link" href="income.do?nowPage=${p}">${p}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
						    <c:if test="${pagination.endPage != pagination.lastPage}">
							    <li class="page-item">
							      <a class="page-link" href="income.do?nowPage=${pagination.endPage +1}">&raquo;</a>
							    </li>
						    </c:if>
						  </ul>
						</nav>
					</c:if>
					<hr width="100%">
				</div>
		</section>		
	</main>

	<footer id="footer"></footer>
	
	

	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



</body>
</html>