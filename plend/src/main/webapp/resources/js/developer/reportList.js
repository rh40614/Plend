'use strict';
var pathname = "/" + window.location.pathname.split("/")[1] + "/";
var contextPath = window.location.origin;

<!-- 리뷰 블라인드 처리 -->
function doBlind(rvidx,rbidx,status){
	if(confirm("블라인드처리 하시겠습니까?")){
		var param = "?rvidx=" + rvidx + "&rbidx=" +rbidx;
		$.ajax({
			url: contextPath + pathname +"/ajax/reviewBlind.do" + param,
			success: function(data){
				if(data==1){
					$('#blind'+status).addClass('grayBtn');
				}else{
					alert("블라인드 처리에 실패했습니다.");
				}
			}
		});
	}
}