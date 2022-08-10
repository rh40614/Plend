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
	          	<div class="mt-1">
	          		<c:forEach var="img" items="${imgs}">
	          			<button type="button" class="reviewImg btn btn-light">${img.originFileName}</button>
	          		</c:forEach>
	          		<input type="hidden" name="deleteImg" readonly/>
	          	</div>
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="resetDeleteImg()">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="reviewModify()">수정</button>
	      </div>
        </form>
	    </div>
	  </div>
	</div>
</div>
<!-- 리뷰신고 모달 -->
<div class="reportModal">
	<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
        <form id="reportUser">
	      <div class="modal-header justify-content-center">
	        <h5 class="modal-title" id="reportModalLabel">리뷰 신고하기</h5>
	      </div>
	      <div class="modal-body">
	          <div class="mb-3">
	          	<select class="form-select form-select-sm mb-1" name="category">
				  <option value="욕설,비방" selected>욕설/혐오/비방 글입니다.</option>
				  <option value="스팸,홍보">스팸/홍보/도배 글입니다.</option>
				  <option value="불법정보">불법정보입니다.</option>
				  <option value="개인정보남용">개인정보가 너무 많이 포함되어 있습니다.</option>
				  <option value="성적 표현">성적 표현이 있습니다.</option>
				</select>
	            <input name="rvidx" type="hidden" value="${review.rvidx}" readonly> 
	            <input name="respondent_uidx" type="hidden" value="${review.uidx}" readonly> 
	            <textarea name="content" id="summernote2" required>내용</textarea>
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="reportUser();">신고하기</button>
	      </div>
        </form>
	    </div>
	  </div>
	</div>
</div>
<!-- 유저 블랙리스트 모달 -->
<div class="blockModal">
	<div class="modal fade" id="blockModal" tabindex="-1" aria-labelledby="blockModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
        <form id="blockUser">
	      <div class="modal-header justify-content-center">
	        <h5 class="modal-title" id="blockModalLabel">유저 블랙리스트 등록하기</h5>
	      </div>
	      <div class="modal-body">
	          <div class="mb-3">
	          	<select class="form-select form-select-sm mb-1" name="category">
				  <option value="욕설,비방" selected>악의적인 글입니다.</option>
				  <option value="스팸/홍보">스팸/홍보/도배 글입니다.</option>
				  <option value="장소사용문제">장소 사용에 문제점이 있습니다.</option>
				  <option value="불법정보">불법정보입니다.</option>
				  <option value="성적표현">성적 표현이 있습니다.</option>
				</select>
	            <input name="respondent_uidx" type="hidden" value="${review.uidx}" readonly> 
	            <textarea name="content" id="summernote3" required>내용</textarea>
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="blockUser();">등록하기</button>
	      </div>
        </form>
	    </div>
	  </div>
	</div>
</div>
<!-- Main Body -->
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
							<a class="btn btn-sm" onclick="reviewDelete();">삭제</a>
						</c:if>
						<c:if test="${placeOne.uidx eq login.uidx}">
							<a class="btn btn-sm" onclick="openBlockModal();">블랙리스트 등록</a>
						</c:if>
						<c:if test="${login ne null}">
							<a class="btn btn-sm" onclick="openReportModal();">신고하기</a>
						</c:if>
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
	
	$('#summernote2').summernote({
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
	
	$('#summernote3').summernote({
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
	$.ajax({
		url: "reviewModify.do",
		method: "POST",
		data: formData,
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		success: function(data){
			console.log("success");
			location.replace("<%=request.getContextPath()%>/review/detail.do?rvidx=${review.rvidx}");
		},
		error: function(){
			console.log("error");
		}
	});
}
</script>
<!-- modal deleteimg 추가 -->
<script type="text/javascript">
	var imgName = '';
	$(".reviewImg").click(function(){
		imgName += $(this).text() + '/';
		$(this).hide();
		$("input[name='deleteImg']").val(imgName);
	});
</script>
<!-- modal deleteimg 초기화 -->
<script type="text/javascript">
	function resetDeleteImg() {
		var imgName = '';
		$("input[name='deleteImg']").val('');
		$(".reviewImg").show();
	}
</script>
<!-- 리뷰삭제 -->
<script type="text/javascript">
	function reviewDelete(){
		if (window.confirm("정말로 삭제하시겠습니까?")) {
			location.replace('<%=request.getContextPath()%>/review/reviewDelete.do?rvidx=${review.rvidx}');
		}
	}
</script>
<!-- 리뷰신고 -->
<!-- 리뷰신고 ajax -->
<script type="text/javascript">
const reportModal = new bootstrap.Modal('#reportModal', {});
function openReportModal(){
	reportModal.show();
}

function reportUser(){
	var formData = $("#reportUser").serialize();
	$.ajax({
		url: "reportUser.do",
		method: "POST",
		data: formData,
		success: function(data){
			reportModal.hide();
			alert("신고가 접수되었습니다.");
		},
		error: function(){
			console.log("error");
		}
	});
}
</script>
<!-- 유저 블랙 리스트 -->
<script type="text/javascript">
const blockModal = new bootstrap.Modal('#blockModal', {});
function openBlockModal(){
	blockModal.show();
}

function blockUser(){
	var formData = $("#blockUser").serialize();
	$.ajax({
		url: "<%= request.getContextPath()%>/host/blockUser.do",
		method: "POST",
		data: formData,
		success: function(data){
			blockModal.hide();
			alert("블랙 리스트로 등록되었습니다.");
		},
		error: function(){
			console.log("error");
		}
	});
}
</script>
<!-- modal deleteimg 추가 -->
<script type="text/javascript">
	var imgName = '';
	$(".reviewImg").click(function(){
		imgName += $(this).text() + '/';
		$(this).hide();
		$("input[name='deleteImg']").val(imgName);
	});
</script>
<!-- modal deleteimg 초기화 -->
<script type="text/javascript">
	function resetDeleteImg() {
		var imgName = '';
		$("input[name='deleteImg']").val('');
		$(".reviewImg").show();
	}
</script>
<!-- 리뷰삭제 -->
<script type="text/javascript">
	function reviewDelete(){
		if (window.confirm("정말로 삭제하시겠습니까?")) {
			location.replace('<%=request.getContextPath()%>/review/reviewDelete.do?rvidx=${review.rvidx}');
		}
	}
</script>
</body>
</html>




