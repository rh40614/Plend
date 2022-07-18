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
			$("#header").load("<%=request.getContextPath()%>/resources/article/developerHeader.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>	
</head>

<body>
	<div id="wrap" class="container-fluid">	
		<header id="header" class="row"></header>
		<br><br>
		<div class="row mt-3">
			<div class="col category">
				<p class="h5 fw-bold category-title"> 이벤트 관리 </p>
			</div>
		</div>
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
			    <tr>
			      <th scope="row">1</th>
			      <td>Y</td>
			      <td>파티룸 5000원 할인</td>
			      <td>2022-06-24 ~ 2022-07-15</td>
			      <td>
			      	<a class="btn btn-primary btn-sm rounded-3" href="#" role="button">수정</a>
			      	<a class="btn btn-primary btn-sm rounded-3" href="#" role="button">삭제</a>
		      	  </td>
			    </tr>
   			    <tr>
			      <th scope="row">2</th>
			      <td>Y</td>
			      <td>파티룸 5000원 할인</td>
			      <td>2022-06-24 ~ 2022-07-15</td>
			      <td>
			      	<a class="btn btn-primary btn-sm rounded-3" href="#" role="button">수정</a>
			      	<a class="btn btn-primary btn-sm rounded-3" href="#" role="button">삭제</a>
		      	  </td>
			    </tr>
				<tr>
			      <th scope="row">3</th>
			      <td>Y</td>
			      <td>파티룸 5000원 할인</td>
			      <td>2022-06-24 ~ 2022-07-15</td>
			      <td>
			      	<a class="btn btn-primary btn-sm rounded-3" href="#" role="button">수정</a>
			      	<a class="btn btn-primary btn-sm rounded-3" href="#" role="button">삭제</a>
		      	  </td>
			    </tr>
			    <tr>
			      <th scope="row">4</th>
			      <td>Y</td>
			      <td>파티룸 5000원 할인</td>
			      <td>2022-06-24 ~ 2022-07-15</td>
			      <td>
			      	<a class="btn btn-primary btn-sm rounded-3" href="#" role="button">수정</a>
			      	<a class="btn btn-primary btn-sm rounded-3" href="#" role="button">삭제</a>
		      	  </td>
			    </tr>
			    <tr>
			      <th scope="row">5</th>
			      <td>Y</td>
			      <td>파티룸 5000원 할인</td>
			      <td>2022-06-24 ~ 2022-07-15</td>
			      <td>
			      	<a class="btn btn-primary btn-sm rounded-3" href="#" role="button">수정</a>
			      	<a class="btn btn-primary btn-sm rounded-3" href="#" role="button">삭제</a>
		      	  </td>
			    </tr>
			  </tbody>
			</table>
		</section>
		<nav id="pagenation" class="row">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">&raquo;</a>
		    </li>
		  </ul>
		</nav>
		<div class="row mt-3">
			<div class="col category">
				<p class="h5 fw-bold category-title"> 이벤트 정보 입력 </p>
			</div>
		</div>
		<form action="event.do" method="post">
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
					<td><input name="edate" type="date" class="form-control edate"> </td>
				</tr>
				<tr> 
					<td class="align-middle text-center">제목</td>
					<td><input name="title" type="text" class="form-control"> </td>
				</tr>
				<tr> 
					<td class="align-middle text-center">상세내용</td>
					<td><input name="semiTitle" type="text" class="form-control"> </td>
				</tr>
				<tr> 
					<td class="align-middle text-center">이벤트 설명</td>
					<td><input name="content" type="text" class="form-control"> </td>
				</tr>
				<tr> 
					<td class="align-middle text-center">이용조건</td>
					<td><input name="conditions" type="text" class="form-control"> </td>
				</tr>
				<tr> 
					<td class="align-middle text-center">파일 등록 </td>
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
		<div class="flex-grow-1"></div>
		<footer id="footer" class="row"></footer>
	</div>
	<!-- timePicker 형식 -->
	<script>
		$(".edate").flatpickr({
			mode: "range"
		});
	</script>
	<!-- formReset -->
	<script type="text/javascript">
		$(".formReset").click(function(){
			$(this).closest("form")[0].reset();
		})
	</script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>




