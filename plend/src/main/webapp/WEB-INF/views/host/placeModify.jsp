<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 08.11 김영민 -->
<html style=" font-size: initial;"><!-- 08.24 김연희 : 썸머노트로 변경 : 글시 크기 초기화 -->
<head>
<meta charset="UTF-8">
<title>Hostcenter-장소 수정</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	<!-- summerNote 제이쿼리랑 부트스트랩이 포함되어있음-->
		<!-- include libraries(jQuery, bootstrap) -->
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		
		<!-- include summerNote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
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
	<!-- 해쉬 태그  -->
	<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	//프론트 디자인
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/hostfooter.jsp");
		})
	</script>
</head>
<body>
	<header id="header"></header>
	<main>
		<section>
			<span class="title1">플레이스 수정</span>
			<div style="margin-left: 10%;">
				<div class="btn-group-lg mt-5" role="group" aria-label="Basic example">
  					<button type="button" class="insertPlaceBtn" value ="gallery" onclick="cate(this)">갤러리</button>
  					<button type="button" class="insertPlaceBtn" value ="shareKitchen" onclick="cate(this)">공유주방</button>
  					<button type="button" class="insertPlaceBtn" value ="recording" onclick="cate(this)">녹음실</button>
  					<button type="button" class="insertPlaceBtn" value ="singPractice" onclick="cate(this)">노래 연습실</button>
  					<button type="button" class="insertPlaceBtn" value ="shareOffice" onclick="cate(this)">공유 오피스</button>
  					<button type="button" class="insertPlaceBtn" value ="office" onclick="cate(this)">독립 오피스</button>
				
				</div>
				<div class="btn-group-lg mt-1" role="group" aria-label="Basic example">
  					<button type="button" class="insertPlaceBtn" value ="smallWedding" onclick="cate(this)">스몰웨딩</button>
  					<button type="button" class="insertPlaceBtn" value ="homeGym" onclick="cate(this)">운동시설</button>
  					<button type="button" class="insertPlaceBtn" value ="studio" onclick="cate(this)">촬영 스튜디오</button>
  					<button type="button" class="insertPlaceBtn" value ="dancePractice" onclick="cate(this)">춤 연습실</button>
  					<button type="button" class="insertPlaceBtn" value ="partyRoom" onclick="cate(this)">파티룸</button>
  					<button type="button" class="insertPlaceBtn" value ="meeting" onclick="cate(this)">회의실</button>
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
							<input type="hidden" name="category" id="cate" value="${place.category}">
							<input type="hidden" name="pidx" value="${place.pidx}" readonly>
							<h5 class="title2" >1. 공간</h5>
							
							<br>
							<label class="mt-3">
								<span class="title3">공간명칭 </span><br>
								<input type="text" name="placeName" id="placeName" size="30" value="${place.placeName}">
							</label>
							<br>
							<label class="mt-3">
								<span class="title3">최대 수용가능 인원 </span><br>
								<input type="number" name="cntPeople" id="cntPeople" min="1" value="${place.cntPeople}">
							</label>
							<br>
							
							<!-- 해쉬태그 -->
							<div class=" mt-3" >
								<span class="title3">태그 </span><br>
								<p>최대 10개의 태그를 작성할 수있습니다. 태그를 작성하고 공간을 더욱 자세하게 설명해보세요!</p>
								<input name='tag' class='some_class_name' placeholder='write some tags' value='장소에,어울리는,태그를,달아보세요'>
								
							</div>
							<br>
							
							<!-- 사진 등록 -->
							<label class="mt-3">
								<span class="title3">공간 이미지 </span><br>
								<span style="font-size: small; color: red;">이미지를 새로 등록해주세요.</span><br>
								<input type="file" name="placeImgs" id="placeImgs" multiple="multiple" onchange="setDetailImage(event); removePicture()">
							</label>
							<!-- 사진 미리보기 이후 구현 -->
							<div id="images_container" class="mt-2"></div>
							<br>
							
							<label class="mt-3">
								<span class="title3">공간소개 </span><br>
								<textarea id="summernote" name="placeDetail" id="placeDetail" required ></textarea>
							</label>
							<br>
							
							<div>
								<span class="title3">시설정보</span><br>
								<table class="table" > 
									<tr>
										<td class="col-md-1 guideNum">1.</td>
										<td class="col-md-11"><input type="text" id="guide1" placeholder="시설의 이용하면서 주의해야할 사항을 알려주세요" size="100" class="border-0 " onkeydown="slash(this)" onblur="guideValid(this)"></td>
									</tr>
									<tr class="guideValid" style="display: none;">
										<td colspan ="2" class="col-md-12" ></td>
									</tr>
									<tr>
										<td class="col-md-1 guideNum">2.</td>
										<td><input type="text" id="guide2" placeholder="시설의 이용하면서 주의해야할 사항을 알려주세요" size="100" class="border-0 " onblur="guideValid(this)" onkeydown="slash(this)"></td>
									</tr>
									<tr class="guideValid" style="display: none;">
										<td colspan ="2" class="col-md-12" ></td>
									</tr>
									<tr>
										<td class="col-md-1 guideNum">3.</td>
										<td><input type="text" id="guide3" placeholder="시설의 이용하면서 주의해야할 사항을 알려주세요" size="100" class="border-0 " onblur="guideValid(this)" onkeydown="slash(this)"></td>
									</tr>
									<tr class="guideValid" style="display: none;">
										<td colspan ="2" class="col-md-12" ></td>
									</tr>
									<tr>
										<td class="col-md-1 guideNum">4.</td>
										<td><input type="text" id="guide4" placeholder="시설의 이용하면서 주의해야할 사항을 알려주세요" size="100" class="border-0 " onblur="guideValid(this)" onkeydown="slash(this)"></td>
									</tr>
									<tr class="guideValid" style="display: none;">
										<td colspan ="2" class="col-md-12" ></td>
									</tr>
									<tr>
										<td class="col-md-1 guideNum">5.</td>
										<td><input type="text" id="guide5" placeholder="시설의 이용하면서 주의해야할 사항을 알려주세요" size="100" class="border-0 " onblur="guideValid(this)" onkeydown="slash(this)"></td>
									</tr>
									<tr class="guideValid" style="display: none;">
										<td colspan ="2" class="col-md-12" ></td>
									</tr>
									<tr>
										<td class="col-md-1 guideNum">6.</td>
										<td><input type="text" id="guide6" placeholder="시설의 이용하면서 주의해야할 사항을 알려주세요" size="100" class="border-0 " onblur="guideValid(this)" onkeydown="slash(this)"></td>
									</tr>
									<tr class="guideValid" style="display: none;">
										<td colspan ="2" class="col-md-12" ></td>
									</tr>
									<tr>
										<td class="col-md-1 guideNum">7.</td>
										<td><input type="text" id="guide7" placeholder="시설의 이용하면서 주의해야할 사항을 알려주세요" size="100" class="border-0 " onblur="guideValid(this)" onkeydown="slash(this)"></td>
									</tr>
									<tr class="guideValid" style="display: none;">
										<td colspan ="2" class="col-md-12" ></td>
									</tr>
									<tr>
										<td class="col-md-1 guideNum">8.</td>
										<td><input type="text" id="guide8" placeholder="시설의 이용하면서 주의해야할 사항을 알려주세요" size="100" class="border-0 " onblur="guideValid(this)" onkeydown="slash(this)"></td>
									</tr>
									<tr class="guideValid" style="display: none;">
										<td colspan ="2" class="col-md-12" ></td>
									</tr>
									<tr>
										<td class="col-md-1 guideNum">9.</td>
										<td><input type="text" id="guide9" placeholder="시설의 이용하면서 주의해야할 사항을 알려주세요" size="100" class="border-0" onblur="guideValid(this)"></td>
									</tr>
									<tr class="guideValid" style="display: none;">
										<td colspan ="2" class="col-md-12" ></td>
									</tr>
									<tr>
										<td class="col-md-1 guideNum">10.</td>
										<td><input type="text" id="guide10" placeholder="시설의 이용하면서 주의해야할 사항을 알려주세요" size="100" class="border-0" onblur="guideValid(this)"></td>
									</tr>
									<tr class="guideValid" style="display: none;">
										<td colspan ="2" class="col-md-12" ></td>
									</tr>
								</tbody>
								</table>
								<input type="hidden" name="guide" id="guide">
							</div>
							
							<br>
							<div class="mt-3" >
								<span class="title3">플레이스 옵션 </span><br>
								<!-- 카테고리가 선택되어있지 않을 경우  -->
								<div class="option1" style="display: block">
									<p>카테고리가 선택되지 않았습니다. 카테고리를 먼저 선택해주세요.</p>
								</div>
								<!-- 갤러리 옵션 -->
								<div id="option_gallery" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								<!-- 회의실 옵션 -->
								<div id="option_meeting" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
								<!-- 춤 연습실 옵션 -->
								<div id="option_dancePractice" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
								<!-- 헬스장 옵션 -->
								<div id="option_homeGim" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
								<!-- 독립오피스 옵션 -->
								<div id="option_office" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
								<!-- 공유오피스 옵션 -->
								<div id="option_officeShare" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
								<!-- 파티룸 옵션 -->
								<div id="option_partyRoom" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
								<!-- 녹음실 옵션 -->
								<div id="option_recording" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
								<!-- 공유주방 옵션 -->
								<div id="option_shareKitchen" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
								<!-- 노래연습실 옵션 -->
								<div id="option_singPractice" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
								<!-- 스몰웨딩 옵션 -->
								<div id="option_smallWedding" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
								<!-- 스튜디오 옵션 -->
								<div id="option_studio" class="option1" style="display: none">
									<div class="commonOption"></div>
								</div>
								
							</div>
						
							<label class="mt-3">
								<span class=" title3">플레이스 옵션2(선택)</span><br>	
								<textarea  class="ta" cols="100" rows="5" name="option2" placeholder="위 항목 이외에 추가 하실 항목이 있으시다면 작성해주세요 . 관리자의 검토 후 추가하겠습니다." >${place.option2}</textarea>
							</label>
							<br>
							<c:set var="address" value="${place.address.split('&nbsp')}"/>
							<label class="mt-3">
								<span class="title3">주소 </span><br>
								<input type="text" id="postcode" placeholder="우편번호">
								<input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
								<input type="text"  id="address" size="50" class="mt-2" value="${address[0]}">
								<input type="text"  id="extraAddress"  size="50"placeholder="참고항목" class="mt-2"><br>
								<input type="text"  id="detailAddress"  size="50" placeholder="상세주소" value="${address[1]}" class="mt-2">
								
								<input type="hidden" name="address" id="addr" >
							</label>
					
						<div class="horison"></div>
							<h5 class="title2">2. 이용가능 시각 및 금액</h5>
							<br>
							<label class="mt-3">
								<span class="title3">이용가능시간을 입력해주십시오</span><br>
					
								<span class="title3">영업시작 시각</span>
									<input class="form-control form-control-solid flatpickr-input" placeholder="영업 시작" id="kt_datepicker_1" type="checkbox" name="availTime">
								<span class="title3">영업종료 시각</span>
									<input class="form-control form-control-solid flatpickr-input" placeholder="영업 종료" id="kt_datepicker_2" type="checkbox" name="availTime">
							</label>
							<br>
							<label class="mt-3">
								<input type="checkbox" name="availTime" id="avaliableTime" value="24hours" class="mr-3">  24시간 이용가능한 공간입니다.<br>
							</label>
							<br>
							<label class="mt-3">
								<span class="title3">예약시간 단위 </span><br>
								<span>고객이용가능 시간이 30분일 경우 30분 단위로 예약을 여는 것을 추천합니다.</span><br>
									<select name="intervalTime" id="intervalTime" class="mt-3" required>
										<option value="" disabled selected >예약단위</option>
										<option value="1" >1시간</option>
										<option value="2" >2시간</option>
										<option value="4" >4시간</option>
										<option value="6" >6시간</option>
									</select>
							
							</label>
							<br>
							<label class="mt-3">
								<span class="title3">가격 </span><br>
								시간 당 <input type="text" name="price" id="price" value="${place.price}">원으로 으로 책정합니다.
							</label>
							<br>
						<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px; height: 45px; border-radius: 10px; float:right; " onclick="check()" >수정 완료</button>
				</form>
				</div>
			</div>
		</section>
	</main>
	<div style="margin:300px;"></div>
	<footer id="footer"></footer>
	<script src="<%=request.getContextPath()%>/resources/js/placeModify.js"></script>
	<!-- 장소 옵션 -->
	<script>
	$(function(){
		$(".commonOption").load("<%=request.getContextPath()%>/resources/article/placeOptionList.jsp");
	});
	</script>
	<!-- 로딩 이후 인풋에 데이터 뿌려주기 -->
	<!-- guide -->
	<c:set var="guide" value="${place.guide.split('/')}"/>
	<script type="text/javascript">
		<c:forEach var="g" items="${guide}" varStatus="status">
			$("#guide"+${status.count}).val("${g}");
		</c:forEach>
	</script>
	<!-- option -->
	<c:set var="option" value="${place.option1.split(',')}"/>
	<script type="text/javascript">
		var input = $("div#option_${place.category} > label > input");
		var length = $("div#option_${place.category} > label > input").length;
		<c:forEach var="opt" items="${option}" varStatus="status">
			if(input.eq(${status.index}).val() == '${opt}'){
				input.eq(${status.index}).prop("checked", true);
			}
		</c:forEach>
	</script>
	<!-- category, tag, availTimeValue" -->
	<script type="text/javascript">
		$(function(){
			/* category */
			$(".option1").css("display", "none");
			$("#option_${place.category}").css("display", "block");
			
			/* tag */
			var tag = "";
			${place.tag}.forEach(element => tag += element['value']+',');
			$(".some_class_name").val(tag);
		});
	</script>
	<!-- 시설 가이드 유효성 -->
	<script>
	
	function guideValid(obj){
		
		var guideVal = $(obj).val();
		var guideLength = $(obj).val().length;
		
		if(guideLength > 100){
			console.log("시설정보 100자 이상");
			//alert("시설 정보는 100자 이내로 작성해주시길 바랍니다.");
			$(obj).removeClass('border-0');
			$(obj).addClass('alertBox');
			$(obj).closest('tr').next().css({'color':'#CD0000','display':'table-row'});
			$(obj).closest('tr').next().children().html("시설 정보는 100자이내로 작성해주시길 바랍니다.").css('text-align', 'center')
			return false;
		}else if(guideLength < 100) {
			$(obj).removeClass('alertBox');
			$(obj).addClass('border-0');
			$(obj).closest('tr').next().css({'color':'#CD0000','display':'none'});
		
		}else{
		
		}
			
	}
	
		//시설 정보 입력막기 
		function slash(obj){
			 if(event.keyCode == 111 || event.which == 191 ) {
			 	alert("/는 입력이 불가합니다.");
			 	event.preventDefault();
			 }
			 return;
		}
	
	</script>
	<!-- 사진 미리보기 -->
	<script>
		function setDetailImage(event){
			for(var image of event.target.files){
				var reader = new FileReader();
				reader.onload = function(event){
					var img = document.createElement("img");
					img.setAttribute("src", event.target.result);
					img.setAttribute("style", "width:300px; height: 200px; margin-right:10px; margin-top: 10px;");
					
					document.querySelector("div#images_container").appendChild(img);
				};
				
				console.log(image);
				reader.readAsDataURL(image);
			}
		}
		
		function removePicture(){
			$("#images_container > img").remove();
		}
	</script>
	<!-- 썸머노트 -->
	<script type="text/javascript">
		$(document).ready(function() {
			var detail = '${place.placeDetail}';
			$('#summernote').summernote(
				'pasteHTML', detail
			);
		}); 
		
	</script>

</body>
</html>