'use strict';

// timpicker 형식
$(".edate").flatpickr({
	mode: "range"
});

// formReset
$(".formReset").click(function(){
	$(this).closest("form")[0].reset();
})

// ajax이용 수정페이지 불러오기
function modifyEvent(eidx){
	$.ajax({
		url:"modifyEvent.do?eidx=" + eidx,
		success: function(result){
			$("#formPosition").html(result);
		}
	});
}

// form submit 전 날짜 유효성 검사 
function validation(){
	if($(".edate").val() == ""){
		alert("날짜를 입력해주세요");
		return false;
	}else if($("input[name='eventImg']").val() == ""){
		alert("메인 이미지를 등록해주세요");
		return false;
	}else if($("#formFile").val() == ""){
		alert("배너 이미지를 등록해주세요");
		return false;
	}else if($("input[name='title']").val().length > 50){
		alert("이벤트 제목이 너무 깁니다.");
		return false;
	}else if($("input[name='semiTitle']").val().length > 50){
		alert("상세내용이 너무 깁니다.");
		return false;
	}else if($("input[name='content']").val().length > 500){
		alert("이벤트 설명이 너무 깁니다.");
		return false;
	}else if($("input[name='conditions']").val().length > 150){
		alert("이용조건이 너무 깁니다.");
		return false;
	}else{
		if(confirm("등록하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
}

// 이벤트 삭제 전 물어보기
function deleteConfirm(eidx,category){
	if(confirm("삭제 하시겠습니까?")){
		location.replace("deleteEvent.do?eidx="+eidx+"&category="+category)
	}
}







