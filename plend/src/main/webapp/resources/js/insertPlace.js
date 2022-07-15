	'use strict';
	
	//카테고리 선택
		function cate(obj){
			
			const cate = $(obj).val();
			console.log(cate);
			//값을 재선택할 때 비우기
			$("#cate").attr('value','');		
			//카데고리 선택 값
			$("#cate").attr('value',cate);
			
			//선택되는 카테고리에 따라서 옵션선택 값 다르게 제공
			if(cate == 'meeting'){
				$(".option1").css("display", "none");
				$("#option_meeting").css("display", "block");
				
			}else if(cate == 'gallery'){
				$(".option1").css("display", "none");
				$("#option_gallery").css("display", "block");
				
			}else if(cate == 'dancePractice'){
				$(".option1").css("display", "none");
				$("#option_dancePractice").css("display", "block");
				
			}else if(cate == 'homeGim'){
				$(".option1").css("display", "none");
				$("#option_homeGim").css("display", "block");
				
			}else if(cate == 'office'){
				$(".option1").css("display", "none");
				$("#option_office").css("display", "block");
				
			}else if(cate == 'officeShare'){
				$(".option1").css("display", "none");
				$("#option_officeShare").css("display", "block");
				
			}else if(cate == 'partyRoom'){
				$(".option1").css("display", "none");
				$("#option_partyRoom").css("display", "block");
				
			}else if(cate == 'recording'){
				$(".option1").css("display", "none");
				$("#option_recording").css("display", "block");
				
			}else if(cate == 'shareKitchen'){
				$(".option1").css("display", "none");
				$("#option_shareKitchen").css("display", "block");
				
			}else if(cate == 'singPractice'){
				$(".option1").css("display", "none");
				$("#option_singPractice").css("display", "block");
				
			}else if(cate == 'smallWedding'){
				$(".option1").css("display", "none");
				$("#option_smallWedding").css("display", "block");
				
			}else if(cate == 'studio'){
				$(".option1").css("display", "none");
				$("#option_studio").css("display", "block");
				
			}
			
			
			
			
		}
	

	

	//해쉬태그
    	$(document).ready(function () {
       	 	var tag = {};
        	var counter = 0;

        	// 입력한 값을 태그로 생성한다.
        	function addTag (value) {
            	tag[counter] = value;
            	counter++; // del-btn 의 고유 id 가 된다.
      		}	

        	// tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
        	function marginTag () {
            	return Object.values(tag).filter(function (word) {
                	return word !== "";
            	});
        	}
    
        	// 서버에 제공
        	$("#tag-form").on("submit", function (e) {
        		var value = marginTag(); // return array
            	$("#rdTag").val(value); 

            	$(this).submit();
        	});

        	$("#tag").on("keypress", function (e) {
            	var self = $(this);

            	//엔터나 스페이스바 눌렀을때 실행
            	if (e.key === "Enter" || e.keyCode == 32) {

               	 	var tagValue = self.val(); // 값 가져오기

                	// 해시태그 값 없으면 실행X
                	if (tagValue !== "") {

                    	// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                    	var result = Object.values(tag).filter(function (word) {
                        return word === tagValue;
                    	})
                
                    	// 해시태그가 중복되었는지 확인
                    	if (result.length == 0) { 
                        	$("#tag-list").append("<li class='tag-item'># "+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                        	addTag(tagValue);
                        	self.val("");
                    	} else {
                        	alert("태그값이 중복됩니다.");
                    	}
                	}
                	e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
            	}
        	});

        	// 삭제 버튼 
        	// 인덱스 검사 후 삭제
        	$(document).on("click", ".del-btn", function (e) {
            	var index = $(this).attr("idx");
            	tag[index] = "";
            	$(this).parent().remove();
        	});
		})



	//주소
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

	//주소합치기 
		$(function(){
	
			var a = $("#address").val();
			var b = $("#detailAddress").val();
			var addr =  a+b;
		
			$("#addr").val(addr);
		});
		


	//이용가능 시간대 설정
	
		$(document).ready(function(){
   			
			$("#avaliableTime").change(function(){
        	
   				if($("#avaliableTime").is(":checked")){
   					$('#kt_datepicker_1').attr('disabled', 'true').css("color","#d2d2d2	");
   					$('#kt_datepicker_2').attr('disabled', 'true').css("color","#d2d2d2");
        	
   				}else{
   					$('#kt_datepicker_1').removeAttr('disabled', 'true').css("color","#8c8c8c");
   					$('#kt_datepicker_2').removeAttr('disabled', 'true').css("color","#8c8c8c");
   					
        	
   				}
    	
			});
	
		});
			
		
	//영업시간 설정
		$("#kt_datepicker_1").flatpickr({
    		enableTime: true,
    		noCalendar: true,
    		dateFormat: "H:i",
		});
		
		$("#kt_datepicker_2").flatpickr({
    		enableTime: true,
    		noCalendar: true,
    		dateFormat: "H:i",
		});

	
	//장소 등록
		function check(){
			
			if($("#cate").val() == ""){
				alert("장소 카테고리를 선택해 주세요.");
				$("#cate").focus();
				
			}else if($("#placeName").val() == ""){
				alert("장소 이름을 입력해 주세요.");
				$("#placeName").focus();
				
			}else if($("#placeDetail").val() == ""){
				alert("장소에 대한 설명을 입력해주세요.");
				$("#placeDetail").focus();
				
			//}else if($("#placeImg").val() == ""){
			//	alert("공간에 대한 사진을 등록해주세요.");
			//	$("#placeImg").focus();
				
			}else if($("#guide").val() == ""){
				alert("시설 이용정보를 작성해주세요.");
				$("#guide").focus();
				
			}else if($("#address").val() == ""){
				alert("주소를 입력해 주세요");
				$("#address").focus();
				
			}else if($("#kt_datepicker_1").val() == ""){
				alert("장소의 영업시작 시각을 입력해주세요");
				$("#kt_datepicker_1").focus();
				
  			}else if($("#kt_datepicker_2").val() == ""){
				alert("장소의 영업종료 시각을 입력해주세요");
				$("#kt_datepicker_2").focus();
				
			}else if($("#intervalTime > option:selected").val()==""){
				alert("예약시간 단위를 입력해주세요. 입력하신 시간마다 예약이 열립니다.");
				$("#intervalTime").focus();
				
			}else if($("#price").val() == ""){
				alert("시간당 금액을 입력해주세요.");
				$("#price").focus();
				
			}else{
				
				confirm("등록하시겠습니까?");
				
				$("#frm").action ="host/insertPlace.do";
				$("#frm").method ="post";
				$("#frm").submit();			
				
			}
			
			
			
	}
	
	