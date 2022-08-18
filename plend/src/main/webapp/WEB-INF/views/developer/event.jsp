<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- 07.13 김영민 뷰제작 -->
<html>
<head>
	<meta charset="UTF-8">
	<title>이벤트 관리</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/developer.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
	
	<!-- timePicker -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
		
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
					<p class="h5 fw-bold category-title"> 이벤트 관리 </p>
				</div>
			</div>
			<div class="blockAndEvent">
				<section class="row px-1">
					<table class="col table text-center table-hover">
					  <thead class="table-light">
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">진행여부</th>
					      <th scope="col">이벤트명</th>
					      <th scope="col">기간</th>
					      <th scope="col">수정/삭제</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<!-- 07.18 김영민: 데이터 반영 이벤트리스트 -->
					  	<c:if test="${empty eventList }">
					  		<tr>
					  			<td colspan="5"> 결과와 맞는 업체가 없습니다. </td>
					  		</tr>
					  	</c:if>
					  	<c:forEach var="event" items="${eventList}">
					  		<tr>
						      <th scope="row">${event.rnum}</th>
						      <td>
						      	<c:choose>
						      		<c:when test="${event.startEnd eq 'end'}">
						      			종료
						      		</c:when>
						      		<c:otherwise>
						      			진행중
						      		</c:otherwise>
						      	</c:choose>
						      </td>
						      <td>${event.title}</td>
						      <td>${event.edate.replace("to","~")}</td>
						      <td>
						      	<button class="btn btn-primary btn-sm rounded-3" onclick="modifyEvent(${event.eidx})">수정</button>
						      	<a class="btn btn-primary btn-sm rounded-3" onclick="deleteConfirm(${event.eidx},'${event.category}')" role="button">삭제</a>
					      	  </td>
						    </tr>
					  	</c:forEach>
					  </tbody>
					</table>
				</section>
			</div>
			<c:if test="${not empty eventList}">
				<nav id="pagenation" class="row">
				  <ul class="pagination justify-content-center">
				  	<c:if test="${pagenation.startPage > 5}">
					    <li class="page-item">
					      <a class="page-link" href="event.do?nowPage=${pagenation.startPage-1}">&laquo;</a>
					    </li>
				  	</c:if>
				  	<c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="p">
						<c:choose>
							<c:when test="${p == pagenation.nowPage }">
								<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="event.do?nowPage=${p}">${p}</a></li>
							</c:when>
							<c:when test="${p != pagenation.nowPage }">
								<li class="page-item"><a class="page-link" href="event.do?nowPage=${p}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				    <c:if test="${pagenation.endPage != pagenation.lastPage}">
					    <li class="page-item">
					      <a class="page-link" href="event.do?nowPage=${pagenation.endPage +1}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</c:if>
			<div class="row mt-3">
				<div class="col category">
					<p class="h5 fw-bold category-title"> 이벤트 정보 입력 </p>
				</div>
			</div>
			<div id="formPosition">
				<form action="event.do" method="POST" enctype="multipart/form-data" onsubmit="return validation()">
				<section class="row px-1">
					<table class="col table text-center table-hover">
					  <tbody>
						<tr class="border-top"> 
							<td scope="row">진행여부</td>
							<td>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" value="start" type="radio" name="startEnd" id="radio1">
								  <label class="form-check-label" for="radio1">진행</label>
								</div>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" value="end" type="radio" name="startEnd" id="radio2" checked>
								  <label class="form-check-label" for="radio2">미진행</label>
								</div>
							</td>
						</tr>
						<tr> 
							<td class="align-middle text-center">카테고리</td>
							<td>
								<select class="form-select" name="category">
								  <option value="gallery" selected>갤러리</option>
								  <option value="shareKitchen">공유주방</option>
								  <option value="recording">녹음실</option>
								  <option value="singPractice">노래 연습실</option>
								  <option value="shareOffice">공유 오피스</option>
								  <option value="office">독립 오피스</option>
								  <option value="smallWedding">스몰웨딩</option>
								  <option value="homeGym">운동시설</option>
								  <option value="studio">촬영 스튜디오</option>
								  <option value="dancePractice">춤 연습실</option>
								  <option value="partyRoom">파티룸</option>
								  <option value="meeting">회의실</option>
								</select>
							</td>
						</tr>
						<tr> 
							<td class="align-middle text-center">이벤트 기간</td>
							<td><input name="edate" type="date" class="form-control edate" required> </td>
						</tr>
						<tr> 
							<td class="align-middle text-center">제목</td>
							<td><input name="title" type="text" class="form-control" required> </td>
						</tr>
						<tr> 
							<td class="align-middle text-center">상세내용</td>
							<td><input name="semiTitle" type="text" class="form-control" required> </td>
						</tr>
						<tr> 
							<td class="align-middle text-center">이벤트 설명</td>
							<td><input name="content" type="text" class="form-control" required> </td>
						</tr>
						<tr> 
							<td class="align-middle text-center">이용조건</td>
							<td><input name="conditions" id="conditions" type="text" class="form-control" required> </td>
						</tr>
						<tr> 
							<td class="align-middle text-center">메인 이미지 등록 </td>
							<td><input name="eventImg" class="form-control" type="file" > </td>
						</tr>
						<tr> 
							<td class="align-middle text-center">배너 등록 </td>
							<td><input name="eventImg" class="form-control" type="file" id="formFile"> </td>
						</tr>
					  </tbody>
					</table>
				</section>
				<div class="row">
					<div class="col text-center mb-5">
						<a class="btn btn-primary btn-sm rounded-pill formReset" role="button">초기화</a>
				      	<button class="btn btn-primary btn-sm rounded-pill">이벤트 등록</button>
					</div>
				</div>
				</form>
			</div>
			<div class="flex-grow-1"></div>
		</main>
		<footer id="footer" class="row"></footer>
	</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/js/developer/event.js"></script>
</body>
</html>




