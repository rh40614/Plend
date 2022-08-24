<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<!-- 2022.07.10 김연희 : summerNote 넣으면서 기준 폰트 작아짐. html 전체에  initial을 주어서 초기화. -->
<html style=" font-size: initial;">
<head>
<meta charset="UTF-8">
<title>Hostcenter-운영자 문의</title>
	
	
	<!-- summerNote 제이쿼리랑 부트스트랩이 포함되어있음-->
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summerNote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<!-- jQuery -->
	<%-- <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>  --%>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- bootstrap  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- 공통 css -->
	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
		
	
	<!-- 프론트 디자인 -->
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/hostfooter.jsp");
		})
	</script>


	
	</head>
<body>

	<header id="header"></header>
	
	<main>
		
		<!-- 문의하기 -->
		<section style="margin-top: 100px;" >
			<span class="title1">운영자 문의- 문의 등록하기 </span>
			<br>
			<span class="spaceL">문의해주셔서 감사합니다. 
			<br>문의하시기 전에 <a style="text-decoration:underline;" href="inquiry_FAQ.do">FAQ</a>를 참고 해주시길 바랍니다. 자주 묻는 질문은 <a style="text-decoration:underline;" href="inquiry_FAQ.do">FAQ</a>에 올라와있습니다. 
			<br> 문의를 등록하신 이후에는 삭제가 불가능합니다. <a style="text-decoration:underline;" href="inquiry_FAQ.do">FAQ</a>를 먼저 확인해 주시길 바랍니다. 
			</span>
			<br>
			<!-- 썸머노트 -->
			<div class="spaceL mt-2">
				
				<form action="inquiry_dev.do" method="POST" name="frm" enctype="multipart/form-data">
					<select name="category" class="me-3" required>
						<option value="장소">장소</option>
						<option value="결제">결제</option>
						<option value="환불">환불</option>
						<option value="신고">신고</option>
					</select>
					<span class="mb-3">문의제목 : </span><input class="mb-3" type="text" name="title" id="title" size="70" required maxlength="50">
					<textarea id="summernote" name="content" required></textarea> 
					<div style="float: right;">
						<button type="submit" class="btnBig" onclick="insert()">문의 등록</button>
					</div>
				</form>
			</div>
		</section >
			
			
			
		<!-- 이전 문의 내역 -->
		<hr style="width: 1300px; color: grey; margin-left: 170px;"  >
		<section id="pagingTable" class="mt-5" >	
			
			<span class="title1 mt-5" >이전 문의내역</span>	
				
				<div class="table-responsive container d-flex flex-column" style="margin: 50px 0px 0px 100px; ">
					<div class="d-flex flex-column" style ="height: 300px;">
					<table class="table  table-hover text-center clearfix ">
						<thead>
							<tr class="table-dark">
								<td class="col-md-1">번호</td>
								<td class="col-md-2">유형</td>
								<td class="col-md-5">제목</td>
								<td class="col-md-2">답변여부</td>
								<td class="col-md-2">작성일</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list.size() == 0}">
								<tr>
									<td colspan="6">등록된 문의가 없습니다.</td>
								</tr>
							</c:if> 
							<c:if test="${list.size() > 0}">
								<c:forEach var="i" items="${list}">
									<c:if  test="${i.uidx == login.uidx }">
										<tr>
											<td>${i.rnum}</td>
											<td>${i.category}</td>
											<td style="text-align: left;"><a href="<%=request.getContextPath()%>/inquiry_dev/inquiryView_dev.do?iqidx=${i.iqidx}&uidx=${i.uidx}">${i.title}</a></td>
											<c:if test="${i.answerYN eq 'Y'}">
												<td>답변 완료</td>
											</c:if>
											<c:if test="${i.answerYN eq 'N'}">
												<td>답변 대기</td>
											</c:if>
											<td>${i.date}</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<!-- 페이징 -->
				<c:if test="${not empty list}">
					<nav aria-label="Page navigation example" class="m-auto">
					  <ul class="pagination justify-content-center " >
					  	
						<c:if test="${pagination.startPage > 5}">
							<li class="page-item">
					      		<a class="page-link" href="inquiry_dev.do?nowPage=4">&laquo;</a>
					    	</li>
					    </c:if>
					    
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="p">
							<c:choose>
								<c:when test="${p == pagination.nowPage }">
									 <li class="page-item text-secondary  " >
									 <a class="page-link text-secondary activePage" onclick="nowPage(${p})" <%-- href="inquiry_dev.do?nowPage=${p}" --%>>${p}</a></li>
								</c:when>
								<c:when test="${p != pagination.nowPage }">
									<li class="page-item text-secondary">
									 <a class="page-link text-secondary" onclick="nowPage(${p})" <%-- href="inquiry_dev.do?nowPage=${p}" --%>>${p}</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
				    	<c:if test="${pagination.endPage != pagination.lastPage}">
						    <li class="page-item">
						      <a class="page-link" href="inquiry_dev.do?nowPage=${pagination.endPage +1}">&raquo;</a>
						    </li>
				    	</c:if>
					  </ul>
					</nav>
				</c:if>
			</div>
		</section>
	
		

	</main>
	
	<footer id="footer"></footer>
	
	<script>
		function nowPage(p){
			$.ajax({/* 이전문의 내역 부분만 분리하기  */
				url: "<%=request.getContextPath()%>/inquiry_dev/inquiryPaging.do",
				type: "GET",
				data: "nowPage="+p,
				success: function(data){
					//console.log("에이작스 페이징");
					$("#pagingTable").html(data);
				},
				error: function(){
					console.log("페이징 실패");
				}
				
			});
		}
		
	</script>
		
	<!-- 썸머노트 -->
	<script type="text/javascript">
		$(document).ready(function() {
 			$('#summernote').summernote({
 				width: 1250,
	 			height: 400,		// 기본 높이값
			    minHeight: 450,		// 최소 높이값(null은 제한 없음)
			    maxHeight: null,  	// 최대 높이값(null은 제한 없음)
			    focus: true,          // 페이지가 열릴때 포커스를 지정함
			    placeholder: '문의를 작성해주세요.',
			    lang: 'ko-KR'
			    
 			});
		}); 
		
		
	</script>
	
	
</body>
</html>