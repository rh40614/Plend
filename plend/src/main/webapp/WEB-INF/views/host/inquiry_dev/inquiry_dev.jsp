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
	
	

	
	</head>
<body>

	<header id="header"></header>
	
	<main>
		
		<!-- 문의하기 -->
		<section style="margin-top: 100px;" >
			<span class="title1">운영자 문의- 문의 등록하기 </span>
			<br>
			<span class="spaceL">문의해주셔서 감사합니다. 
			<br>문의하시기 전에 <a href="inquiry_FAQ.do">FAQ</a>를 참고 해주시길 바랍니다. 자주 묻는 질문은 <a href="inquiry_FAQ.do">FAQ</a>에 올라와있습니다. 
			<br> 문의를 등록하신 이후에는 삭제가 불가능합니다. <a href="inquiry_FAQ.do">FAQ</a>를 먼저 확인해 주시길 바랍니다. 
			</span>
			<!-- 썸머노트 -->
			<div class="spaceL mt-2">
				<form action="inquiry_dev.do" method="POST" name="frm">
				<select name="category">
					<option value="place">장소</option>
					<option value="payment">결제</option>
					<option value="refund">환불</option>
					<option value="report">신고</option>
					
				</select>
					<span>문의제목 </span><input type="text" name="title" size="50" required>
					<textarea id="summernote" name="content" required></textarea> 
					<button type="submit" class="btnBig" onclick="insert()">문의 등록</button>
				</form>
			</div>
		</section >
			
		<!-- 이전 문의 내역 -->
		<section>	
			<span class="title1 mt-5" >이전 문의내역</span>	
				<div class=".table-responsive container " style="margin: 50px 0px 0px 100px;" >
					
					<table class="table table-hover text-center clearfix table-striped" >
						<thead class="">
							<tr style="text-al">
								<td>번호</td><td>유형</td><td>제목</td><td>답변여부</td><td>작성일</td>
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
										<tr >
											<td>${i.iqidx}</td>
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
									 <li class="page-item text-secondary active">
									 <a class="page-link text-secondary" href="inquiry_dev.do?nowPage=${p}">${p}</a></li>
								</c:when>
								<c:when test="${p != pagination.nowPage }">
									<li class="page-item text-secondary">
									 <a class="page-link text-secondary" href="inquiry_dev.do?nowPage=${p}">${p}</a></li>
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
	
	
	
</body>
</html>