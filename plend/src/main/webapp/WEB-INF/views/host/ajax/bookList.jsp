<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<table class="table table-hover text-center clearfix" >
	<thead class="table-dark">
		<tr style="text-al">
			<td class="col-md-1">No.</td>
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
		<td colspan="6">등록된 장소가 없습니다.</td>
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
					<td>승인 대기</td>
				</c:when>
				<c:when test="${pv.approvalYN eq 'Y'}">
					<td>승인 완료</td>
				</c:when>
			</c:choose>
			
			<td><button class="btnDefault" type="button" onclick="location.href='/host/placeDetail.do'">확인</button></td>
			<!-- 2022.07.15 김연희:
			 확인 버튼 누르면 예약정보 상세창이 팝업으로 뜨고  승인, 거절 버튼이 주어지고 
			 승인을 누르면 approval값 변경. 
			 승인 거절을 누르면 ajax로 팝업 화면을 변경해서
			 승인거절 항목(selectbox) 선택할 수 있도록하고 
			 승인 사유 적도록하기 
			 취소하기, 등록하기 버튼을 제공하고 등록을 누르면  
			 approval 변경 및 db에 승인 거절 사유 등록
			 취소를 누르면 예약정보 상세창이 뜨도록 하기  -->
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
				 <a class="page-link text-secondary" onclick="nowPage2(${p})">${p}</a></li>
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