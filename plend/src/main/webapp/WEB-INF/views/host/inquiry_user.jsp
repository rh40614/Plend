<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-문의 관리</title>

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
	
	

</head>
<body>

	<header id="header"></header>
	
	<main>
		<section style="margin-top: 100px;">
			<span class="title1">문의관리</span>
			
				
				<div class=".table-responsive container " style="margin: 80px 0px 0px 100px;" >
					
					<table class="table table-hover text-center clearfix" >
						<thead class="table-dark">
							<tr style="text-al">
								<td>번호</td><td>카테고리</td><td>플레이스명</td><td>문의 제목</td><td>작성자</td><td>작성일</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list_p.size() == 0}">	
								<tr>
									<td colspan="6">등록된 문의가 없습니다.</td>
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
		
		
		
		

	</main>
	<div style="margin:300px;"></div>
	<footer id="footer"></footer>
	
	
	
</body>
</html>