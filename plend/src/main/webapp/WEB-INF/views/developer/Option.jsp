<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- 07.13 김영민 뷰제작 -->
<html>
<head>
	<meta charset="UTF-8">
	<title>업체리스트</title>
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
					<p class="h5 fw-bold category-title"> 업체 요청/요구 옵션 </p>
				</div>
			</div>
			<div class="distancePagination">
				<section class="row px-1">
					<table class="col table text-center table-hover">
					  <thead class="table-dark">
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">업체명</th>
					      <th scope="col">옵션</th> 
					      <th scope="col">확인</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<!-- 07.15 김영민: 데이터 반영 업체리스트 -->
					  	<c:if test="${empty option }">
					  		<tr>
					  			<td colspan="4"> 요청된 추가 옵션이 없습니다. </td>
					  		</tr>
					  	</c:if>
			  			<!-- 삭제된 업체의 버튼은 회색으로 -->
					  	<c:forEach var="option" items="${option}">
							  		<tr>
									  <th scope="row">${option.rnum}</th>
								      <td>${option.name}</td>
								      <td>${option.option2}</td>
								      <td><a class="btn btn-primary btn-sm rounded-3" style="background-color: #2F506D !important; border-color: #2F506D !important;" role="button" onclick = "alert('서비스 준비중 입니다.');">확인</a></td>			  			
							  		</tr>					  			
					  	</c:forEach>
					  </tbody>
					</table>
				</section>
			</div>
			<c:if test="${not empty enterList}">
				<nav id="pagenation" class="row">
				  <ul class="pagination justify-content-center">
				  	<c:if test="${pagenation.startPage > 5}">
					    <li class="page-item">
					      <a class="page-link" href="Option.do?nowPage=4">&laquo;</a>
					    </li>
				  	</c:if>
				  	<c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="p">
						<c:choose>
							<c:when test="${p == pagenation.nowPage }">
								<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="Option.do?nowPage=${p}">${p}</a></li>
							</c:when>
							<c:when test="${p != pagenation.nowPage }">
								<li class="page-item"><a class="page-link" href="Option.do?nowPage=${p}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				    <c:if test="${pagenation.endPage != pagenation.lastPage}">
					    <li class="page-item">
					      <a class="page-link" href="Option.do?nowPage=${pagenation.endPage +1}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</c:if>
			<form action="Option.do" method="get">
				<div class="row search-form mb-5">
					<div class="input-group justify-content-center">
						<select class="form-select-sm" name="searchType">
							<option value="name">업체명</option>
		  					<option value="option2">옵션명</option>
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
<!-- 삭제버튼 유효성 검사 -->
<script type="text/javascript">
	function confirmDelete(uidx){
		if(confirm("삭제하시겠습니까?")){
			location.replace("enterDelete.do?uidx="+uidx)
		}
	}
</script>
</body>
</html>



