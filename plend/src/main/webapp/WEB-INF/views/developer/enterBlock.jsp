<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- 07.13 김영민 뷰제작 -->
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 블랙리스트</title>
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<!-- css -->
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/developer.css" rel="stylesheet">
	<!-- header/footer 불러오기 -->	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/developerHeader.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
</head>
<body>
	<div id="wrap" class="container-fluid overflow-auto">	
		<header id="header" class="row"></header>
		<br><br>
		<main>
			<div class="row mt-3">
				<div class="col category">
					<p class="h5 fw-bold category-title">업체리스트</p>
				</div>
			</div>
			<div class="blockAndEvent">
				<section class="row px-1">
					<table class="col table text-center table-hover">
					  <thead class="table-dark">
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">업체명</th>
					      <th scope="col">대표자명</th>
					      <th scope="col">업체번호</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach var="enter" items="${enterList}">
							<tr>
						      <th scope="row">${enter.uidx}</th>
						      <td><a onclick="callEnterBlockList(${enter.uidx},0)" role="button">${enter.nickName}</a></td>
						      <td>${enter.name}</td>
						      <td>${enter.userPhone}</td>
						    </tr>			  	
					  	</c:forEach>
					  </tbody>
					</table>
				</section>
			</div>
			<c:if test="${not empty enterList}">
				<nav id="pagenation" class="row">
				  <ul class="pagination justify-content-center">
				  	<c:if test="${pagination.startPage > 5}">
					    <li class="page-item">
					      <a class="page-link" href="enterBlock.do?nowPage=4">&laquo;</a>
					    </li>
				  	</c:if>
				  	<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="p">
						<c:choose>
							<c:when test="${p == pagination.nowPage }">
								<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="enterBlock.do?nowPage=${p}">${p}</a></li>
							</c:when>
							<c:when test="${p != pagination.nowPage }">
								<li class="page-item"><a class="page-link" href="enterBlock.do?nowPage=${p}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				    <c:if test="${pagination.endPage != pagination.lastPage}">
					    <li class="page-item">
					      <a class="page-link" href="enterBlock.do?nowPage=${pagination.endPage +1}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</c:if>
			<div class="row mt-3">
				<div class="col category">
					<p class="h5 fw-bold"> 업체별 사용자 블랙리스트 </p>
				</div>
			</div>
			<section class="row px-1 mb-5 enterBlockUserList">
				<table class="col table text-center table-hover">
				  <thead class="table-dark">
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">회원명</th>
				      <th scope="col">탈퇴유무</th>
				      <th scope="col">등록일</th>
				      <th scope="col" class="col col-5">사유</th>
				      <th scope="col">삭제</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
						<td colspan="6"> 업체를 선택해주세요. </td>
				    </tr>
				  </tbody>
				</table>
			</section>
			<div class="flex-grow-1"></div>
		</main>
		<footer id="footer" class="row"></footer>
	</div>	
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 해당 업체 블랙리스트 가져오기 -->
<script type="text/javascript">
	function callEnterBlockList(uidx,nowPage){
		var param = 'uidx=' + uidx + '&nowPage=' + nowPage;
		$.ajax({
			url: "<%=request.getContextPath()%>/ajax/callEnterBlockList.do?" + param,
			success: function(data){
				$(".enterBlockUserList").html(data);
			}
		});
	}
</script>
</body>
</html>




