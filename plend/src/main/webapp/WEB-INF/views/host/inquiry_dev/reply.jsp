<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
	
	<!-- 답변하기 -->
	<section>
		<span class="title1">답변 작성</span>
		<br>
		<span class="spaceL">답변을 작성하실때는 업체 분들의 상황을 고려하여 작성해 주시길 바랍니다. </span>
		<!-- 썸머노트 -->
		<div class="spaceL mt-2">
			<form name="frm2">
			<input type="hidden" value="${inquiry.iqidx}" name="iqidx">
			<select name="category">
				<option value="place">장소</option>
				<option value="payment">결제</option>
				<option value="refund">환불</option>
				<option value="report">신고</option>
				
			</select>
				<span class="ms-5 me-1">답변제목</span><input type="text" name="title" size="50"  value="RE: ${inquiry.title}" required>
				<textarea class="summernote" name="content" required >${reply.content}</textarea> 
				<button type="button" class="btnBig" onclick="cancel()">취소</button>
				<c:choose>
					<c:when test="${empty reply}">
						<button type="button" class="btnBig" onclick="reply()">저장</button>
					</c:when>
					<c:when test="${not empty reply}">
						<button type="button" class="btnBig" onclick="replyModify()">수정</button>
					</c:when>
				</c:choose>
			</form>
		</div>
	</section >
	
	<!-- 썸머노트 -->
	<script type="text/javascript">
		
 			$('.summernote').summernote({
	 			height: 400,		// 기본 높이값
			    minHeight: 450,		// 최소 높이값(null은 제한 없음)
			    focus: true,          // 페이지가 열릴때 포커스를 지정함
			    placeholder: '성심성의것 답변을 작성해 주시길 바랍니다.',
			    lang: 'ko-KR'    
 			});
		
	</script>
	
	<!-- 답변 저장 -->
	<script>
		function reply(){
			
			var replyContent = $("form[name=frm2]").serialize();
			
			$.ajax({
				url: "<%=request.getContextPath()%>/inquiry_dev/reply.do",
				type: "POST",
				data: replyContent,
				success: function(data){
					console.log("답변 저장 성공");
					/* $("#reply").html(data); */
					$(".replyTD").addClass("d-none");
				}, 
				error: function(){
					console.log("답변저장 실패");
				}
			})
			
		}
	</script>
	<!-- 답변 수정 -->
	<script>
		function replyModify(){
			
			var replyContent = $("form[name=frm2]").serialize();
			
			$.ajax({
				url: "<%=request.getContextPath()%>/inquiry_dev/replyModify.do",
				type: "POST",
				data: replyContent,
				success: function(data){
					console.log("답변 저장 성공");
					alert("수정되었습니다.");
					$(".replyTD").addClass("d-none");
				}, 
				error: function(){
					console.log("답변저장 실패");
					alert("실패 하셨습니다.");
					$(".replyTD").addClass("d-none");
				}
				
				
			})
			
		}
	</script>
	<!-- 답변창 닫기 -->
	<script>
		function cancel(){
			$(".replyTD").addClass("d-none");
		}
	</script>