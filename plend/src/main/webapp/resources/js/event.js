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
	}
}
