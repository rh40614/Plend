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
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
		
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
				<p class="h5 fw-bold category-title"> 회원신고리스트 </p>
			</div>
		</div>
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
			    <tr>
			      <th scope="row">1</th>
			      <td>욕설/비방</td>
			      <td>**이라고 했어요. 삭제해주세요</td>
			      <td>김연희</td>
			      <td>2022-06-24</td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="blind.do" role="button">블라인드처리</a></td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>욕설/비방</td>
			      <td>**이라고 했어요. 삭제해주세요</td>
			      <td>김연희</td>
			      <td>2022-06-24</td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="blind.do" role="button">블라인드처리</a></td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td>욕설/비방</td>
			      <td>**이라고 했어요. 삭제해주세요</td>
			      <td>김연희</td>
			      <td>2022-06-24</td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="blind.do" role="button">블라인드처리</a></td>
			    </tr>
			    <tr>
			      <th scope="row">4</th>
			      <td>욕설/비방</td>
			      <td>**이라고 했어요. 삭제해주세요</td>
			      <td>김연희</td>
			      <td>2022-06-24</td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="blind.do" role="button">블라인드처리</a></td>
			    </tr>
			    <tr>
			      <th scope="row">5</th>
			      <td>욕설/비방</td>
			      <td>**이라고 했어요. 삭제해주세요</td>
			      <td>김연희</td>
			      <td>2022-06-24</td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="blind.do" role="button">블라인드처리</a></td>
			    </tr>
			    <tr>
			      <th scope="row">6</th>
			      <td>욕설/비방</td>
			      <td>**이라고 했어요. 삭제해주세요</td>
			      <td>김연희</td>
			      <td>2022-06-24</td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="blind.do" role="button">블라인드처리</a></td>
			    </tr>
			    <tr>
			      <th scope="row">7</th>
			      <td>욕설/비방</td>
			      <td>**이라고 했어요. 삭제해주세요</td>
			      <td>김연희</td>
			      <td>2022-06-24</td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="blind.do" role="button">블라인드처리</a></td>
			    </tr>
			    <tr>
			      <th scope="row">8</th>
			      <td>욕설/비방</td>
			      <td>**이라고 했어요. 삭제해주세요</td>
			      <td>김연희</td>
			      <td>2022-06-24</td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="blind.do" role="button">블라인드처리</a></td>
			    </tr>
			    <tr>
			      <th scope="row">9</th>
			      <td>욕설/비방</td>
			      <td>**이라고 했어요. 삭제해주세요</td>
			      <td>김연희</td>
			      <td>2022-06-24</td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="blind.do" role="button">블라인드처리</a></td>
			    </tr>
			    <tr>
			      <th scope="row">10</th>
			      <td>욕설/비방</td>
			      <td>**이라고 했어요. 삭제해주세요</td>
			      <td>김연희</td>
			      <td>2022-06-24</td>
			      <td><a class="btn btn-primary btn-sm rounded-3" href="blind.do" role="button">블라인드처리</a></td>
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
		<div class="row search-form mb-5">
			<div class="input-group justify-content-center">
				<select class="form-select-sm">
					<option value="1">One</option>
  					<option value="2">Two</option>
  					<option value="3">Three</option>
				</select>
				<input>
				<button class="btn btn-primary btn-sm">검색</button>
			</div>
		</div>
		<div class="flex-grow-1"></div>
		<footer id="footer" class="row"></footer>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>




