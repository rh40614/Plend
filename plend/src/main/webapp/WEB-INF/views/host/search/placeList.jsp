<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<table class="table table-hover text-center clearfix" >
						<thead class="table-dark">
							<tr style="text-al">
								<td>��ȣ</td><td>�÷��̽���</td><td>�±�</td><td>�Ұ�</td><td>���ο���</td><td>����</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list_p.size() == 0}">	
								<tr>
									<td colspan="6">��ϵ� ��Ұ� �����ϴ�.</td>
								</tr>
							</c:if>
							<!--  -->
							<c:if test="${list_p.size() > 0}">
								<c:forEach var="pv" items="${list_p}">
									<tr >
										<td>${pv.pidx}</td>
										<td>${pv.placeName}</td>
										<td>${pv.tag}</td>
										<td style="text-align: left;">${pv.placeDetail}</td>
										<td>${pv.approvalYN}</td>
										<td><button class="btnDefault" type="button" onclick="location.href='/host/placeView.do'">����</button></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
			
			<!-- ����¡ -->
			<c:if test="${not empty list_p}">
				<nav aria-label="Page navigation example" class="m-auto">
				  <ul class="pagination justify-content-center " >
				  	
					<c:if test="${pagenation.startPage > 5}">
						<li class="page-item">
				      		<a class="page-link" onclick="nowPage(4)">&laquo;</a>
				    	</li>
				    </c:if>
				    
					<c:forEach begin="${pagenation.startPage}" end="${pagenation.endPage}" var="p">
						<c:choose>
							<c:when test="${p == pagenation.nowPage }">
								 <li class="page-item text-secondary">
								 <a class="page-link text-secondary" onclick="nowPage(${p})">${p}</a></li>
							</c:when>
							<c:when test="${p != pagenation.nowPage }">
								<li class="page-item text-secondary">
								 <a class="page-link text-secondary" onclick="nowPage(${p})">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				
			    	<c:if test="${pagenation.endPage != pagenation.lastPage}">
					    <li class="page-item">
					      <a class="page-link" onclick="nowPage(${pagenation.endPage +1})">&raquo;</a>
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
				//console.log("�����۽� ����¡");
				$("#placeList").html(data);
			},
			error: function(){
				console.log("����¡ ����");
			}
			
		});
	}
		
	</script>