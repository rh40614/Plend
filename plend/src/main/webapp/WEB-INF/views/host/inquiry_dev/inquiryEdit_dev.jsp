<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
	
	<!-- 문의하기 -->
	<section style="margin-top: 100px;" >
		<span class="title1">문의 내용 수정 </span>
		<br>
		<span class="spaceL">문의에 대한 답변이 달린 이후에는 수정이 불가능합니다. </span>
		<!-- 썸머노트 -->
		<div class="spaceL mt-2">
			<form name="frm" id="frm">
			<input type="hidden" value="${inquiry.iqidx}" name="iqidx">
			<select name="category">
				<option value="place">장소</option>
				<option value="payment">결제</option>
				<option value="refund">환불</option>
				<option value="report">신고</option>
			</select>
				<span>문의제목 </span><input type="text" name="title" size="50"  value="${inquiry.title}" required>
				<textarea id="summernote" name="content" required >${inquiry.content}</textarea> 
				<button type="button" class="btnBig" onclick="saveContent()" >저장</button>
			</form>
		</div>
	</section >
	
	<!-- 썸머노트 -->
	<script type="text/javascript">
		
 			$('#summernote').summernote({
 				width: 1250,
	 			height: 400,		// 기본 높이값
			    minHeight: 450,		// 최소 높이값(null은 제한 없음)
			    maxHeight: null,  	// 최대 높이값(null은 제한 없음)
			    focus: true,          // 페이지가 열릴때 포커스를 지정함
			    placeholder: '문의를 작성해주세요.',
			    lang: 'ko-KR'
 			});
		

	</script>
	
	<!-- 운영자 문의 수정  -->
	<script>
		function saveContent(){
			var inquiryEdit = $("#frm").serialize();
			$.ajax({
				url: "inquiryEdit_dev.do", 
				type: "POST",
				enctype: 'multipart/form-data',  
				data: inquiryEdit,
				success: function(data){
						console.log("수정 성공");
						$("#inquiryEdit_dev").html(data);
					}
					
				});
			}
	</script>