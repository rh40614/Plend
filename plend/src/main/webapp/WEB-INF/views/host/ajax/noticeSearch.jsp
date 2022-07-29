<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

		<!-- 공지사항 -->
					<table class="table table-hover text-center clearfix " >
						<thead class="table-dark">
							<tr style="text-al">
								<td>번호</td><td>제목</td><td style="width: 10%">조회수</td><td style="width: 10%">작성일</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list.size() == 0}">	
								<tr>
									<td colspan="6">등록된 문의가 없습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${list.size() > 0}">
								<c:forEach var="n" items="${list}">
									<tr >
										<td style="width: 10%">${n.nidx}</td>
										<td style="text-align: left;"><a href="<%=request.getContextPath()%>/host/noticeView.do?nidx=${n.nidx}">${n.title}</a></td>
										<td>${n.hit}</td>
										<td>${n.date}</td>
									</tr>
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
					      		<a class="page-link" href="notice_dev.do?nowPage=4">&laquo;</a>
					    	</li>
					    </c:if>
					    
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="p">
							<c:choose>
								<c:when test="${p == pagination.nowPage }">
									 <li class="page-item text-secondary active">
									<a class="page-link text-secondary" href="notice_dev.do?nowPage=${p}&searchType=${pagination.searchType}&searchValue=${pagination.searchValue}">${p}</a></li>
								</c:when>
								<c:when test="${p != pagination.nowPage }">
									<li class="page-item text-secondary">
									<a class="page-link text-secondary" href="notice_dev.do?nowPage=${p}&searchType=${pagination.searchType}&searchValue=${pagination.searchValue}">${p}</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					
				    	<c:if test="${pagination.endPage != pagination.lastPage}">
						    <li class="page-item">
						      <a class="page-link" href="notice_dev.do?nowPage=${pagination.endPage +1}">&raquo;</a>
						    </li>
				    	</c:if>
					  </ul>
					</nav>
				</c:if> 
	<!-- 검색 -->	
	<script>
	function noticeSearch(){
		console.log("진입");
		var searchContent = $("form[name=frm]").serialize();
	
		
		console.log(searchContent);
		$.ajax({
			url:"noticeSearch.do",
			type: "GET",
			data: searchContent,
			success: function(data){
				console.log("검색성공");
				$("#afterSearch").html(data);
			},
			error: function(){
				console.log("검색실패");
			}
			
		});
	}
	</script>
		