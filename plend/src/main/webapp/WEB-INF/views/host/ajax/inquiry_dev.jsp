<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<span class="title1 mt-5" >이전 문의내역</span>	
	<div class=".table-responsive container d-flex flex-column" style="margin: 50px 0px 0px 100px;"  >
		<div class="d-flex flex-column" style ="height: 300px;">
		<table class="table table-hover text-center clearfix table-striped" >
			<thead class="">
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
							<tr style="height: 30px!important;">
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
						 <li class="page-item text-secondary  "  style="background: #dfe1e2;">
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