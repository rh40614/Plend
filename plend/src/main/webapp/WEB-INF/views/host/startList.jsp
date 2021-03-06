<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:if test="${list.size() == 0}">
	<div class=" mt-3 me-5"  style="width: 18rem;">
		<p class="title2 ms-auto">현재 진행 이벤트가 없습니다. </p>
	</div>
</c:if>


<c:if test="${not empty list}">
	<c:forEach var="event" items="${list}" >
		<div class="card mt-3 me-5"  style="width: 18rem;">
		  <img src="" class="card-img-top" alt="..." onclick="location.href='<%=request.getContextPath()%>/host/eventView.do?eidx='+${event.eidx}">
			  <div class="card-body">
			    <p class="card-text">${event.semiTitle}</p>
			  </div>
		</div>
	</c:forEach>
</c:if>