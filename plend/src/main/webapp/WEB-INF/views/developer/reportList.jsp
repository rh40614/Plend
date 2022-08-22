<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- 07.13 김영민 뷰제작 -->
<html>
<head>
	<meta charset="UTF-8">
	<title>신고관리</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/developer.css" rel="stylesheet">
		
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#nav").load("<%=request.getContextPath()%>/resources/article/developerNav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>	
</head>

<body>
	<div id="wrap" class="container-fluid overflow-auto">	
		<header id="header" class="row"></header>
		<nav id="nav" style="margin: 0% 20% 0% 20%;"></nav>
		<main>
			<div class="row mt-3">
				<div class="col category">
					<p class="h5 fw-bold category-title"> 회원신고리스트 </p>
				</div>
			</div>
			<div class="distancePagination">
				<section class="row px-1">
					<table class="col table text-center table-hover">
					  <thead class="table-light">
					    <tr>
					      <th scope="col">신고번호</th>
					      <th scope="col">신고항목</th>
					      <th scope="col">신고내용</th>
					      <th scope="col">신고자</th>
					      <th scope="col">신고일자</th>
					      <th scope="col">관리</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:if test="${empty reportList}">
					  		<tr>
					  			<td colspan="6"> 아직 접수된 신고가 없습니다. </td>
					  		</tr>
					  	</c:if>
					  	<c:forEach var="report" items="${reportList}" varStatus="status">
							<tr>
						      <th scope="row">${report.rnum}</th>
						      <td>${report.category.replace(",",'/')}</td>
						      <td><a href="<%=request.getContextPath()%>/review/detail.do?rvidx=${report.rvidx}">${report.content}</a></td>
						      <td>${report.name}</td>
						      <td>${report.date.substring(0,10)}</td>
						      <c:choose>
						      	<c:when test="${report.delYN eq 'N'}">
							      <td><a id="blind${status.index}" class="btn btn-sm rounded-3" onclick="doBlind(${report.rvidx},${report.rbidx},${status.index})">블라인드처리</a></td>
						      	</c:when>
						      	<c:otherwise>
						      	  <td><a class="btn btn-sm grayBtn rounded-3">블라인드처리</a></td>
						      	</c:otherwise>
						      </c:choose>
						    </tr>			  		
					  	</c:forEach>
					  </tbody>
					</table>
				</section>
			</div>
			<c:if test="${not empty reportList}">
				<nav id="pagenation" class="row">
				  <ul class="pagination justify-content-center">
				  	<c:if test="${pagenation.startPage > 5}">
					    <li class="page-item">
					      <a class="page-link" href="reportList.do?nowPage=4">&laquo;</a>
					    </li>
				  	</c:if>
				  	<c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="p">
						<c:choose>
							<c:when test="${p == pagenation.nowPage }">
								<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="reportList.do?nowPage=${p}">${p}</a></li>
							</c:when>
							<c:when test="${p != pagenation.nowPage }">
								<li class="page-item"><a class="page-link" href="reportList.do?nowPage=${p}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				    <c:if test="${pagenation.endPage != pagenation.lastPage}">
					    <li class="page-item">
					      <a class="page-link" href="reportList.do?nowPage=${pagenation.endPage +1}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</c:if>
			<form action="reportList.do" method="get">
				<div class="row search-form mb-5">
					<div class="input-group justify-content-center">
						<select class="form-select-sm" name="searchType">
							<option value="category">신고항목</option>
		  					<option value="name">신고자</option>
						</select>
						<input name="searchValue">
						<button class="btn btn-primary btn-sm">검색</button>
					</div>
				</div>
			</form>
			<div class="flex-grow-1"></div>
		</main>
		<footer id="footer" class="row"></footer>
	</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/js/developer/reportList.js"></script>
</body>
</html>




