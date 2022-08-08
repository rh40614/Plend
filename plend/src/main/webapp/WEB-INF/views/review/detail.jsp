<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰 상세 페이지</title>
	<!-- BootStrap css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- jquery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
	<!-- summernote -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>	
	
	<!-- css -->
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/review.css" rel="stylesheet">
	<!-- header/footer -->	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		});
	</script>
</head>
<body>
<!-- 리뷰수정 모달 -->
<div class="reviewModal">
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reivewModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
        <form id="reviewModify">
	      <div class="modal-header justify-content-center">
	        <h5 class="modal-title" id="reivewModalLabel">${placeOne.placeName} 이용후기</h5>
	      </div>
	      <div class="mb-3 text-center">
          	  <div class="rating"> 
	          	  <input type="radio" name="rate" value="5" id="5"><label for="5">☆</label> 
	          	  <input type="radio" name="rate" value="4" id="4"><label for="4">☆</label> 
	          	  <input type="radio" name="rate" value="3" id="3"><label for="3">☆</label> 
	          	  <input type="radio" name="rate" value="2" id="2"><label for="2">☆</label> 
	          	  <input type="radio" name="rate" value="1" id="1"><label for="1">☆</label> 
          	  </div>
	      </div>
	      <div class="modal-body">
	          <div class="mb-3">
	            <input name="title" type="text" class="form-control" id="recipient-name" value="${review.title}">
	            <input name="rvidx" type="hidden" value="${review.rvidx}" readonly> 
	            <textarea name="content" id="summernote" required>${review.content}</textarea>
	          	<input type="file" name="reviewImgs" id="reviewImgs" multiple="multiple">
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="reviewModify()">수정</button>
	      </div>
        </form>
	    </div>
	  </div>
	</div>
</div>
<div class="container">	
	<header class="row" id="header"></header>
	<br>
	<main class="row">
		<table>
			<tbody>
				<tr> 
					<td>
						<!-- 이미지 슬라이드 -->
						<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
					      <div class="carousel-indicators">
					      	<c:forEach var="img" items="${imgs}" varStatus="status">
								<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="active" aria-current="true"></button>			      		
					      	</c:forEach>
					      </div>
					      <div class="carousel-inner">
			          		<c:forEach var="img" items="${imgs}" varStatus="status">
						        <c:if test="${status.index eq 0 }">
							        <div class="carousel-item active">
										<img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="736" height="414" alt="img" src="<%=request.getContextPath() %>/reviewImg.do?originFileName=${img.originFileName}"/>
							        </div>
						        </c:if>
						        <c:if test="${status.index ne 0 }">
							        <div class="carousel-item">
										<img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="736" height="414" alt="img" src="<%=request.getContextPath() %>/reviewImg.do?originFileName=${img.originFileName}"/>
							        </div>
						        </c:if>
							</c:forEach>
					      </div>
					    </div>
						<div class="rated m-auto"> 
			          	  <input type="radio" name="rate" value="5" class="5" disabled="disabled"><label for="5">☆</label> 
			          	  <input type="radio" name="rate" value="4" class="4" disabled="disabled"><label for="4">☆</label> 
			          	  <input type="radio" name="rate" value="3" class="3" disabled="disabled"><label for="3">☆</label> 
			          	  <input type="radio" name="rate" value="2" class="2" disabled="disabled"><label for="2">☆</label> 
			          	  <input type="radio" name="rate" value="1" class="1" disabled="disabled"><label for="1">☆</label> 
		          	  	</div>
					</td>
				</tr>				
				<tr class="" style="border-top: 2px solid black;"> 
					<td> <h3>${review.title}</h3> </td>
				</tr>
				<tr> 
					<td>${review.content}</td>
				</tr>
				<tr>
					<td style="text-align: end;">
						<c:if test="${review.uidx eq login.uidx}">
							<a class="btn btn-sm" onclick="openModal();">수정</a>
							<a class="btn btn-sm">삭제</a>
						</c:if>
						<c:if test="${placeOne.uidx eq login.uidx}">
							<a class="btn btn-sm">블랙리스트 등록</a>
						</c:if>
						<a class="btn btn-sm">신고하기</a>
						<a class="btn btn-sm" onclick="history.back();">뒤로가기</a>
					</td>
				</tr>
			</tbody>
		</table>
	</main>
</div>
<footer id="footer" class="row mt-5"></footer>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 리뷰 별점 표현하기 -->
<script type="text/javascript">
	$(".${review.rate}").prop("checked", true);
</script>
<!-- 리뷰 수정 -->
<!-- summerNote -->
<script type="text/javascript">
$().ready(function(){
	$('#summernote').summernote({
	    lang: 'ko-KR',
	    placeholder: '내용',
	    toolbar: [
          ['font', ['bold', 'underline']],
          ['color', ['color']],
          ['para', ['ul', 'ol']],
	    ],
	    focus: true,
	    minHeight: 160,
	});
	$(".form-group.note-group-image-url").addClass("d-none");
	$(".note-form-label").addClass("d-none");
	$(".close").addClass("d-none");
});
</script>
<!-- modal -->
<script type="text/javascript">
function openModal(){
	const myModal = new bootstrap.Modal('#reviewModal', {});
	myModal.show();
}

function reviewModify(){
	var formData = new FormData($("#reviewModify")[0]);
	console.log(formData);
	$.ajax({
		url: "reviewModify.do",
		method: "POST",
		data: formData,
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		success: function(data){
			console.log("success");
			location.href='<%=request.getContextPath()%>/review/detail.do?rvidx=${review.rvidx}';
		},
		error: function(){
			console.log("error");
		}
	});
}
</script>
</body>
</html>




