<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-장소등록</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	
	<!-- 2022.07.13 김연희 : js 파일은 가장 아래쪽에 있음 -->
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<!-- bootstrap  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- flatPicker -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

	<!--  fontAwesome -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	
	<!-- DAUM POSTCODE  -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
	//프론트 디자인
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
		})
	</script>
	

</head>

<body>

	<header id="header"></header>
	
	<main>
		<section>
			<span class="frmTitle">플레이스 등록</span>
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
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;" value ="homeGym" onclick="cate(this)">운동시설</button>
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
						<!-- 장소등록 form 태그 시작 -->			
						<form name="frm" id="frm" method="POST" enctype="multipart/form-data">
							<!-- 카테고리 히든으로 받기  -->
							<input type="hidden" name="category" id="cate" >
							
							<h5 style="font-weight: bolder; margin-top:80px;">1. 공간</h5>
							
							
							<label class="mt-3">
								<span class="frmTitle">공간명칭 </span><br>
								<input type="text" name="placeName" id="placeName" size="30" placeholder="어떤 공간을 가지고 계신가요?">
							</label>
							<br>
							
							<!-- 해쉬태그 -->
							<div class=" mt-3" >
								<span class="frmTitle">태그 </span><br>
       					    	<div class="form-group">
           							<input type="hidden"  name="tag" id="rdTag" />
          				  		</div>
             					<ul id="tag-list" style=""></ul>
            					<div class="form-group">
            						<input type="text" id="tag" size="7" placeholder="엔터로 해시태그를 등록해주세요." style="width: 300px;"/>
           						</div>
           					
							</div>
							<br>
							
							<!-- 사진 등록 -->
							<label class="mt-3">
								<span class=" frmTitle">공간 이미지 </span><br>	
								<input type="file" name="placeImgs" id="placeImgs" multiple="multiple">
							</label>
							<!-- 사진 미리보기 이후 구현 -->
							<br>
							
							<label class="mt-3">
								<span class="frmTitle">공간소개 </span><br>
								<textarea cols="100" rows="5" name="placeDetail" id="placeDetail" placeholder="등록할 공간을 소개해주세요 :-) "></textarea>
							</label>
							<br>
							<label class="mt-3">
								<span class="frmTitle">시설정보</span><br>
								<textarea cols="100" rows="5" name="guide" id="guide"  placeholder="사용자가 이용할 시설에 대한 안내를 적어 주세요."></textarea>
							</label>
							<br>
							<div class="mt-3" >
								<span class="frmTitle">플레이스 옵션(선택) </span><br>
								<!-- 갤러리 옵션 -->
								<div id="option_gallery" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > 플레이 스테이션 </label>
								<label><input type="checkbox" name="option1" value="laptop"> 노트북 </label>
								<label><input type="checkbox" name="option1" value="laptop"> 크롬케스트  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 헤어 드라이기 </label>
								<label><input type="checkbox" name="option1" value="laptop"> 마우스 </label>
								</div>
								<!-- 회의실 옵션 -->
								<div id="option_meeting" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="chair" > 의자 </label>
								<label><input type="checkbox" name="option1" value="whiteBoard"> 화이트보드 </label>
								<label><input type="checkbox" name="option1" value="blackBoard"> 블랙보드  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
								<!-- 춤 연습실 옵션 -->
								<div id="option_dancePractice" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > ㅁㅇㄻㄴ </label>
								<label><input type="checkbox" name="option1" value="laptop"> 화이트보드 </label>
								<label><input type="checkbox" name="option1" value="laptop"> 블랙보드  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
								<!-- 헬스장 옵션 -->
								<div id="option_homeGim" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > ㄹㅇㄻ </label>
								<label><input type="checkbox" name="option1" value="laptop"> 화이트보드 </label>
								<label><input type="checkbox" name="option1" value="laptop"> 블랙보드  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
								<!-- 독립오피스 옵션 -->
								<div id="option_office" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > 의자 </label>
								<label><input type="checkbox" name="option1" value="laptop"> 화이트보드 </label>
								<label><input type="checkbox" name="option1" value="laptop"> ㅁㅇㄹ  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
								<!-- 공유오피스 옵션 -->
								<div id="option_officeShare" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > 의자 </label>
								<label><input type="checkbox" name="option1" value="laptop"> ㅁㅇㄹ </label>
								<label><input type="checkbox" name="option1" value="laptop"> 블랙보드  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
								<!-- 파티룸 옵션 -->
								<div id="option_partyRoom" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > 의자 </label>
								<label><input type="checkbox" name="option1" value="laptop"> 화이트보드 </label>
								<label><input type="checkbox" name="option1" value="laptop"> 블랙ㅁㅇㄴㄹ보드  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
								<!-- 녹음실 옵션 -->
								<div id="option_recording" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > 의자 </label>
								<label><input type="checkbox" name="option1" value="laptop"> ㅁㅇㄹ </label>
								<label><input type="checkbox" name="option1" value="laptop"> 블랙보드  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
								<!-- 공유주방 옵션 -->
								<div id="option_shareKitchen" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > 의자 </label>
								<label><input type="checkbox" name="option1" value="laptop"> ㅁㅇㄴㄹ </label>
								<label><input type="checkbox" name="option1" value="laptop"> 블랙보드  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
								<!-- 노래연습실 옵션 -->
								<div id="option_singPractice" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > 의자 </label>
								<label><input type="checkbox" name="option1" value="laptop"> ㅁㅇㄴㄹ </label>
								<label><input type="checkbox" name="option1" value="laptop"> 블랙보드  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
								<!-- 스몰웨딩 옵션 -->
								<div id="option_smallWedding" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > 의자 </label>
								<label><input type="checkbox" name="option1" value="laptop"> 화이트보드 </label>
								<label><input type="checkbox" name="option1" value="laptop"> 블랙ㅇㄹ  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
								<!-- 스튜디오 옵션 -->
								<div id="option_studio" class="option1" style="display: none">
								<label><input type="checkbox" name="option1" value="playStation" > 의자 </label>
								<label><input type="checkbox" name="option1" value="laptop"> ㅇㄴㄹ </label>
								<label><input type="checkbox" name="option1" value="laptop"> 블랙보드  </label>
								<label><input type="checkbox" name="option1" value="laptop"> 탕비실 </label>
								</div>
								
							</div>
						
							<label class="mt-3">
								<span class=" frmTitle">플레이스 옵션2(선택)</span><br>	
								<textarea  class="ta" cols="100" rows="5" name="option2" placeholder="위 항목 이외에 추가 하실 항목이 있으시다면 작성해주세요 . 관리자의 검토 후 추가하겠습니다." ></textarea>
							</label>
							<br>
							<label class="mt-3">
								<span class="frmTitle">주소 : </span><br>
								<input type="text" id="postcode" placeholder="우편번호">
								<input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
								<input type="text"  id="address" size="50" placeholder="주소" class="mt-2"><br>
								<input type="text"  id="detailAddress"  size="50"placeholder="상세주소" class="mt-2">
								<input type="text"  id="extraAddress"  size="50"placeholder="참고항목" class="mt-2">
								
								<input type="hidden" name="address" id="addr" >
							</label>
					
						<div class="horison"></div>
					
							<h5 style="font-weight: bold;">2. 이용가능 시각 및 금액</h5>
					
							<label class="mt-3">
								<span class="frmTitle">이용가능시간</span><br>
					
								<span class="frmSemiTitle">영업시작 시각</span>
									<input class="form-control form-control-solid flatpickr-input" placeholder="영업 시작" id="kt_datepicker_1" type="checkbox" name="availTime">
								<span class="frmSemiTitle">영업종료 시각</span>
									<input class="form-control form-control-solid flatpickr-input" placeholder="영업 종료" id="kt_datepicker_2" type="checkbox" name="availTime">
							</label>
							<br>
							<label class="mt-3">
								<input type="checkbox" name="availTime" id="avaliableTime" value="24hours" class="mr-3">24시간 이용가능한 공간입니다.<br>
							</label>
							<br>
							<label class="mt-3">
								<span class="frmTitle">예약시간 단위 </span><br>
								<span>고객이용가능 시간이 30분일 경우 30분 단위로 예약을 여는 것을 추천합니다.</span><br>
									<select name="intervalTime" id="intervalTime" class="mt-3" required>
										<option value="" disabled selected >예약단위</option>
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
								시간 당 <input type="text" name="price" id="price" placeholder="ex) 10000">원으로 으로 책정합니다.
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
	<script script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/insertPlace.js"></script>
</body>
</html>