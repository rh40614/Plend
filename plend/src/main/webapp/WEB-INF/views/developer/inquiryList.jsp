<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- 07.13 김영민 뷰제작 -->
<html>
<head>
	<meta charset="UTF-8">
	<title>업체 문의내역</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/developer.css" rel="stylesheet">
	
	<!-- include summerNote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<!-- header, footer -->	
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
					<p class="h5 fw-bold category-title"> 업체 문의 내역 </p>
				</div>
			</div>
			<section class="row px-1">
				<table class="col table text-center table-hover">
				  <thead class="table-dark">
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">업체명</th>
				      <th scope="col">유형</th>
				      <th scope="col">제목</th>
				      <th scope="col">답변 여부</th>
				      <th scope="col">등록일</th>
				      <th scope="col">답변</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:if test="${empty list}">
				  		<tr>
				  			<td colspan="7"> 아직 등록된 문의가 없습니다. </td>
				  		</tr>
				  	</c:if>
				  	<c:forEach var="inquiryVO" items="${list}">
				  		<tr>
				  			<td> ${inquiryVO.iqidx} </td>
				  			<td> ${inquiryVO.nickName} </td>
				  			<td> ${inquiryVO.category} </td>
				  			<td> ${inquiryVO.title} </td>
				  			<td> ${inquiryVO.answerYN} </td>
				  			<td> ${inquiryVO.date.substring(0,10)} </td>
					  		<td class="col-2">
					  			<c:choose>
					  				<c:when test="${inquiryVO.answerYN eq 'N'}">
							  			<a onclick="replyOpen(${inquiryVO.uidx},${inquiryVO.iqidx})" class="btn btn-sm">답변</a>
					  				</c:when>
					  				<c:when test="${inquiryVO.answerYN ne 'N'}">
							  			<a onclick="replyOpen(${inquiryVO.uidx},${inquiryVO.iqidx})" class="btn btn-sm">수정</a>
					  				</c:when>
					  			</c:choose>
					  		</td>
				  		</tr>
				  		<tr>
				  			<td id="viewOne${inquiryVO.iqidx}" class="replyTD d-none" colspan="7"></td>
				  		</tr>
				  		<tr>
				  			<td id="reply${inquiryVO.iqidx}" class="replyTD d-none" colspan="7"></td>
				  		</tr>
				  	</c:forEach>
				  </tbody>
				</table>
			</section>
			<c:if test="${not empty list}">
				<nav id="pagenation" class="row">
				  <ul class="pagination justify-content-center">
				  	<c:if test="${pagination.startPage > 5}">
					    <li class="page-item">
					      <a class="page-link" href="inquiryList.do?nowPage=4">&laquo;</a>
					    </li>
				  	</c:if>
				  	<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="p">
						<c:choose>
							<c:when test="${p == pagination.nowPage }">
								<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="inquiryList.do?nowPage=${p}">${p}</a></li>
							</c:when>
							<c:when test="${p != pagination.nowPage }">
								<li class="page-item"><a class="page-link" href="inquiryList.do?nowPage=${p}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				    <c:if test="${pagination.endPage != pagination.lastPage}">
					    <li class="page-item">
					      <a class="page-link" href="inquiryList.do?nowPage=${pagination.endPage +1}">&raquo;</a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</c:if>
			<form action="inquiryList.do" method="get">
				<div class="row search-form mb-5">
					<div class="input-group justify-content-center">
						<select class="form-select-sm" name="searchType">
		  					<option value="nickName">업체명</option>
							<option value="title">제목</option>
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
<!-- 답변창 오픈 함수 -->
<script type="text/javascript">
	function replyOpen(uidx,iqidx){
		console.log("답변 창 오픈");
	
		$.ajax({
			url: "replyInquiry.do?uidx="+uidx+"&iqidx="+iqidx,
			success: function(html){
				console.log("답변 창 오픈 성공");
				$(".replyTD").addClass("d-none");
				$("#reply"+iqidx).removeClass("d-none");
				$("#reply"+iqidx).html(html);
				$.ajax({
					url:"<%= request.getContextPath()%>/inquiry_dev/inquiryViewOne.do?uidx="+uidx+"&iqidx="+iqidx,
					success: function(html){
						$("#viewOne"+iqidx).removeClass("d-none");
						$("#viewOne"+iqidx).html(html);
					},
					error: function(){
						console.log("답변 창 오픈 실패");
					}
				});
			},
			error: function(){
				console.log("답변 창 오픈 실패");
			}
		});
		

	}
</script>
</body>
</html>




