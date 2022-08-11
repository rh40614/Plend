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
	console.log($(".edate").val());
	if($(".edate").val() == ""){
		alert("날짜를 입력해주세요");
		return false;
	}else if($("input[name='eventImg']").val() == ""){
		alert("메인 이미지를 등록해주세요");
		return false;
	}else if($("#formFile").val() == ""){
		alert("배너 이미지를 등록해주세요");
		return false;
	}
}

// 이벤트 삭제 전 물어보기
function deleteConfirm(eidx,category){
	if(confirm("삭제 하시겠습니까?")){
		location.replace("deleteEvent.do?eidx="+eidx+"&category="+category)
	}
}







