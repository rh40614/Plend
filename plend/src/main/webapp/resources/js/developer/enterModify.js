'use strict';
var pathname = "/" + window.location.pathname.split("/")[1] + "/";
var contextPath = window.location.origin;

<!-- daumMapAPI javaScript -->
function DaumPostcode() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        
	        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	        var addr = ''; // 주소 변수
	        var extraAddr = ''; // 참고항목 변수
	        
	        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	            addr = data.roadAddress;
	        } else { // 사용자가 지번 주소를 선택했을 경우(J)
	            addr = data.jibunAddress;
	        }
	        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	        if(data.userSelectedType === 'R'){
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraAddr !== ''){
	                extraAddr = ' (' + extraAddr + ')';
	            }
	            // 조합된 참고항목을 해당 필드에 넣는다.
	            document.getElementById("extraAddress").value = extraAddr;
	        
	        } else {
	            document.getElementById("extraAddress").value = '';
	        }
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById('postcode').value = data.zonecode;
	        document.getElementById("address").value = addr;
	        // 커서를 상세주소 필드로 이동한다.
	        document.getElementById("detailAddress").focus();
	    }
	}).open();
}

<!-- submit 할 때  주소 합쳐 보내기-->
function modifySubmit(){
	if(confirm("저장하시겠습니까?")){
		if($("input[name='id']").val().length > 10){
			alert("아이디를 열글자 이하로 수정해주세요.");
			return false;
		}else if($("input[name='name']").val().length > 10){
			alert("대표자명을 열글자 이하로 수정해주세요.");
			return false;
		}else if($("input[name='nickName']").val().length > 10){
			alert("업체명을 열글자 이하로 수정해주세요.");
			return false;
		}else if($("#detailAddress").val() == ""){
			alert("상세주소를 입력해주세요.");
			return false;
		}else if($("input[name='userPhone']").val().length > 15){
			alert("연락처를 다시 한번 확인 해주세요.");
			return false;
		}else if(!/^\d{3}-\d{3,4}-\d{4}$/.test($("input[name='userPhone']").val())){
			alert("연락처에 '-'과 숫자만 사용해주세요.");
			return false;
		}else{
			var address = $("#address").val();
			var detailAddress = $("#detailAddress").val();
			var addr = address + " " + detailAddress;
			
			$("#addr").val(addr);
			return true;
		}
	}else{
		return false;
	}
}








