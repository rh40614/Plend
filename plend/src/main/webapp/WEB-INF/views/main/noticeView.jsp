<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>plend</title>
	
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="../resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/home.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/noticeView.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>

	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
	
	<script>
	
	function like (obj){
		if($(obj).hasClass("fa-regular") == true){
			$(obj).removeClass("fa-regular");
			$(obj).addClass("fa-solid");
		}else{
			$(obj).removeClass("fa-solid");
			$(obj).addClass("fa-regular");
		}
		
	}
	</script>
	
	<!-- 게시글 삭제 -->
	<script>
	
		function del() {
			if (confirm("정말 삭제하시겠습니까??")){    //확인

				location.replace("noticeDel.do?nidx=${vo.nidx}");
			 }else{   //취소

			     return false;

			 }
			
		}
	
	</script>

	<style type="text/css">
		img {
			width: 250px;
			height: 250px;
		}
	</style>

</head>

<body>
<div id="wrap">	
	<header id="header"></header>
	<br>
	<div id = "back">
		 <br>
		 <h2>| ${vo.title}</h2>	
		 <br>
		 <span id = "info">작성자 : ${vo.nickName} | 작성일 : ${vo.date.substring(0,10)} | 조회수 : ${vo.hit}</span>
		<hr>
		<div id = "content">${vo.content}</div>
	</div>
	<br>
	<div id = "btns">
		<c:if test = "${login.role == '1'}">
			<input type = "button" value = "수정" style = "float:left;margin-right:5px;" onclick = "location.href='noticeModify.do?nidx=${vo.nidx}'">
				<input type = "button" value = "삭제" style = "float:left;" onclick = "del();">
		</c:if>
		<input type = "button" value = "목록" style = "float:right;" onclick = "location.href='notice.do'">
	</div>
	<br>
	<div id = "prenext">
		<c:if test = "${vo3.pre == '-1'}">
		</c:if>
		<c:if test = "${vo3.pre != '-1'}">
		이전 글 | <a href = "noticeView.do?nidx=${vo3.pre}">${vo2.preTitle}</a>
		</c:if>
		<br>
		<c:if test = "${vo3.next == '0'}">
		</c:if>
		<c:if test = "${vo3.next != '0'}">
		다음 글 | <a href = "noticeView.do?nidx=${vo3.next}">${vo2.nextTitle}</a>
		</c:if>
	</div>
	<footer id="footer" class="mt-5"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>