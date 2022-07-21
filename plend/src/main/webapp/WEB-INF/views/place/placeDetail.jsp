<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>장소 상세 페이지</title>
	<!-- BootStrap css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- jquery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<!-- css -->
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/placeDetail.css" rel="stylesheet">
	<!-- header/footer -->	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
</head>
<body>
<div class="container">	
	<header class="row" id="header"></header>
	<br>
	<main class="row">
		<section id="viewNav" class="col-9">
			<div class="nav-scroller mb-2">
			    <nav class="nav d-flex row detailNav">
			      <a class="p-2 col link-secondary text-white active2" href="#">공간 소개</a>
			      <a class="p-2 col link-secondary text-white" href="#">편의 시설</a>
			      <a class="p-2 col link-secondary text-white" href="#">유의사항</a>
			      <a class="p-2 col link-secondary text-white" href="#">QnA</a>
			      <a class="p-2 col link-secondary text-white" href="#">이용후기</a>
			    </nav>
			</div>
			<section id="QnA">
				<table class="table caption-top">
					<caption class="ms-4 text-black">QnA</caption>
					<tbody>
						<c:forEach var="qna" items="${QnaList}" varStatus="status">
							<c:if test="${qna.depth eq 0}">
								<tr class="table-secondary">
									<td class="text-center col-2">Q.</td>
									<td>${qna.content}</td>
									<td class="col-3 text-end justify-content-md-end">
										<c:if test="${placeOne.uidx eq login.uidx}">
											<a class="btn btn-primary btn-sm rounded-3" onclick="QnAToggle()">답변</a>
										</c:if>
										<c:if test="${placeOne.uidx eq login.uidx || qna.uidx eq login.uidx}">
											<a class="btn btn-primary btn-sm rounded-3">수정</a>
											<a class="btn btn-primary btn-sm rounded-3 me-2">삭제</a>
										</c:if>
									</td>								
								</tr>
								<tr class="QnAToggle d-none">
									<td colspan="3">
										<div class="d-grid gap-1 d-md-flex justify-content-md-end">
											<form action="question.do" method="post" class="col-12 text-end">
												<textarea class="form-control" name="content" style="resize: none;" required></textarea>
												<input type="hidden" name="uidx" value="${login.uidx}">
												<input type="hidden" name="pidx" value="${placeOne.pidx}">
												<a id="QnAsubmit" class="btn btn-sm rounded-3 mt-1" onclick="QnAToggle()">취소</a>
												<button id="QnAsubmit" class="btn btn-sm rounded-3 mt-1">답변 등록</button>
											</form>
										</div>
									</td>
								</tr>
							</c:if>
							<c:if test="${QnaList[status.index+1].depth eq 1}">
								<tr>
									<td class="text-center col-2">A.</td>
									<td>${QnaList[status.index+1].content}</td>
									<td class="col-3 text-end justify-content-md-end">
										<c:if test="${placeOne.uidx eq login.uidx || qna.uidx eq login.uidx}">
											<a class="btn btn-primary btn-sm rounded-3">수정</a>
											<a class="btn btn-primary btn-sm rounded-3 me-2">삭제</a>
										</c:if>
									</td>							
								</tr>					
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${login ne null}">
					<div class="d-grid gap-1 d-md-flex justify-content-md-end">
						<a class="btn btn-primary btn-sm rounded-3 me-2 QnAToggle" onclick="QnAToggle(QnAToggle)">질문하기</a>
						<form action="question.do" method="post" class="QnAToggle d-none col-12 text-end">
							<textarea class="form-control" name="content" style="resize: none;" required></textarea>
							<input type="hidden" name="uidx" value="${login.uidx}">
							<input type="hidden" name="pidx" value="${placeOne.pidx}">
							<a id="QnAsubmit" class="btn btn-sm rounded-3 mt-1" onclick="QnAToggle(this)">취소</a>
							<button id="QnAsubmit" class="btn btn-sm rounded-3 mt-1">등록</button>
						</form>
					</div>
				</c:if>
			</section>
		</section>
		<div class="col-3">
			대충 javascript
		</div>
	</main>

</div>
<footer id="footer" class="row mt-5"></footer>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- nav 클릭시 색상변화 -->
<script>
	$(".detailNav").children("a").click(function(){
		$(".detailNav").children("a").removeClass("active2");
		$(this).addClass("active2");
	});
</script>
<!-- 질문하기 버튼 클릭시 토글 -->
<script type="text/javascript">
	function QnAToggle(obj){
		console.log(obj);
		//$().toggleClass("d-none");
	}
</script>
</body>
</html>




