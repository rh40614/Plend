<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-장소등록</title>
	<link href="resources/css/global_Host.css" rel="stylesheet">
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	

	<script type="text/javascript">
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
		//장소 등록
		function check (){
			if($("#cate") == null){
				alert("장소 카테고리를 선택해 주십시오");
			}else if($("input[name=placeName]")){
				
			}
			
		
		
		}
	</script>
	
	
</head>
<body>

	<header id="header"></header>
	
	<main>
		<section style="margin-left:250px;">
			<span class="title">플레이스 등록</span>
			<div class="m-auto">
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
				<br>
				<div>				
				<form name="frm">
					<!-- 카테고리 히든으로 받기  -->
					<input type="hidden" name="category" value="" id="cate">
					<label>
					<span class="frmTitle">공간명칭 :</span>
					<input type="text" name="placeName" size="30" placeholder="어떤 공간을 가지고 계신가요?">
					</label>
					<br>
					<label>
					<span class="frmTitle">공간소개 :</span>
					<textarea cols="100" rows="5"  name="placeDetail" placeholder="등록할 공간을 소개해주세요 :-) "></textarea>
					</label>
					<br>
					<label>
					<span class="frmTitle">태그: </span>
					<input type="text" name="tag" id=""> 
				
					</label>
					<br>
					<label>
					<span class="frmTitle">시설정보 :</span>
					<textarea cols="100" rows="5" name="guide" placeholder="사용자가 이용할 시설에 대한 안내를 적어 주세요."></textarea>
					</label>
					<br>
					
					<span class="frmTitle">플레이스 옵션(선택): </span>
					<label><input type="checkbox"  name="option1" value="playStation"> 플레이 스테이션 </label>
					<label><input type="checkbox"  name="option1" value="laptop"> 노트북 </label>
					<label><input type="checkbox"  name="option1" value="laptop"> 크롬케스트  </label>
					<label><input type="checkbox"  name="option1" value="laptop"> 헤어 드라이기 </label>
					<label><input type="checkbox"  name="option1" value="laptop"> 마우스 </label>
					<br>
					<span class="frmTitle">플레이스 옵션2(선택): </span>
					<textarea cols="100" rows="5" name="option2" placeholder="위 항목 이외에 추가 하실 항목이 있으시다면 작성해주세요 . 관리자의 검토 후 추가하겠습니다." ></textarea>
					
					<br>
					<span>공간 이미지: </span>
					<input type="file" name="placeImg">
					
					<br>
					<br>
					<span>주소 : </span>
					
					<input type="text" id="postcode" placeholder="우편번호">
					<input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address" id="address" placeholder="주소"><br>
					<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
					<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
				
					
					
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