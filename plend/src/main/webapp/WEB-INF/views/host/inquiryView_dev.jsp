<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<!-- 2022.07.10 김연희 : summerNote 넣으면서 기준 폰트 작아짐. html 전체에  initial을 주어서 초기화. -->
<html style=" font-size: initial;">
<head>
<meta charset="UTF-8">
<title>Hostcenter-운영자 문의</title>
	
	
	
		
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
	
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
	
	

</head>
<body>

	<header id="header"></header>
	
	<main>
	<!-- 이전 문의 내역 -->
		<section>	
		
			<div style="display: flex;  justify-content: space-between; align-items: baseline;  width: 75%">
				<span class="title1 mt-2" >이전 문의내역</span>	
				<!-- 문의 버튼 -->			
				<button class="btnBig ms-auto" onclick="location.href='<%=request.getContextPath()%>/host/inquiry_dev.do'">문의하러가기</button>
			</div>
					
				<div class=".table-responsive container " style="margin: 50px 0px 0px 100px; width: 75%" >
					
					<table class="table table-hover text-center clearfix table-striped " >
						<thead class="">
							<tr>
								<td>번호</td><td>유형</td><td>제목</td><td>답변여부</td><td>작성일</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list_p.size() == 0}">	 --%>
								<tr>
									<td colspan="6">등록된 문의가 없습니다.</td>
								</tr>
							</c:if> 
							
							<%-- <c:if test="${list_p.size() > 0}">
								<c:forEach var="pv" items="${list_p}"> --%>
									<tr >
										<td>1</td>
										<td>장소등록</td>
										<td style="text-align: left;"><a href="<%=request.getContextPath()%>/host/inquiryView_dev.do">장소가 등록되지않습니다.</a></td>
										<td>답변 대기</td>
										<td>2022.07.25</td>
									</tr>
									<tr >
										<td>1</td>
										<td>장소등록</td>
										<td style="text-align: left;"><a href="<%=request.getContextPath()%>/host/inquiryView_dev.do">장소가 등록되지않습니다.</a></td>
										<td>답변 대기</td>
										<td>2022.07.25</td>
									</tr>
								<%-- </c:forEach>
							</c:if> --%>
						</tbody>
					</table>
					
					<!-- 페이징 -->	
					<nav aria-label="Page navigation example" class="m-auto">
					  <ul class="pagination justify-content-center " >
					    <li class="page-item text-secondary">
					      <a class="page-link text-secondary" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">1</a></li>
					    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">2</a></li>
					    <li class="page-item text-secondary"><a class="page-link text-secondary" href="#">3</a></li>
					    <li class="page-item text-secondary">
					      <a class="page-link text-secondary" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
			</div>
				
		</section>
		
		
		
		<hr class="w-75" style="margin-left:200px;">
		
		
		
		
		<!-- 문의 내용 -->
		<section>
			<span class="title1 spaceL">문의 내용  </span>
			<br>
			
			<table class="spaceL border border-3 rounded w-75" style="border-collapse: initial;" >
				<tbody>
					<tr>
						<td colspan="2" class="fs-5"  style="padding: 30px;">문의는 고구마가 먹고싶은듸</td>
					</tr>
					<tr>
						<td class="ps-4 pe-2" style="width: 80px;">유형 : </td><td>장소등록</td>
					</tr>
					<tr>
						<td class="ps-4 pe-2" style="width: 80px;">제목 : </td><td>장소등록이 안되는데 어떠한 연유인지 궁금합니다.</td>
					</tr>
					<tr>
						<td class="ps-4 pe-2 text-break" style="width: 80px;">내용 :</td><td>제목이 곧 내용이기는 하지만 장소등록이 안되니까 어떻게 해야할 지 모르겠습니다. 지금 너무 졸려요 어떻게하면 이 피곤함을 풀수있을까요 </td>
					</tr>
				</tbody>
			</table>
				<br>
				<div class="btn-group spaceL" role="group" id="btnGroup" >
					<button class="btnDefault me-3" type="button" onclick="location.href='<%=request.getContextPath()%>/host/inquiryEdit_dev.do'">수정</button>
					<button class="btnDefault" type="button" onclick="location.href='<%=request.getContextPath()%>/host/inquiryDelete_dev.do'">삭제</button>
				</div>
		</section>
		
		<hr class="w-75" style="margin-left:200px;">
		
		<!-- 답변 확인 -->
		<section>
		
			<span class="title1 spaceL">답변 확인 </span>
			<br>
			<table class="spaceL border border-3 rounded w-75 h-75" style="border-collapse: initial;" >
				<tbody>
					
					<c:if test="">
						<tr>
							<td colspan="2" class="fs-5"  style="padding: 30px;">등록된 답변이 없습니다.</td>
						</tr>
					</c:if>
					
					<tr>
						<td class="ps-4 pe-2" style="width: 80px;">제목 : </td><td>RE: 장소등록이 안되는데 어떠한 연유인지 궁금합니다.</td>
					</tr>
					<tr>
						<td class="ps-4 pe-2 " style="width: 80px; vertical-align: top;">내용 :</td>
						<td>문의해 주셔서 감사합니다. <br> 장소 등록이 되지 않는 이유는 저희가 막아놔서 그래요 메롱</td>
						
					</tr>
				</tbody>
			</table>
		</section>

	</main>
	
	<footer id="footer"></footer>
	
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>