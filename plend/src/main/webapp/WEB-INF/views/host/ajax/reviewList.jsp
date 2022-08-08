<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

	<table class="table table-hover text-center clearfix" >
		<thead class="table-dark">
			<tr style="text-al">
				<td class="col-md-1">번호</td>
				<td class="col-md-2">장소</td>
				<td class="col-md-1">평점</td>
				<td class="col-md-6">후기</td>
				<td class="col-md-1">아이디</td>
				<td class="col-md-1">작성일</td>
			</tr>
		<thead>
		<tbody>
			<c:if test="${list_r.size() == 0}">	
				<tr>
					<td colspan="6">등록된 장소가 없습니다.</td>
				</tr>
			</c:if>
			<!--  -->
			<c:if test="${list_r.size() > 0}">
				<c:forEach var="pv" items="${list_r}">
					<tr >
						<td>${pv.rnum}</td>
						<td><a href="<%=request.getContextPath()%>/place/view.do?pidx=${pv.pidx}#review">${pv.placeName}</a></td>
						<td><i class="fa-regular fa-star"> ${pv.rate}</i></td>
						<td style="text-align: left;"><a href="<%=request.getContextPath()%>/place/view.do?pidx=${pv.pidx}#review">${pv.title}</a></td>
						<td>${pv.nickName}</td>
						<td>${pv.date}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
<!-- 페이징 -->
	<c:if test="${not empty list_r}">
		<nav aria-label="Page navigation example" style="margin-bottom: 0px!important;">
		  <ul class="pagination justify-content-center " >
		  	
			<c:if test="${pagination3.startPage > 5}">
				<li class="page-item">
		      		<a class="page-link" onclick="nowPage3(4)">&laquo;</a>
		    	</li>
		    </c:if>
		    
			<c:forEach begin="${pagination3.startPage}" end="${pagination3.endPage}" var="p">
				<c:choose>
					<c:when test="${p == pagination3.nowPage }">
						 <li class="page-item text-secondary">
						 <a class="page-link text-secondary" onclick="nowPage3(${p})">${p}</a></li>
					</c:when>
					<c:when test="${p != pagination3.nowPage }">
						<li class="page-item text-secondary">
						 <a class="page-link text-secondary" onclick="nowPage3(${p})">${p}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
		
	    	<c:if test="${pagination3.endPage != pagination3.lastPage}">
			    <li class="page-item">
			      <a class="page-link" onclick="nowPage3(${pagination3.endPage +1})">&raquo;</a>
			    </li>
	    	</c:if>
		  </ul>
		</nav>
	</c:if>
	

			
			
	<!-- 예약 페이징 -->
	<script>
	function nowPage3(p){
		$.ajax({
			url: "reviewList.do",
			type: "GET",
			data: "nowPage="+p,
			success: function(data){
				console.log("에이작스 페이징");
				$("#reviewList").html(data);
			},
			error: function(){
				console.log("예약 페이징 실패");
			}
			
		});
	}
		
	</script>