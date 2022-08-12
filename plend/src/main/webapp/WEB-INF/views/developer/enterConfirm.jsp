<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- 07.13 김영민 뷰제작 -->
<html>
<head>
	<meta charset="UTF-8">
	<title>업체장소 등록승인</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/developer.css" rel="stylesheet">
		
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
					<p class="h5 fw-bold category-title"> 업체장소 등록승인 </p>
				</div>
			</div>
			<div class="distancePagination">
				<section class="row px-1">
					<table class="col table text-center table-hover">
					  <thead class="table-dark">
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">장소</th>
					      <th scope="col">업체명</th>
					      <th scope="col">장소명</th>
					      <th scope="col">대표자명</th>
					      <th scope="col">업체번호</th>
					      <th scope="col">등록일</th>
					      <th scope="col">승인/반려</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<!-- 07.15 김영민: 데이터 반영 업체리스트-->
					  	<!-- 07.16 김영민: pagination, search, 승인 여부에 따라 색상변경 -->
					  	<c:if test="${empty placeList }">
					  		<tr>
					  			<td colspan="8"> 결과와 맞는 업체가 없습니다. </td>
					  		</tr>
					  	</c:if>
					  	<c:forEach var="place" items="${placeList}">
						  	<c:choose>
						  		<c:when test="${place.approvalYN eq '승인대기'}">
						  			<tr>
								      <th scope="row">${place.pidx} </th>
								      <td>${place.category}</td>
								      <td>${place.nickName}</td>
								      <td><a href="<%=request.getContextPath()%>/place/view.do?pidx=${place.pidx}">${place.placeName}</a></td>
								      <td>${place.name}</td>
								      <td>${place.userPhone}</td>
								      <td>2022-07-13</td>
								      <td>
								      	<a class="btn btn-primary btn-sm rounded-3 confirm" href="confirm.do?pidx=${place.pidx}&approvalYN=승인" role="button">승인</a>
								      	<a class="btn btn-primary btn-sm rounded-3 reject" href="confirm.do?pidx=${place.pidx}&approvalYN=승인거절" role="button">반려</a>
								      </td>
								    </tr>
						  		</c:when>
						  		<c:when test="${place.approvalYN eq '승인거절'}">
						  			<tr style="color: red !important;">
								      <th scope="row">${place.pidx} </th>
								      <td>${place.category}</td>
								      <td>${place.nickName}</td>
								      <td>${place.placeName}</td>
								      <td>${place.name}</td>
								      <td>${place.userPhone}</td>
								      <td>2022-07-13</td>
								      <td>
								      	<a class="btn btn-primary btn-sm rounded-3" style="background-color: gray !important; border-color: gray !important;" >승인</a>
								      	<a class="btn btn-primary btn-sm rounded-3" >반려</a>
								      </td>
								    </tr>
						  		</c:when>
						  		<c:when test="${place.approvalYN eq '승인'}">
						  			<tr style="color: graytext !important;">
								      <th scope="row">${place.pidx} </th>
								      <td>${place.category}</td>
								      <td>${place.nickName}</td>
								      <td>${place.placeName}</td>
								      <td>${place.name}</td>
								      <td>${place.userPhone}</td>
								      <td>2022-07-13</td>
								      <td>
								      	<a class="btn btn-primary btn-sm rounded-3">승인</a>
								      	<a class="btn btn-primary btn-sm rounded-3" style="background-color: gray !important; border-color: gray !important;">반려</a>
								      </td>
								    </tr>
						  		</c:when>	
					  		</c:choose>
					  	</c:forEach>
					  </tbody>
					</table>
				</section>
			</div>
			<c:if test="${not empty placeList}">
				<nav id="pagenation" class="row">
				  <ul class="pagination justify-content-center">
				  	<c:if test="${pagenation.startPage > 5}">
					    <li class="page-item">
					      <a class="page-link" href="enterConfirm.do?nowPage=4">&laquo;</a>
					    </li>
				  	</c:if>
				  	<c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="p">
						<c:choose>
							<c:when test="${p == pagenation.nowPage }">
								<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="enterConfirm.do?nowPage=${p}">${p}</a></li>
							</c:when>
							<c:when test="${p != pagenation.nowPage }">
								<li class="page-item"><a class="page-link" href="enterConfirm.do?nowPage=${p}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				    <c:if test="${pagenation.endPage != pagenation.lastPage}">
					    <li class="page-item">
					      <a class="page-link" href="enterConfirm.do?nowPage=${pagenation.endPage +1}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</c:if>
			<form action="enterConfirm.do" method="get">
				<div class="row search-form mb-5">
					<div class="input-group justify-content-center">
						<select class="form-select-sm" name="searchType">
							<option value="name">대표자명</option>
		  					<option value="nickName">업체명</option>
						</select>
						<input name="searchValue">
						<button class="btn btn-primary btn-sm">검색</button>
					</div>
				</div>
			</form>
		</main>
		<footer id="footer" class="row"></footer>
	</div>
<!-- 승인/반려 버튼 클릭 이벤트 -->
<script type="text/javascript">
	$(".confirm").click(function(){
		if(!window.confirm("승인 하시겠습니까?")) {
			return false;
		}
	})
	
	$(".reject").click(function(){
		if(!window.confirm("반려 하시겠습니까?")) {
			return false;
		}
	})
</script>	
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>




