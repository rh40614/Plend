<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


	<table class="table table-hover text-center clearfix" >
		<thead class="table-dark">
			<tr style="text-al">
				<td class="col-md-1">번호</td>
				<td class="col-md-1">카테고리</td>
				<td class="col-md-2">플레이스명</td>
				<td class="col-md-3">태그</td>
				<td class="col-md-1">승인여부</td>
				<td class="col-md-1">수정</td>
			</tr>
		<thead>
		<tbody>
			<c:if test="${list_p.size() == 0}">	
				<tr>
					<td colspan="6">등록된 장소가 없습니다.</td>
				</tr>
			</c:if>
			<!--  -->
			<c:if test="${list_p.size() > 0}">
				<c:forEach var="pv" items="${list_p}" >
					<tr>
						<td class="col-md-1">${pv.rnum}</td>
						<c:choose>
				    		<c:when test="${pv.category == 'gallery'}">
					    		<td class="col-md-1">갤러리</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'homeGym'}">
					    		<td class="col-md-1">운동시설</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'meeting'}">
					    		<td class="col-md-1">회의실</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'dancePractice'}">
					    		<td class="col-md-1">댄스연습실</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'office'}">
					    		<td class="col-md-1">오피스</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'shareOffice'}">
					    		<td class="col-md-1">공유오피스</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'partyRoom'}">
					    		<td class="col-md-1">파티룸</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'recording'}">
					    		<td class="col-md-1">녹음실</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'shareKitchen'}">
					    		<td class="col-md-1">공유주방</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'singPractice'}">
					    		<td class="col-md-1">녹음실</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'studio'}">
					    		<td class="col-md-1">스튜디오</td>
				    		</c:when>
				    		<c:when test="${pv.category == 'smallWedding'}">
					    		<td class="col-md-1">스몰웨딩</td>
				    		</c:when>
				    	</c:choose>
						<td class="col-md-2"><a href="<%=request.getContextPath()%>/host/view.do?pidx=${pv.pidx}">${pv.placeName}</a></td>
						<td class="col-md-3" id="tag${pv.pidx}" style="text-align: left;"></td>
						<script>
							var tags = JSON.parse('${pv.tag}');
							var tag = "";
							tags.forEach(element => 
								tag += "#"+ element.value + "&nbsp;" 
							);
							$("#tag${pv.pidx}").html(tag);
						</script>
						<%-- <td style="text-align: left;"><a href="<%=request.getContextPath()%>/host/view.do?pidx=${pv.pidx}">${pv.placeDetail}</a></td> --%>
						<c:choose>
							<c:when test="${pv.approvalYN eq '승인거절'}">
								<td class="col-md-1">${pv.approvalYN}</td>
								<td class="col-md-1"><button class="btnDefault" type="button" onclick="if(confirm('삭제하시겠습니까?')){location.href='deletePlace.do?pidx=${pv.pidx}'}">삭제</button></td>
							</c:when>
							<c:otherwise>
								<td class="col-md-1">${pv.approvalYN}</td>
								<td class="col-md-1" class="col-md-1"><button class="btnDefault" type="button" onclick="location.href='placeModfy.do?pidx=${pv.pidx}'">수정</button></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

<!-- 페이징 -->
<c:if test="${not empty list_p}">
<nav aria-label="Page navigation example" style="margin-bottom: 0px!important;">
  <ul class="pagination justify-content-center " >
  	
	<c:if test="${pagination.startPage > 5}">
		<li class="page-item">
      		<a class="page-link" onclick="nowPage(4)">&laquo;</a>
    	</li>
    </c:if>
    
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="p">
		<c:choose>
			<c:when test="${p == pagination.nowPage }">
				 <li class="page-item text-secondary">
				 <a class="page-link text-secondary activePage" onclick="nowPage(${p})">${p}</a></li>
			</c:when>
			<c:when test="${p != pagination.nowPage }">
				<li class="page-item text-secondary">
				 <a class="page-link text-secondary" onclick="nowPage(${p})">${p}</a></li>
			</c:when>
		</c:choose>
	</c:forEach>

   	<c:if test="${pagination.endPage != pagination.lastPage}">
	    <li class="page-item">
	      <a class="page-link" onclick="nowPage(${pagination.endPage +1})">&raquo;</a>
	    </li>
   	</c:if>
  </ul>
</nav>
</c:if> 

			
			
			
	<script>
	function nowPage(p){
		$.ajax({
			url: "placeList.do",
			type: "GET",
			data: "nowPage="+p,
			success: function(data){
				//console.log("에이작스 페이징");
				$("#placeList").html(data);
			},
			error: function(){
				console.log("페이징 실패");
			}
			
		});
	}
		
	</script>