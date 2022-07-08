<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-장소등록</title>
	<link href="resources/css/global_Host.css" rel="stylesheet">
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	

	<script type="text/javascript">
		$(function(){
			$("#header").load("resources/article/hostHeaderWithNav.jsp");
			
		})
	</script>
</head>
<body>

	<header id="header"></header>
	
	<main>
		<section style="margin-left:250px;">
			<span class="title">플레이스 등록</span>
			<div class="m-auto">
				<div class="btn-group-lg mt-5" role="group" aria-label="Basic example">
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">갤러리</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">공유주방</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">녹음실</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">노래 연습실</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">공유 오피스</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">독립 오피스</button>
				</div>
				<div class="btn-group-lg mt-1" role="group" aria-label="Basic example">
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">스몰웨딩</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">운동시설</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">촬영 스튜디오</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">춤 연습실</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">파티룸</button>
  					<button type="button" class="btn btn-primary" style="background:#2F506D; border: #2F506D; width: 160px;">회의실</button>
				</div>
				
				<div class="m-auto">
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
					<label>
					<span>공간명칭 :</span>
					<input type="text" size="30" placeholder="어떤 공간을 가지고 계신가요?">
					</label>
					<br>
					<label>
					<span>공간소개 :</span>
					<textarea cols="100" rows="5" placeholder="등록할 공간을 소개해주세요 :-) "></textarea>
					</label>
					<label>
					<span>태그: </span>
					</label>
					<label>
					<span>공간소개 :</span>
					<textarea cols="100" rows="5" placeholder="사용자가 이용할 시설에 대한 안내를 적어 주세요."></textarea>
					</label>
					<label>
					<span>플레이스 옵션(선택): </span>
					<input type="radio">
					
					</label>
					
					 
				</form>
				
				
				
				
				</div>
				
				
			</div>
			
			


		</section>
		
		<div>
		
		
		</div>
		
		
	</main>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>