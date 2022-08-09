<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="frm" action="modifyEvent.do" method="POST" enctype="multipart/form-data" onsubmit="return validation()">
<section class="row px-1">
	<table class="col table text-center table-hover">
	  <tbody>
		<tr class="border-top"> 
			<td scope="row">진행여부</td>
			<td>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" value="start" type="radio" name="startEnd" id="radio1">
				  <label class="form-check-label" for="radio1">진행</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" value="end" type="radio" name="startEnd" id="radio2">
				  <label class="form-check-label" for="radio2">미진행</label>
				</div>
			</td>
		</tr>
		<tr> 
			<td class="align-middle text-center">카테고리</td>
			<td>
				<select class="form-select" name="category">
				  <option value="gallery">갤러리</option>
				  <option value="shareKitchen">공유주방</option>
				  <option value="recording">녹음실</option>
				  <option value="singPractice">노래 연습실</option>
				  <option value="shareOffice">공유 오피스</option>
				  <option value="office">독립 오피스</option>
				  <option value="smallWedding">스몰웨딩</option>
				  <option value="homeGym">운동시설</option>
				  <option value="studio">촬영 스튜디오</option>
				  <option value="dancePractice">춤 연습실</option>
				  <option value="partyRoom">파티룸</option>
				  <option value="meeting">회의실</option>
				</select>
			</td>
		</tr>
		<tr> 
			<td class="align-middle text-center">이벤트 기간</td>
			<td><input name="edate" type="date" class="form-control edate"> </td>
		</tr>
		<tr> 
			<td class="align-middle text-center">제목</td>
			<td><input name="title" type="text" class="form-control" value="${eventvo.title}" required> </td>
		</tr>
		<tr> 
			<td class="align-middle text-center">상세내용</td>
			<td><input name="semiTitle" type="text" class="form-control" value="${eventvo.semiTitle}" required></td>
		</tr>
		<tr> 
			<td class="align-middle text-center">이벤트 설명</td>
			<td><input name="content" type="text" class="form-control" value="${eventvo.content}" required> </td>
		</tr>
		<tr> 
			<td class="align-middle text-center">이용조건</td>
			<td><input name="conditions" id="conditions" type="text" class="form-control" value="${eventvo.conditions}" required> </td>
		</tr>
		<tr> 
			<td class="align-middle text-center">메인 이미지 등록 </td>
			<td><input name="eventImg" class="form-control" type="file" id="formFile"> </td>
		</tr>
		<tr> 
			<td class="align-middle text-center">배너 등록 </td>
			<td><input name="eventImg" class="form-control" type="file" id="formFile"> </td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="hidden" name="eidx" value="${eventvo.eidx}">
			</td>
		</tr>
	  </tbody>
	</table>
</section>
<div class="row">
	<div class="col text-center mb-5">
		<a class="btn btn-primary btn-sm rounded-pill formReset" role="button">초기화</a>
      	<button class="btn btn-primary btn-sm rounded-pill">이벤트 수정</button>
	</div>
</div>
</form>
<!-- selectBox/ 진행여부 선택하기 -->
<script>
	$(".form-select").val("${eventvo.category}").prop("selected",true);
	$("input[name='startEnd']").each(function(){
		if($(this).val() == "${eventvo.startEnd}"){
			$(this).prop("checked",true);
		}
	})
</script>
<!-- timePicker 형식 -->
<script>
	var edate = "${eventvo.edate}"; 	
	var date = edate.split(" to ");
	$(".edate").flatpickr({
		mode: "range",
		defaultDate: [date[0],date[1]]		
	});
</script>
<!-- formReset -->
<script type="text/javascript">
	$(".formReset").click(function(){
		$(":input", "#frm").val('');
	})
</script>