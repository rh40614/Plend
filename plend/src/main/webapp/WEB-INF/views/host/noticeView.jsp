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
		<section style="margin-top: 100px;">
			<span class="title1">공지사항</span>
		
		
		<!-- 공지사항 내용 -->
		<table class="noticeT">
			<tr>
				<td colspan="3" class="title2-1" style="padding: 30px 30px 10px 30px">공지사항 제목</td>
			</tr>
			<tr style="vertical-align: top; ">
				<td class="noticeTD1">작성자 : </td>
				<td class="noticeTD2">관리자</td>
				<td class="noticeTD1">작성일 : </td>
				<td class="noticeTD2">2022.07.18</td>
				<td class="noticeTD1">조회수 : </td>
				<td class="noticeTD2">23 </td>
			</tr>
			<tr>
				<td colspan="6" class="noticeArea">공지사항의 내용이 들어갈 공간입니다. 공지사항의 내용이 들어갈 공간입니다.공지사항의 내용이 들어갈 공간입니다.공지사항의 내용이 들어갈 공간입니다.공지사항의 내용이 들어갈 공간입니다.
				공지사항의 내용이 들어갈 공간입니다.공지사항의 내용이 들어갈 공간입니다.공지사항의 내용이 들어갈 공간입니다.</td>
			</tr>
		</table>
		
		<div class="btn-group spaceL" role="group" id="btnGroup" >
			<button type="button" class="btnDefault me-3 ms-3" >수정</button>
			<button type="button" class="btnDefault me-3">삭제</button>
			<button type="button" class="btnDefault">목록</button>
		</div>
		
		<div class="spaceL mt-5">
			<a href="<%=request.getContextPath()%>/host/noticeView.do?">이전글 | </a>	<br>	
			<a href="<%=request.getContextPath()%>/host/noticeView.do?">다음글 | </a>	
		</div>
		</section>

	</main>
	<div style="margin:300px;"></div>
	<footer id="footer"></footer>
	
	
	
</body>
</html>