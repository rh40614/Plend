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
	<link href="<%=request.getContextPath()%>/resources/css/noticeReg.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/headerwithCate.jsp");
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
	//파일추가 할 때 이름 가져오는 스크립트
	$(document).ready(function(){
  var fileTarget = $('.filebox .upload-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }

        $(this).siblings('.upload-name').val(filename);
    });
}); 
	</script>
	
	<script>
		function noticeReg(){
			
			var frm = document.frm;
			
			if ($('select[name=category] option:selected').val() == "" ){
				
				alert("카테고리를 선택해주세요.");
				return;
				
			} else if (frm.title.value == ""){
				alert("제목을 입력해주세요.");
				return;
			} else if (frm.content.value == "") {
				alert("내용을 입력해주세요.");
				return;
			} else {
				frm.submit();
			}
		}
	
	</script>
	
	<style>
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
		select {
			width : 90px;
			height : 30px;
			color : white;
			background : #2F506D;
			-webkit-appearance: none;
			border-radius : 5px;
			text-align: center;
		}
	</style>
</head>

<body>
<div id="wrap">	
	<header id="header"></header>
	<br>
	<form action = "noticeReg.do" method = "post" enctype = "multipart/form-data" name = "frm">
		<div style="margin-left:23%;margin-right:23%;">
			<h2 >| 공지사항 등록</h2>
			<br>
			<select name = "category">
				<option value = "">- 선택 -</option>
				<option value = "1">유저</option>
				<option value = "2">호스트</option>
			</select>
			<br>
			<br>
			<input type = "text" name = "title" placeholder = "제목을 입력해주세요.">
			<br>
			<br>
			<textarea id="summernote" name="content" placeholder = "내용을 입력해주세요."></textarea>
			<br>
			<div class="filebox bs3-primary">
				<label for="ex_filename">업로드</label> 
        	    <input class="upload-name" value="파일선택" disabled="disabled">
        	    <input type="file" id="ex_filename" class="upload-hidden" name = "file"> 
			</div>
			<br>
			<input type = "button" value = "등록하기" onclick = "noticeReg()" id = "regBtn">
		</div>
	</form>
	<footer id="footer" class="mt-5"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>