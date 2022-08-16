<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-공지사항</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<!-- bootstrap  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!--  fontAwesome -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	
	<!-- 프론트 디자인 -->
	<script type="text/javascript">
	
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/hostfooter.jsp");
		})
	</script>
	<!-- 공지사항 삭제 -->	
	<script>
		function noticeDelete(pram){
			console.log(pram);
			confirm("공지사항을 삭제하시겠습니까?");
			location.href="<%=request.getContextPath()%>/host/noticeDelete.do?nidx="+pram;
		}
	
	</script>

</head>
<body>

	<header id="header"></header>
	
	<main>
		<section style="margin-top: 100px;">
			<span class="title1">공지사항</span>
		
		
		<!-- 공지사항 내용 -->
		
		<table class="table spaceL w-75 mt-5">
		  <thead>
		 	<tr>
				<td colspan="10" class="">${notice.title}</td>
			</tr>
			<tr style="vertical-align: top; ">
				<td class="text-left" style="width: 10%">글번호</td>
				<td class="text-left" style="width: 10%">${notice.nidx}</td>
				<td class="" style="width: 10%">조회수</td>
				<td class="" style="width: 5%">${notice.hit}</td>
				<td class="" style="width: 10%">작성자</td>
				<td class="" style="width: 16.66%">${notice.nickName}</td>
				<td class="" style="width: 10%">작성일</td>
				<td class="" style="width: 16.66%">${notice.date}</td>
			</tr>
		  </thead>
		  <tbody>
		  	<tr>
				<td colspan="10" class="noticeArea">${notice.content}</td>
			</tr>
		  </tbody>
		  <tfoot>
			<tr class="spaceL mt-5">
				<c:choose>
					<c:when test="${PN.pre eq '-1'}">
						<td class="ps-5" >이전글  &blacktriangle; </td><td colspan="7"> 이전글이 없습니다.</td>
					</c:when>
					<c:when test="${PN.pre ne null}">
						<td class="ps-5" style="width: 16.66%"><a href="<%=request.getContextPath()%>/host/noticeView.do?nidx=${PN.pre}">이전글 &blacktriangle;</a></td>
						<td colspan="7"><a href="<%=request.getContextPath()%>/host/noticeView.do?nidx=${PN.pre}">${PNT.preTitle}</a></td>
					</c:when>
				</c:choose>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${PN.next == ''}">
						<td class="ps-5" >다음글 &blacktriangledown;</td><td colspan="7"> 다음글이 없습니다. </td>
					</c:when>
					<c:when test="${PN.next ne null}">
						<td class="ps-5" style="width: 16.66%"><a href="<%=request.getContextPath()%>/host/noticeView.do?nidx=${PN.next}">다음글  &blacktriangledown; </a></td>
						<td colspan="7" class="text-left"><a href="<%=request.getContextPath()%>/host/noticeView.do?nidx=${PN.next}">${PNT.nextTitle}</a></td>
					</c:when>
				</c:choose>
			</tr>
		  </tfoot>
		</table>
		
		
		

		
		<div class="btn-group spaceL w-75 d-flex justify-content-end" role="group" id="btnGroup" >
			<c:if test = "${login.role == 3}">
				<button type="button" class="btnDefault me-3 ms-3" onclick="location.href='noticeModify.do?nidx=${notice.nidx}'">수정</button>
				<button type="button" class="btnDefault me-3" onclick="noticeDelete(${notice.nidx})" >삭제</button>
			</c:if>
			<button type="button" class="btnDefault" onclick="location.href='notice_dev.do?&searchType=${pagination.searchType}&searchValue=${pagination.searchValue}'">목록</button>
		</div>
		
		
		</section>

	</main>
	<div style="margin:300px;"></div>
	<footer id="footer"></footer>
	
	
	
</body>
</html>