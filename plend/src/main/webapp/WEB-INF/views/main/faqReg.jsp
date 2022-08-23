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
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/home.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/faqReg.css" rel="stylesheet">

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
	$(document).ready(function() {
		  $('#summernote').summernote({
			  height:400
		  });
		});
	</script>
		
	<script>
		function faqReg(){
			
			var frm = document.frm;
			
			if ($('select[name=category] option:selected').val() == "" ){
				alert("카테고리를 선택해주세요.");
				return;
			} else if (frm.question.value == ""){
				alert("질문을 입력해주세요.");
				return;
			} else if (frm.answer.value == "") {
				alert("답을 입력해주세요.");
				return;
			} else {
				frm.submit();
			}
		}	
	
	</script>
	
	<style>
		select {
			width : 90px;
			height : 30px;
			color : white;
			background : #2F506D;
			-webkit-appearance: none;
			border-radius : 5px;
			text-align:center;
		}
		
		#regBtn{
			float:right;
			border-radius:15px;
			border : 1px solid #2F506D;
			background : #2F506D;
			color : white;
			width : 100px;
			height : 35px;
		}
		#regBtn:hover{
			border : 0px;
			background-color:#3FC1C9;
		}
		
		input[name=question]{
		width : 100%;
		height : 37px;
		border : 0;
		background : #F3F3F3;
			}
	
	</style>
</head>

<body>
<div id="wrap">	
	<header id="header"></header>
	<br>
	<form action = "faqReg.do" method = "post" name = "frm">
		<div style="margin-left:23%;margin-right:23%;">
			<h2 >| FAQ 등록</h2>
			<br>
			<select name = "category">
				<option value = "">- 카테고리 -</option>
				<option value = "book">예약</option>
				<option value = "use">이용</option>
				<option value = "coupon">쿠폰</option>
				<option value = "sue">신고</option>
			</select>
			<br>
			<br>
			<input type = "text" name = "question" placeholder = "질문을 입력해주세요.">
			<br>
			<br>
			<textarea id="summernote" name="answer" placeholder = "답을 입력해주세요."></textarea>
			<br>
			<input type = "button" value = "등록하기" onclick = "faqReg()" id = "regBtn">
		</div>
	</form>
	<footer id="footer" class="mt-5"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>