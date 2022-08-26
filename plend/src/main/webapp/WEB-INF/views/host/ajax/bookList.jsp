<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<table class="table table-hover text-center clearfix" >
	<thead class="table-dark">
		<tr style="text-al">
			<td class="col-md-1">번호</td>
			<td class="col-md-1">예약번호</td>
			<td class="col-md-2">플레이스명</td>
			<td class="col-md-3">기간</td>
			<td class="col-md-1">인원</td>
			<td class="col-md-2">예약자</td>
			<td class="col-md-1">승인여부</td>
			<td class="col-md-1">승인</td>
		</tr>
	<thead>
	<tbody>
		<c:if test="${list_b.size() == 0}">	
	<tr>
		<td colspan="8">등록된 예약이 없습니다. </td>
	</tr>
	</c:if>
	<!--  -->
	<c:if test="${list_b.size() > 0}">
	<c:forEach var="pv" items="${list_b}" >
		<tr>
			<td>${pv.rnum}</td>
			<td>${pv.bidx}</td>
			<td>${pv.placeName}</td>
			<td>${pv.useTime}</td>
			<td>${pv.cntPeople}</td>
			<td>${pv.nickName}</td>
			 <c:choose>
				<c:when test="${pv.approvalYN eq 'N'}">
					<td id="approvalN${pv.bidx}">승인 대기</td>
				</c:when>
				<c:when test="${pv.approvalYN eq 'Y'}"> 
					<td id="approvalY${pv.bidx}">승인 완료</td>
				</c:when>
				<c:when test="${pv.approvalYN eq 'R'}"> 
					<td id="approvalR${pv.bidx}">승인 거절</td>
				</c:when>
			</c:choose> 
			<td id="canclebtn${pv.bidx}"><button class="btnDefault" type="button" onclick="approval(${pv.bidx})" id="approvalBtn${pv.bidx}">확인</button></td>
		</tr>
	</c:forEach>
	</c:if>
		</tbody>
	</table>
	
		<!-- 페이징 -->
	<c:if test="${not empty list_b}">
	<nav aria-label="Page navigation example" style="margin-bottom: 0px!important;">
	  <ul class="pagination justify-content-center " >
	  	
		<c:if test="${pagination2.startPage > 5}">
		<li class="page-item">
	     		<a class="page-link" onclick="nowPage2(4)">&laquo;</a>
	   	</li>
	   </c:if>
	   
	<c:forEach begin="${pagination2.startPage}" end="${pagination2.endPage}" var="p">
		<c:choose>
			<c:when test="${p == pagination2.nowPage }">
				 <li class="page-item text-secondary">
				 <a class="page-link text-secondary activePage" onclick="nowPage2(${p})">${p}</a></li>
			</c:when>
			<c:when test="${p != pagination2.nowPage }">
				<li class="page-item text-secondary">
				 <a class="page-link text-secondary" onclick="nowPage2(${p})">${p}</a></li>
			</c:when>
		</c:choose>
	</c:forEach>
	
	  	<c:if test="${pagination2.endPage != pagination2.lastPage}">
	    <li class="page-item">
	      <a class="page-link" onclick="nowPage2(${pagination2.endPage +1})">&raquo;</a>
	    </li>
	  	</c:if>
	  </ul>
	</nav>
	</c:if>
	

			
			
	<!-- 예약 페이징 -->
	<script>
	function nowPage2(p){
		$.ajax({
			url: "bookList.do",
			type: "GET",
			data: "nowPage="+p,
			success: function(data){
				console.log("에이작스 페이징");
				$("#bookList").html(data);
			},
			error: function(){
				console.log("예약 페이징 실패");
			}
			
		});
	}
	</script>
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	