<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="col table text-center table-hover">
  <thead class="table-dark">
    <tr>
      <th scope="col">번호</th>
      <th scope="col">회원명</th>
      <th scope="col">탈퇴유무</th>
      <th scope="col">등록일</th>
      <th scope="col" class="col col-5">사유</th>
      <th scope="col">삭제</th>
    </tr>
  </thead>
  <tbody>
    <c:choose>
		<c:when test="${empty blockList}">
			<tr>
				<td colspan="6"> 등록된 블랙리스트가 없습니다. </td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="block" items="${blockList}"> 
				<tr>
					<td>${block.rbidx}</td>
					<td>${block.name}</td>
					<td>${block.delYN}</td>
					<td>${block.date}</td>
					<td>${block.content}</td>
					<td><a class="btn btn-sm" onclick="blockDelete('${block.rbidx}')">삭제</a></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
  </tbody>
</table>
<c:if test="${not empty blockList}">
	<nav id="pagenation" class="row">
	  <ul class="pagination justify-content-center">
	  	<c:if test="${pagination2.startPage > 5}">
		    <li class="page-item">
		      <a class="page-link text-black" onclick="callEnterBlockList(${uidx},4)" role="button">&laquo;</a>
		    </li>
	  	</c:if>
	  	<c:forEach begin="${pagination2.startPage }" end="${pagination2.endPage }" var="p">
			<c:choose>
				<c:when test="${p == pagination2.nowPage }">
					<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" onclick="callEnterBlockList(${uidx},${p})" role="button">${p}</a></li>
				</c:when>
				<c:when test="${p != pagination2.nowPage }">
					<li class="page-item"><a class="page-link text-black" onclick="callEnterBlockList(${uidx},${p})" role="button">${p}</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	    <c:if test="${pagination2.endPage != pagination2.lastPage}">
		    <li class="page-item">
		      <a class="page-link text-black" onclick="callEnterBlockList(${uidx},${pagination2.endPage +1})" role="button">&raquo;</a>
		    </li>
	    </c:if>
	  </ul>
	</nav>
</c:if>
<!-- 삭제 전 물어보기 -->
<script>
function blockDelete(rbidx){
	if(confirm("삭제하시겠습니까?")){
		location.replace("blockDelete.do?rbidx="+rbidx)
	}
}
</script>