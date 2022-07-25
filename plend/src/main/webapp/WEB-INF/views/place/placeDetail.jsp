<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>장소 상세 페이지</title>
	<!-- fontAwesome -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
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
		});
	</script>
	<!-- calendar/ timeTable -->
	<script>
		$(function(){
			$(".dateCalendar").load("<%=request.getContextPath()%>/resources/article/calendar.jsp");
			$(".timeTable").load("<%=request.getContextPath()%>/resources/article/timeTable.jsp");
		});
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
			      <a class="p-2 col link-secondary text-white" href="test.do">편의 시설</a>
			      <a class="p-2 col link-secondary text-white" href="#">유의사항</a>
			      <a class="p-2 col link-secondary text-white" href="#QnA">QnA</a>
			      <a class="p-2 col link-secondary text-white" href="#">이용후기</a>
			    </nav>
			</div>
			<section id="QnA">
				<table class="table caption-top">
					<caption class="ms-4 text-black">QnA</caption>
					<tbody>
						<c:forEach var="qna" items="${QnaList}" varStatus="status">
							<!-- QnA 질문 표시 -->
							<c:if test="${qna.depth eq 0}">
								<tr class="table-secondary">
									<td class="text-center col-2">Q.</td>
									<td>${qna.content}</td>
									<td class="col-3 text-end justify-content-md-end">
										<c:if test="${placeOne.uidx eq login.uidx && QnaList[status.index+1].depth ne 1}">
											<a class="btn btn-primary btn-sm rounded-3" onclick="QnAToggle('QnAToggle${status.index}')">답변</a>
										</c:if>
										<c:if test="${qna.uidx eq login.uidx}">
											<a class="btn btn-primary btn-sm rounded-3" onclick="modifyToggle('Modify${status.index}')">수정</a>
											<a class="btn btn-primary btn-sm rounded-3 me-2" href="deleteQna.do?qidx=${qna.qidx}&pidx=${placeOne.pidx}">삭제</a>
										</c:if>
									</td>								
								</tr>
								<!-- QnA 답변 등록 창 -->
								<tr class="QnAToggle${status.index} d-none">
									<td colspan="3">
										<div class="d-grid gap-1 d-md-flex justify-content-md-end">
											<form action="answer.do" method="post" class="col-12 text-end">
												<textarea class="form-control" name="content" style="resize: none;" required></textarea>
												<input type="hidden" name="uidx" value="${login.uidx}" readonly>
												<input type="hidden" name="pidx" value="${placeOne.pidx}" readonly>
												<input type="hidden" name="originQidx" value="${qna.qidx}" readonly>
												<a class="btn btn-sm rounded-3 mt-1" onclick="QnAToggle('QnAToggle${status.index}')">취소</a>
												<button class="btn btn-sm rounded-3 mt-1">답변 등록</button>
											</form>
										</div>
									</td>
								</tr>
								<!-- 질문 수정 창 -->
								<tr class="Modify${status.index} d-none">
									<td colspan="3">
										<div class="d-grid gap-1 d-md-flex justify-content-md-end">
											<form action="questionModify.do" method="post" class="col-12 text-end">
												<textarea class="form-control" name="content" style="resize: none;" required>${qna.content}</textarea>
												<input type="hidden" name="uidx" value="${login.uidx}" readonly>
												<input type="hidden" name="pidx" value="${placeOne.pidx}" readonly>
												<input type="hidden" name="qidx" value="${qna.qidx}" readonly>
												<input type="hidden" name="originQidx" value="${qna.originQidx}" readonly>
												<a class="btn btn-sm rounded-3 mt-1" onclick="modifyToggle('Modify${status.index}')">취소</a>
												<button class="btn btn-sm rounded-3 mt-1">수정</button>
											</form>
										</div>
									</td>
								</tr>
							</c:if>
							<!-- QnA 답변 표시 -->
							<c:if test="${QnaList[status.index+1].depth eq 1}">
								<tr>
									<td class="text-center col-2">A.</td>
									<td>${QnaList[status.index+1].content}</td>
									<td class="col-3 text-end justify-content-md-end">
										<c:if test="${qna.uidx eq login.uidx}">
											<a class="btn btn-primary btn-sm rounded-3" onclick="modifyToggle('Modify${status.index+1}')">수정</a>
											<a class="btn btn-primary btn-sm rounded-3 me-2" href="deleteQna.do?qidx=${QnaList[status.index+1].qidx}&pidx=${placeOne.pidx}">삭제</a>
										</c:if>
									</td>
								</tr>
								<!-- 답변 수정 창 -->					
								<tr class="Modify${status.index+1} d-none">
									<td colspan="3">
										<div class="d-grid gap-1 d-md-flex justify-content-md-end">
											<form action="questionModify.do" method="post" class="col-12 text-end">
												<textarea class="form-control" name="content" style="resize: none;" required>${QnaList[status.index+1].content}</textarea>
												<input type="hidden" name="uidx" value="${login.uidx}" readonly>
												<input type="hidden" name="pidx" value="${placeOne.pidx}" readonly>
												<input type="hidden" name="qidx" value="${QnaList[status.index+1].qidx}" readonly>
												<input type="hidden" name="originQidx" value="${QnaList[status.index+1].originQidx}" readonly>
												<a class="btn btn-sm rounded-3 mt-1" onclick="modifyToggle('Modify${status.index+1}')">취소</a>
												<button class="btn btn-sm rounded-3 mt-1">수정</button>
											</form>
										</div>
									</td>
								</tr>							
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${login ne null}">
					<div class="d-grid gap-1 d-md-flex justify-content-md-end">
						<a class="btn btn-primary btn-sm rounded-3 me-2 QnAToggle" onclick="QnAToggle('QnAToggle')">질문하기</a>
						<form action="question.do" method="post" class="QnAToggle d-none col-12 text-end">
							<textarea class="form-control" name="content" style="resize: none;" required></textarea>
							<input type="hidden" name="uidx" value="${login.uidx}">
							<input type="hidden" name="pidx" value="${placeOne.pidx}">
							<a id="QnAsubmit" class="btn btn-sm rounded-3 mt-1" onclick="QnAToggle('QnAToggle')">취소</a>
							<button id="QnAsubmit" class="btn btn-sm rounded-3 mt-1">등록</button>
						</form>
					</div>
				</c:if>
			</section>
		</section>
		<div id="book" class="col-3 align-self-end text-center">
			<form action="book.do" onsubmit="return calTime()" method="post">
				<div id="book_Timepiker" class="border-2 rounded-3 m-2 pt-4 pb-4 d-grid gap-1" style="border: solid var(--bs-gray-800);">
					<div class="dateCalendar d-none"></div>
					<input type="hidden" class="selectDate">
					<div class="timeTable d-none"></div>
					<input type="hidden" class="selectTime">
					<input type="hidden" name="useTime" class="useTime">
					<div class="cntPeople d-none">
						<div class="d-inline-flex">인원 선택</div>
						<input name="cntPeople" type="number" class="d-inline-flex form-control m-1" style="width: auto;">
					</div>
					<a class="datePicker btn btn-sm ms-1 me-1"> <i class="fa-regular fa-calendar"></i> 예약날짜 </a>
					<a class="timePicker btn btn-sm ms-1 me-1"> <i class="fa-regular fa-clock"></i> 예약시간 </a>
					<a class="peopleCnt btn btn-sm ms-1 me-1"> <i class="fa-regular fa-clock"></i> 예약인원 </a>
					<button class="bookBtn btn btn-lg m-1">예약 하기</button>
					<input type="hidden" name="pidx" value="${placeOne.pidx}">
				</div>
			</form>
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
<!-- 질문하기/답변 버튼 클릭시 토글 -->
<script type="text/javascript">
	function QnAToggle(obj){
		$('.'+obj).toggleClass("d-none");
	}
</script>
<!-- 수정버튼 클릭시 토글 -->
<script type="text/javascript">
	function modifyToggle(obj){
		$('.'+obj).toggleClass("d-none");
	}
</script>
<!-- 예약 날짜/시간/인원 보이기 클릭이벤트 -->
<script>
	$(".datePicker").click(function(){
		$(".timeTable").addClass("d-none");
		$(".cntPeople").addClass("d-none");
		$(".dateCalendar").toggleClass("d-none");
	})
	
	$(".timePicker").click(function(){
		$(".dateCalendar").addClass("d-none");
		$(".cntPeople").addClass("d-none");
		$(".timeTable").toggleClass("d-none");
	});
	
	$(".peopleCnt").click(function(){
		$(".dateCalendar").addClass("d-none");
		$(".timeTable").addClass("d-none");
		$(".cntPeople").toggleClass("d-none");
	});
</script>
<!-- 예약전 예약시간 계산/ 빈값 유효성 검사 -->
<script type="text/javascript">
	function calTime(){
		
		if($(".selectDate").val()==""){
			alert("날짜를 선택해주세요.");
			return false;
		}else if($(".selectTime").val()==""){
			alert("시간을 선택해주세요");
			return false;
		}else if($("input[name='cntPeople']").val()==""){
			alert("인원을 입력해주세요");
			return false;
		}else{
			const selectDate = $(".selectDate").val().split(",");
			const time = $(".selectTime").val().split(",");
			let year = selectDate[0];
			let month = selectDate[1];
			let date = selectDate[2];
			
			var data = new Date();
			var usetime = year+"-"+month+"-"+date+" "+time[0]+":00 ~ "+year+"-"+month+"-"+date+" "+time[1]+":00";
			$(".useTime").val(usetime);
		}
	}
</script>
</body>
</html>




