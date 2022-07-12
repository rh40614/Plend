<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-장소등록</title>
	<link href="resources/css/global_Host.css" rel="stylesheet">
	<link href="resources/css/insertPlace_HOST.css" rel="stylesheet">
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	

	<script type="text/javascript">
	//프론트 디자인
		$(function(){
			$("#header").load("resources/article/hostHeaderWithNav.jsp");
		})
	</script>
		
		
	<script>
	//카테고리 선택
		function cate(obj){
			
			const cate = $(obj).val();
			console.log(cate);
			//값을 재선택할 때 비우기
			$("#cate").attr('value','');		
			//카데고리 선택 값
			$("#cate").attr('value',cate);
		}
	
	</script>
	
	<script>
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
	</script>

	<script>
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
	</script>
	
	<script>
	//이용가능 시간대 설정
	
		$(document).ready(function(){
   			
			$("#avaliableTime1").change(function(){
        	
   				if($("#avaliableTime1").is(":checked")){
   					$('#avaliableTime2').attr('disabled', 'true');
   					$('#avaliableTime3').attr('disabled', 'true');
        	
   				}else{
   					$('#avaliableTime2').removeAttr('disabled', 'true');
   					$('#avaliableTime3').removeAttr('disabled', 'true');
   					
        	
   				}
    	
			});
	
		});
			
		
		
			
	</script>
	
	
	

	<script>
	//장소 등록
		function check(){
			
			if($("#cate").val() == ""){
				alert("장소 카테고리를 선택해 주세요.");
			}else if($("#placeName").val() == ""){
				alert("장소 이름을 입력해 주세요.");
			}else if($("#placeDetail").val() == ""){
				alert("장소에 대한 설명을 입력해주세요.");
			}else if($("#tag").val() == ""){
				alert("장소를 더 잘 표현하기 위해 태그를 하나 이상 작성해주세요.");
			}else if($("#placeImg").val() == ""){
				alert("공간에 대한 사진을 등록해주세요.");
			}else if($("#guide").val() == ""){
				alert("시설 이용정보를 작성해주세요.");
			}else if($("#address").val() == ""){
				alert("주소를 입력해 주세요");
			}else{
				$("#frm").action ="<%=request.getContextPath()%>/host/insertPlace.do";
				$("#frm").method ="post";
				$("#frm").submit();
			
			alert("정상 등록되었습니다.");
			}
			
			
			
	}
	</script>
	
	
</head>
<body>

	<header id="header"></header>
	
	<main>
		<section style="margin-left:250px;">
			<span class="title">플레이스 등록</span>
			<div style="margin: auto;">
				<div class="btn-group-lg mt-5" role="group" aria-label="Basic example">
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="gallery" onclick="cate(this)">갤러리</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="shareKitchen" onclick="cate(this)">공유주방</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="recording" onclick="cate(this)">녹음실</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="singPractice" onclick="cate(this)">노래 연습실</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="shareOffice" onclick="cate(this)">공유 오피스</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="office" onclick="cate(this)">독립 오피스</button>
				
				</div>
				<div class="btn-group-lg mt-1" role="group" aria-label="Basic example">
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="smallWedding" onclick="cate(this)">스몰웨딩</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="homeGim" onclick="cate(this)">운동시설</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="studio" onclick="cate(this)">촬영 스튜디오</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="dancePractice" onclick="cate(this)">춤 연습실</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="partyRoom" onclick="cate(this)">파티룸</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="meeting" onclick="cate(this)">회의실</button>
					<br>
				</div>
				<br>
				<div>
					<span>모임공간 설명</span>
					<br>
					<span>모임 : 파티룸, 공유주방, 회의실</span><br>
					<span>연습 : 춤 연습실, 노래 연습실</span><br>
					<span>촬영 : 촬영스튜디오</span><br>
					<span>행사 : 스몰웨딩, 갤러리</span><br>
					<span>오피스 : 공유 오피스, 독립 오피스</span>
				</div>
				
				<div class="horison"></div>
					<div>				
						<form name="frm" id="frm">
							<!-- 카테고리 히든으로 받기  -->
							<input type="hidden" name="category" id="cate" >
					
							<h5 style="font-weight: bold;">1. 공간</h5>
							<label class="mt-3">
								<span class="frmTitle">공간명칭 </span><br>
								<input type="text" name="placeName" id="placeName" size="30" placeholder="어떤 공간을 가지고 계신가요?">
							</label>
							<br>
							
							<!-- 해쉬태그 -->
							<div class=" mt-3" >
								<span class="frmTitle">태그 </span><br>
       					    	<div class="form-group">
           							<input type="hidden" value="" name="tag" id="rdTag" />
          				  		</div>
             					<ul id="tag-list" style=""></ul>
            					<div class="form-group">
            						<input type="text" id="tag" size="7" placeholder="엔터로 해시태그를 등록해주세요." style="width: 300px;"/>
           						</div>
           					
							</div>
							
							
							
							<br>
							<label class="mt-3">
								<span class="frmTitle">공간소개 </span><br>
								<textarea class="ta" cols="100" rows="5" name="placeDetail" id="placeDetail" placeholder="등록할 공간을 소개해주세요 :-) "></textarea>
							</label>
							<br>
							<label class="mt-3">
								<span class="frmTitle">시설정보</span><br>
								<textarea class="ta" cols="100" rows="5" name="guide" id="guide"  placeholder="사용자가 이용할 시설에 대한 안내를 적어 주세요."></textarea>
							</label>
							<br>
							<div class="mt-3">
								<span class="frmTitle">플레이스 옵션(선택) </span><br>
								<label><input type="checkbox" name="option1" value="playStation" > 플레이 스테이션 </label>
								<label><input type="checkbox"  name="option1" value="laptop"> 노트북 </label>
								<label><input type="checkbox"  name="option1" value="laptop"> 크롬케스트  </label>
								<label><input type="checkbox"  name="option1" value="laptop"> 헤어 드라이기 </label>
								<label><input type="checkbox"  name="option1" value="laptop"> 마우스 </label>
							</div>
						
							<label class="mt-3">
								<span class=" frmTitle">플레이스 옵션2(선택)</span><br>	
								<textarea  class="ta" cols="100" rows="5" name="option2" placeholder="위 항목 이외에 추가 하실 항목이 있으시다면 작성해주세요 . 관리자의 검토 후 추가하겠습니다." ></textarea>
							</label>
							<br>
							<label class="mt-3">
								<span class=" frmTitle">공간 이미지 </span><br>	
								<input type="file" name="placeImg" id="placeImg">
							</label>
							<br>
							<label class="mt-3">
								<span class="frmTitle">주소 : </span><br>
								<input type="text" id="postcode" placeholder="우편번호">
								<input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" name="address" id="address" size="50" placeholder="주소" class="mt-2"><br>
								<input type="text" name="detailAddress" id="detailAddress"  size="50"placeholder="상세주소" class="mt-2">
								<input type="text" name="extraAddress" id="extraAddress"  size="50"placeholder="참고항목" class="mt-2">
							</label>
					
						<div class="horison"></div>
					
							<h5 style="font-weight: bold;">2. 이용가능 시각 및 금액</h5>
					
							<label class="mt-3">
								<span class="frmTitle">이용가능시간</span><br>
									
									<input type="checkbox" name="avaliableTime" id="avaliableTime1" value="24hours" class="mb-3"> 24시간 이용가능한 공간입니다. <br>
									
									<select name="avaliableTime" id="avaliableTime2">
										<option selected disabled>오픈 시각</option>
										<option value="06:00">06:00</option>
										<option value="06:30">06:30</option>
										<option value="07:00">07:00</option>
										<option value="07:30">07:30</option>
										<option value="08:00">08:00</option>
										<option value="08:30">08:30</option>
										<option value="09:00">09:00</option>
										<option value="09:30">09:30</option>
										<option value="10:00">10:00</option>
										<option value="10:30">10:30</option>
										<option value="11:00">11:00</option>
										<option value="11:30">11:30</option>
										<option value="12:00">12:00</option>
										<option value="12:30">12:30</option>
										<option value="13:00">13:00</option>
										<option value="13:30">13:30</option>
										<option value="14:00">14:00</option>
										<option value="14:30">14:30</option>
										<option value="15:00">15:00</option>
										<option value="15:30">15:30</option>
										<option value="16:00">16:00</option>
										<option value="16:30">16:30</option>
										<option value="17:00">17:00</option>
										<option value="17:30">17:30</option>
										<option value="18:00">18:00</option>
										<option value="18:30">18:30</option>
										<option value="19:00">19:00</option>
										<option value="19:30">19:30</option>
										<option value="20:00">20:00</option>
										<option value="20:30">20:30</option>
										<option value="21:00">21:00</option>
										<option value="21:30">21:30</option>
										<option value="22:00">22:00</option>
										<option value="22:30">22:30</option>
										<option value="22:00">22:00</option>
										<option value="22:30">22:30</option>
										<option value="23:00">23:00</option>
										<option value="23:30">23:30</option>
										<option value="24:00">24:00</option>
										<option value="00:30">00:30</option>
										<option value="01:00">01:00</option>
										<option value="01:30">01:30</option>
										<option value="02:00">02:00</option>
										<option value="02:30">02:30</option>
										<option value="03:00">03:00</option>
										<option value="03:30">03:30</option>
										<option value="04:00">04:00</option>
										<option value="04:30">04:30</option>
										<option value="05:00">05:00</option>
										<option value="05:30">05:30</option>
									</select>
									~
									<select name="avaliableTime" id="avaliableTime3">
										<option disabled selected>영업종료시각</option>
										<option value="06:00">06:00</option>
										<option value="06:30">06:30</option>
										<option value="07:00">07:00</option>
										<option value="07:30">07:30</option>
										<option value="08:00">08:00</option>
										<option value="08:30">08:30</option>
										<option value="09:00">09:00</option>
										<option value="09:30">09:30</option>
										<option value="10:00">10:00</option>
										<option value="10:30">10:30</option>
										<option value="11:00">11:00</option>
										<option value="11:30">11:30</option>
										<option value="12:00">12:00</option>
										<option value="12:30">12:30</option>
										<option value="13:00">13:00</option>
										<option value="13:30">13:30</option>
										<option value="14:00">14:00</option>
										<option value="14:30">14:30</option>
										<option value="15:00">15:00</option>
										<option value="15:30">15:30</option>
										<option value="16:00">16:00</option>
										<option value="16:30">16:30</option>
										<option value="17:00">17:00</option>
										<option value="17:30">17:30</option>
										<option value="18:00">18:00</option>
										<option value="18:30">18:30</option>
										<option value="19:00">19:00</option>
										<option value="19:30">19:30</option>
										<option value="20:00">20:00</option>
										<option value="20:30">20:30</option>
										<option value="21:00">21:00</option>
										<option value="21:30">21:30</option>
										<option value="22:00">22:00</option>
										<option value="22:30">22:30</option>
										<option value="22:00">22:00</option>
										<option value="22:30">22:30</option>
										<option value="23:00">23:00</option>
										<option value="23:30">23:30</option>
										<option value="24:00">24:00</option>
										<option value="00:30">00:30</option>
										<option value="01:00">01:00</option>
										<option value="01:30">01:30</option>
										<option value="02:00">02:00</option>
										<option value="02:30">02:30</option>
										<option value="03:00">03:00</option>
										<option value="03:30">03:30</option>
										<option value="04:00">04:00</option>
										<option value="04:30">04:30</option>
										<option value="05:00">05:00</option>
										<option value="05:30">05:30</option>
									</select>
							</label>
							
							<br>
							<label class="mt-3">
								<span class="frmTitle">예약시간 단위 </span><br>
								<span>고객이용가능 시간이 30분일 경우 30분 단위로 예약을 여는 것을 추천합니다.</span><br>
									<select name="intervalTime" class="mt-3">
										<option disabled selected >예약단위</option>
										<option value="1" >30분</option>
										<option value="2" >1시간</option>
										<option value="3" >2시간</option>
										<option value="4" >4시간</option>
										<option value="5" >6시간</option>
									</select>
							
							</label>
							<br>
							<label class="mt-3">
								<span class="frmTitle">가격 </span><br>
								시간 당 <input type="text" name="price" id="price" placeholder="">원으로 으로 책정합니다.
							</label>
							<br>
					
					
							<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px; border-radius: 20px; float:right; " onclick="check()">장소 등록</button>
				</form>
				
				
				
				
				</div>
				
				
			</div>
			
			


		</section>
		
		<div>
		
		
		</div>
		
		
	</main>
	<div style="margin:300px;"></div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>