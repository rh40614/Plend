<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<!-- 2022.07.10 김연희 : summerNote 넣으면서 기준 폰트 작아짐. html 전체에  initial을 주어서 초기화. -->
<html style=" font-size: initial;">
<head>
<meta charset="UTF-8">
<title>Hostcenter-운영자 문의</title>
	
	
	<!-- summerNote 제이쿼리랑 부트스트랩이 포함되어있음-->
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summerNote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		
	<!-- jQuery -->
	<%-- <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>  --%>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
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
	
	<script type="text/javascript">
	//썸머노트
		$(document).ready(function() {
 			$('#summernote').summernote({
 				width: 1250,
	 			height: 400,		// 기본 높이값
			    minHeight: 450,		// 최소 높이값(null은 제한 없음)
			    maxHeight: null,  	// 최대 높이값(null은 제한 없음)
			    focus: true,          // 페이지가 열릴때 포커스를 지정함
			    placeholder: '문의를 작성해주세요.',
			    lang: 'ko-KR'    
 			});
		}); 

	</script>

</head>
<body>

	<header id="header"></header>
	
	<main>
		
		<!-- 문의하기 -->
		<section style="margin-top: 100px;" >
			<span class="title1">운영자 문의- 문의 등록하기 </span>
			<br>
			<p class="spaceL">문의해주셔서 감사합니다. 문의하시기 전에 FAQ를 참고 해주시길 바랍니다. 자주 묻는 질문은 FAQ에 올라와있습니다. <br> 질문을 하실때 화면을 캡쳐해서 이미지와 함께 올려주시면 더 빠른 해결이 가능합니다. </p>
			<!-- 썸머노트 -->
			<div class="spaceL mt-2">
				<div id="summernote"></div> 
			</div>
		</section >
			
		<!-- 이전 문의 내역 -->
		<section>	
			<span class="title1 mt-5" >이전 문의내역</span>	
				<div class=".table-responsive container " style="margin: 50px 0px 0px 100px;" >
					
					<table class="table table-hover text-center clearfix table-striped" >
						<thead class="">
							<tr style="text-al">
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
		
		
		
		

	</main>
	
	<footer id="footer"></footer>
	
	
	
</body>
</html>