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
	var input = document.querySelector('input[name="tag"]'),
    // init Tagify script on the above inputs
    tagify = new Tagify(input, {
      whitelist:
       ["모던한", "깨끗한", "자연광", "단독대관", "헬스", "운동", "인스타", "따뜻한", "프라이빗", "스튜디오", "영상촬영", "음식촬영", "청결한", "스튜디오",
       "공유주방", "쉐어키친", "헬스장", "스몰웨딩", "전시", "화보촬영", "인터뷰",
       "조용한", "화려한", "접근성좋은", "빈티지", "야간촬영", "무대", "할인", "ALGOL 68",
       "ALGOL W", "Alice", "Alma-0", "AmbientTalk", "Amiga E", "AMOS", "AMPL", "Apex (Salesforce.com)", "APL", "AppleScript", "Arc",
       "ARexx", "Argus", "AspectJ", "Assembly language", "ATS", "Ateji PX", "AutoHotkey", "Autocoder", "AutoIt", "AutoLISP / Visual LISP",
       "Averest", "AWK", "Axum", "Active Server Pages", "ASP.NET", "B", "Babbage", "Bash", "BASIC", "bc", "BCPL", "BeanShell",
       "Batch (Windows/Dos)", "Bertrand", "BETA", "Bigwig", "Bistro", "BitC", "BLISS", "Blockly", "BlooP", "Blue", "Boo", "Boomerang",
       "Bourne shell (including bash and ksh)", "BREW", "BPEL", "B", "C--", "C++ – ISO/IEC 14882", "C# – ISO/IEC 23270", "C/AL",
       "Caché ObjectScript", "C Shell", "Caml", "Cayenne", "CDuce", "Cecil", "Cesil", "Céu", "Ceylon", "CFEngine", "CFML", "Cg",
       "Ch", "Chapel", "Charity", "Charm", "Chef", "CHILL", "CHIP-8", "chomski", "ChucK", "CICS", "Cilk", "Citrine (programming language)",
       "CL (IBM)", "Claire", "Clarion", "Clean", "Clipper", "CLIPS", "CLIST", "Clojure", "CLU", "CMS-2", "COBOL – ISO/IEC 1989",
       "CobolScript – COBOL Scripting language", "Cobra", "CODE", "CoffeeScript", "ColdFusion", "COMAL", "Combined Programming Language (CPL)",
       "COMIT", "Common Intermediate Language (CIL)", "Common Lisp (also known as CL)", "COMPASS", "Component Pascal",
       "Constraint Handling Rules (CHR)", "COMTRAN", "Converge", "Cool", "Coq", "Coral 66", "Corn", "CorVision", "COWSEL",
       "CPL", "CPL", "Cryptol", "csh", "Csound", "CSP", "CUDA", "Curl", "Curry", "Cybil", "Cyclone", "Cython", "Java", "Javascript",
       "M2001", "M4", "M#", "Machine code", "MAD (Michigan Algorithm Decoder)", "MAD/I", "Magik", "Magma", "make", "Maple",
       "MAPPER now part of BIS", "MARK-IV now VISION:BUILDER", "Mary", "MASM Microsoft Assembly x86", "MATH-MATIC", "Mathematica",
       "MATLAB", "Maxima (see also Macsyma)", "Max (Max Msp – Graphical Programming Environment)", "Maya (MEL)", "MDL", "Mercury",
       "Mesa", "Metafont", "Microcode", "MicroScript", "MIIS", "Milk (programming language)", "MIMIC", "Mirah", "Miranda", "MIVA Script",
       "ML", "Model 204", "Modelica", "Modula", "Modula-2", "Modula-3", "Mohol", "MOO", "Mortran", "Mouse", "MPD", "Mathcad",
        "MSIL – deprecated name for CIL", "MSL", "MUMPS", "Mystic Programming L"],
      maxTags: 10,
      
      dropdown: {
        maxItems: 20,           // <- mixumum allowed rendered suggestions
        classname: "tags-look", // <- custom classname for this dropdown, so it could be targeted
        enabled: 0,             // <- show suggestions on focus
        closeOnSelect: false    // <- do not hide the suggestions dropdown once an item has been selected
      }
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
		
		function concatAddr(){
		
			var a = $("#address").val();
			var b = $("#detailAddress").val();
			var addr =  a+"&nbsp"+b;
		
			$("#addr").val(addr);
			
		}
			
		
		
		


	//시설이용 정보 합치기 
		function facilities(){

			var g1 = $("#guide1").val();
			var g2 = $("#guide2").val();
			var g3 = $("#guide3").val();
			var g4 = $("#guide4").val();
			var g5 = $("#guide5").val();
			var g6 = $("#guide6").val();
			var g7 = $("#guide7").val();
			var g8 = $("#guide8").val();
			var g9 = $("#guide9").val();
			var g10 = $("#guide10").val();
			
			var guide = g1+"/"+g2+"/"+g3+"/"+g4+"/"+g5+"/"+g6+"/"+g7+"/"+g8+"/"+g9+"/"+g10;
			console.log(g1);
			$("#guide").val(guide);
			console.log($("#guide").val());
			
		}
		


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
		
	
	// 영업 시간 24시간 설정
		
		
		
		$("#avaliableTime").change(function(){
		console.log("체크박스");
				$('#kt_datepicker_1').val('00');
				$('#kt_datepicker_2').val('00');
		})
			

		

	
	//장소 등록
		function check(){
		
		
			
			concatAddr();
			facilities();
			
			if($("#cate").val() == ""){
				alert("장소 카테고리를 선택해 주세요.");
				$("#cate").focus();
				
			}else if($("#placeName").val() == ""){
				alert("장소 이름을 입력해 주세요.");
				$("#placeName").focus();
				
			}else if($("#placeDetail").val() == ""){
				alert("장소에 대한 설명을 입력해주세요.");
				$("#placeDetail").focus();
				
			}else if($("#placeImg").val() == ""){
				alert("공간에 대한 사진을 등록해주세요.");
				$("#placeImg").focus();
				
			}else if($("#guide1").val() == ""){
				alert("시설 이용정보를 최소 3개이상 작성해주세요");
				$("#guide1").focus();
				
			}else if($("#guide2").val() == ""){
				alert("시설 이용정보를 최소 3개이상 작성해주세요");
				$("#guide2").focus();
				
			}else if($("#guide3").val() == ""){
				alert("시설 이용정보를 최소 3개이상 작성해주세요");
				$("#guide3").focus();
				
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
	
	