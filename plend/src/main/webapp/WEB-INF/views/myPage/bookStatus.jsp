<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>plend</title>
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	<!-- include libraries(jQuery, bootstrap) -->
	<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
	<script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- summernote -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>	

	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/bookStatus.css" rel="stylesheet">
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer_mypage.jsp");
		})
	</script>
	<!-- modal style -->
	<style type="text/css">
		.rating {
		   display: inline-flex;
		    margin-top: -10px;
		    flex-direction: row-reverse;
		}
		
		.rating>input {
		    display: none
		}
		
		.rating>label {
		    position: relative;
		    width: 28px;
		    font-size: 35px;
		    color: #ffc107;
		    cursor: pointer;
		}
		
		.rating>label::before {
		    content: "\2605";
		    position: absolute;
		    opacity: 0
		}
		
		.rating>label:hover:before,
		.rating>label:hover~label:before {
		    opacity: 1 !important
		}
		
		.rating>input:checked~label:before {
		    opacity: 1
		}
		
		.rating:hover>input:checked~label:before {
		    opacity: 0.4
		}
		
		.btn-primary {
			background-color: #2F506D !important;
		 	border-color: #2F506D !important;
		 	color: white !important;
		}
		.btn-light.active {
			background-color: #6c757d!important;
		}
	</style>
</head>

<body>
<!-- modal -->
<div class="reviewModal">
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reivewModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
        <form id="addReview">
	      <div class="modal-header justify-content-center">
	        <h5 class="modal-title" id="reivewModalLabel">이용후기</h5>
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
	            <input name="title" type="text" class="form-control" id="recipient-name" placeholder="제목">
	            <br>
	            <input name="pidx" type="hidden" class="pidx">
	            <input name="bidx" type="hidden" class="bidx">
	            <input name="uidx" type="hidden" value="${login.uidx}"> 
	            <textarea name="content" id="summernote" required></textarea>
	            <br>
	          	<input type="file" name="reviewImgs" id="reviewImgs" multiple="multiple">
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="addReview()">등록</button>
	      </div>
        </form>
	    </div>
	  </div>
	</div>
</div>
<div id="wrap">	
	<header id="header" style = "height:0;"></header>
   	<br>
   	<div style="display:flex;  min-height: 800px;">
   	<nav style="display: flex;flex-direction: column;width:11%;margin-top:72px;background: #CFCFCF">
   		<div id = "MyPageBox">
   			<br>
   			<br>
     		<h4>My Page</h4>
    	</div>
    	<div>
 		<ul id = "naviBar">
     	<!-- 나중에 해당링크 들어간 곳 글씨 진하게하는 css 추가하기 -->
 		 <li><a href="myInfo.do?uidx=${login.uidx}" id = "select">내 정보</a></li>
 		 <li><a href="#" id = "select">쿠폰 등록</a></li>
  		 <li><a href="bookStatus.do?uidx=${login.uidx}" id = "select"><strong>예약 현황</strong></a></li>
 		 <li><a href="heartList.do?uidx=${login.uidx}" id = "select">찜 목록</a></li>
 		 <li><a href="myReviewList.do?uidx=${login.uidx}" id = "select">마이 리뷰</a></li>
 		 <li><a href="withdraw.do?uidx=${login.uidx}" id = "select">회원 탈퇴</a></li>
 		 <br>
	    </ul>
	    </div>
   	</nav>
   	
   	
   <div id = "bookBox">
		<h5><strong>| 예약 현황</strong></h5>
		<br>
		<c:forEach var = "vo" items = "${list}">
		<c:if test = "${vo.successBook ne 'Y' }">
		<div id = "bookView">
			<table>
				<tr>
					<th>장소 이름 : </th>
					<td><a href = "bookDetail.do?bidx=${vo.bidx }"><strong>${vo.placeName }</strong></a></td>
				</tr>
				<tr>
					<th>이용 날짜 :</th>
					<td>${vo.useTime }</td>
				</tr>
				<tr>
					<th>이용 인원 : </th>
					<td>${vo.cntPeople }명</td>
				</tr>
				<tr>
					<th>금액 : </th>
					<td><fmt:formatNumber value="${vo.price }" type="currency"/>원</td>
				</tr>
				<tr>
					<th>업체 승인 여부 : </th>
					<c:if test ="${vo.approvalYN eq 'N'}">
					<td>승인 대기 중</td>
					</c:if>
					<c:if test ="${vo.approvalYN eq 'Y'}">
					<td>승인 완료</td>
					</c:if>
					<c:if test ="${vo.approvalYN eq 'R'}">
					<td style ="color:red"><strong>반려</strong></td>
					</c:if>
				</tr>
				<c:if test ="${vo.rejectContent ne '거절 사유 없음'}">
				<tr>
					<th>반려 사유 : </th>
					<td>${vo.rejectContent}</td>
				</tr>
				</c:if>
			</table>
		</div>
		<br>
		</c:if>
		</c:forEach> 
		<hr style = "height:2px;background:black;">
		<h5><strong>| 이용 리스트</strong></h5>
		<br>
		<c:forEach var = "vo" items = "${list2}">
		<c:if test = "${vo.successBook  ne 'N' }">
		<div id = "bookView">
			<table>
				<tr>
					<th>장소 이름 : </th>
					<td><a href = "bookDetail.do?bidx=${vo.bidx }"><strong>${vo.placeName }</strong></a></td>
				</tr>
				<tr>
					<th>이용 날짜 :</th>
					<td>${vo.useTime }</td>
				</tr>
				<tr>
					<th>이용 인원 : </th>
					<td>${vo.cntPeople }명</td>
				</tr>
				<tr>
					<th>금액 : </th>
					<td><fmt:formatNumber value="${vo.price }" type="currency"/>원</td>
				</tr>
				<tr>
					<th>업체 승인 여부 : </th>
					<c:if test ="${vo.approvalYN eq 'N'}">
					<td>승인 대기 중</td>
					</c:if>
					<c:if test ="${vo.approvalYN eq 'Y'}">
					<td>승인 완료</td>
					</c:if>
					<c:if test ="${vo.approvalYN eq 'R'}">
					<td style ="color:red"><strong>반려</strong></td>
					</c:if>
				</tr>
				<c:if test ="${vo.rejectContent ne '거절 사유 없음'}">
				<tr>
					<th>반려 사유 : </th>
					<td>${vo.rejectContent}</td>
				</tr>
				</c:if>
			</table>
			</div>
			<br>
		</c:if>
		</c:forEach>
		<br>
		<c:if test="${not empty list2}">
			<nav id="pagenation" class="row">
			  <ul class="pagination justify-content-center">
			  	<c:if test="${pagenation.startPage > 5}">
				    <li class="page-item">
				      <a class="page-link" href="bookStatus.do?nowPage=4">&laquo;</a>
				    </li>
			  	</c:if>
			  	<c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="p">
					<c:choose>
						<c:when test="${p == pagenation.nowPage }">
							<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="bookStatus.do?nowPage=${p}">${p}</a></li>
						</c:when>
						<c:when test="${p != pagenation.nowPage }">
							<li class="page-item"><a class="page-link" href="bookStatus.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			    <c:if test="${pagenation.endPage != pagenation.lastPage}">
				    <li class="page-item">
				      <a class="page-link" href="bookStatus.do?nowPage=${pagenation.endPage +1}">&raquo;</a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</c:if>
   </div>
   </div>
<div style="margin-top: -48px;">
<footer id="footer" class="mt-5" style = "float:none;display:inline-block;"></footer>
</div>
</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 썸머노트 이용시간이 끝났으면서 리뷰를 쓰지않은 가장최근 장소에 대해 리뷰 모달창을 띄운다. -->
<c:set var="loop" value="true"/>
<c:forEach var="findReviewN" items="${list2}">
	<c:if test="${loop}">
		<c:if test="${findReviewN.reviewYN eq 'N' && findReviewN.successBook eq 'Y'}">
			<script type="text/javascript">
			const myModal = new bootstrap.Modal('#reviewModal', {});
			myModal.show();
			$("#reivewModalLabel").html("${findReviewN.placeName} 이용후기");
			$(".pidx").val('${findReviewN.pidx}');
			$(".bidx").val('${findReviewN.bidx}');
			
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
			<c:set var="loop" value="false"/>
		</c:if>
	</c:if>
</c:forEach>
<!-- 리뷰등록 ajax -->
<script type="text/javascript">
	function addReview(){
		var formData = new FormData($("#addReview")[0]);
		console.log(formData);
		$.ajax({
			url: "addReview.do",
			method: "POST",
			data: formData,
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			success: function(data){
				console.log("success");
				myModal.hide();
			},
			error: function(){
				console.log("error");
			}
		});
	}
</script>
</body>
</html>




