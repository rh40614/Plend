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
	
		
	<!-- jQuery --><!-- 2022.07.22 김연희 summernote랑 충돌 -->
	<%-- <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script> --%>
	
	
	<!-- bootstrap  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- 공통 css -->
	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
		
	
	<script type="text/javascript">
	//프론트 디자인
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/hostfooter.jsp");
		})
	</script>

	<!-- 수정하기 -->
	<script>
		function inquiryEdit_dev(obj){
			
			$.ajax({
				url:"inquiryEdit_dev.do?iqidx=" + $(obj).val(),
				type: "GET", 
				success: function(edit){
					console.log($(obj).val());
					$("#inquiryEdit_dev").html(edit);
				}
			});
		}
	</script>

	<!-- 답변 달기 -->
	<script>
		function replyOpen(obj){
			console.log("답변 창 오픈");

			$.ajax({
				url: "reply.do",
				type: "GET",
				data: "iqidx="+ obj,
				success: function(html){
					console.log("답변 창 오픈 성공");
					$("#reply").html(html);
				},
				error: function(){
					console.log("답변 창 오픈 실패");
				}
			})
		}
		
	</script>

	
	
</head>
<body>

	<header id="header"></header>
	
	<main>
		<!-- 이전 문의 내역 -->
		<section id="pagingTable" class="mt-5" >	
			<span class="title1 mt-5" >이전 문의내역</span>	
				
				<div class=".table-responsive container d-flex flex-column" style="margin: 50px 0px 0px 100px; ">
					<div class="d-flex flex-column" style ="height: 300px;">
					<table class="table table-hover text-center clearfix table-striped"  >
						<thead>
							<tr>
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
									 <li class="page-item text-secondary "  style="background: #dfe1e2;">
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
			
		<div style="text-align: right;">
			<button class="btnBig" onclick="location.href='<%=request.getContextPath()%>/inquiry_dev/inquiry_dev.do'">문의 작성하기</button>
		</div>
		
		<hr  style="margin-left:200px;">
		
		
		<!-- 문의 내용 -->
		<div id="inquiryEdit_dev" class="mt-5">
		<section>
			<span class="title1 spaceL">문의 내용  </span>
			<br>
			
			<table class="table spaceL" style="width: 90%" >
				<tbody>
					<%-- <tr>
						<td colspan="2" class="fs-5"  style="padding: 30px;">${inquiry.title}</td>
					</tr> --%>
					<tr>
						<td class="ps-4 pe-2" style="width: 80px;">유형 : </td>
						<td>${inquiry.category}</td>
					</tr>
					<tr>
						<td class="ps-4 pe-2" style="width: 80px;">제목 : </td>
						<td>${inquiry.title}</td>
					</tr>
					<tr>
						<td class="ps-4 pe-2 text-break" style="width: 100px; vertical-align: top;">내용 :</td>
						<td style ="height: 400px; min-width:80% ">${inquiry.content}</td>
					</tr>
				</tbody>
			</table>
				<br>
				<span class="spaceL mb-5 " style="font-size: 12px;">답변이 달린 이후에는 수정이 불가능합니다. </span>
				<div class="d-flex w-100 " role="group" id="btnGroup" style="text-align: right; justify-content: flex-end " >
					<c:if test="${inquiry.answerYN eq 'N'}">
						<button class="btnDefault me-3" type="button" onclick="inquiryEdit_dev(this)" value="${inquiry.iqidx}">수정</button>
					</c:if>
				</div>
		</section>
		</div>
		
		<!-- 답변 확인 -->
		<div id="reply">
			<section>
			<hr class="w-100 " >
				<br>
					<c:if test="${inquiry.answerYN eq 'N' }">
						<p style="margin: auto; text-align: center;">아직 답변이 작성되지 않았습니다.<br> 문의사항에 대한 답변은 평균 1-7일내에 관리자의 확인 후 확인하실 수 있습니다.<br> 더 궁금하신 점이 있다면 1588-0000번으로 문의 부탁드립니다. 감사합니다.</p>
					</c:if>
				<c:if test="${inquiry.answerYN eq 'Y'}">
					<span class="title1 spaceL">답변 확인 </span>
					<span class="spaceL"> 추가적인 문의사항은 새로운 문의를 통하여 질문해 주시길 바랍니다.</span>
					<table class="spaceL border border-3 rounded w-75 h-75" style="border-collapse: initial;" >
						<tbody>
							<tr>
								<td class="ps-4 pe-2" style="width: 80px;">제목 : </td><td>${answer.title}</td>
							</tr>
							<tr>
								<td class="ps-4 pe-2 " style="width: 80px; vertical-align: top;">내용 :</td>
								<td>${answer.content}</td>
							</tr>
							<c:if test="${login.role == 1 }">
								<tr>
									<td><button class="btn btn-sm" onclick="history.back();">되돌아가기</button></td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</c:if>
			</section>
		</div>
	
	</main>
	
	<footer id="footer"></footer>
	
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- 이전 문의 내력 -->
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
</body>
</html>