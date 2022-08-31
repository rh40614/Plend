<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-운영자 문의 사항</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<!-- bootstrap  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!--  fontAwesome -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	
	
	<script type="text/javascript">
	//프론트 디자인
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/hostfooter.jsp");
		})
	</script>


<!-- 버튼 -->	
	<script>

			
		function btn(obj){
			
			if($(obj).hasClass("btnDisabled") == true){
				$("#btnGroup").children("button").addClass("btnDisabled");
			
				$(obj).removeClass("btnDisabled");	 
				$(obj).addClass("btnBig");
			}
			if($(obj).val() == 'place'){
				$("#place").css("display","block");
				$("#payment").css("display","none");
				$("#refund").css("display","none");
				$("#report").css("display","none");
				
			}else if($(obj).val() == 'payment'){
				$("#place").css("display","none");
				$("#payment").css("display","block");
				$("#refund").css("display","none");
				$("#report").css("display","none");
			}else if($(obj).val() == 'refund'){
				$("#place").css("display","none");
				$("#payment").css("display","none");
				$("#refund").css("display","block");
				$("#report").css("display","none");
				
			}else if($(obj).val() == 'report'){
				$("#place").css("display","none");
				$("#payment").css("display","none");
				$("#report").css("display","block");
				$("#refund").css("display","none");
			}
		}
			
		
	
	
	</script>
	

</head>
<body>

	<header id="header"></header>
	
	<main>
		<section style="margin-top: 100px;">
			<span class="title1 mb-5">FAQ</span>
			
			<!-- 카테고리 -->
			<div style="display: flex; align-items: center; flex-direction: column; " >
				<div class="btn-group spaceL" role="group" id="btnGroup" >
					<button type="button" class="btnBig me-3" onclick="btn(this)" value="place">플레이스 등록</button>
					<button type="button" class="btnBig me-3 btnDisabled"  onclick="btn(this)" value="payment">결제</button>
					<button type="button" class="btnBig me-3 btnDisabled"  onclick="btn(this)" value="refund">환불</button>
					<button type="button" class="btnBig me-3 btnDisabled"  onclick="btn(this)" value="report">신고</button>
				</div>
			</div> 
			
			
			<!-- Faq:플레이스 등록 -->
				<div class="accordion accordion-flush spaceL mt-5 w-75" id="place" >
				  <div class="accordion-item ">
				    <h2 class="accordion-header FAQ" id="flush-headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        Q. 장소등록이 안된다고하는 알림창이 뜹니다.
				      </button>
				    </h2>
				    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" >
				      <div class="accordion-body">
				      안녕하세요. P:)end입니다. 이용 중 불편을 드려 죄송합니다. <br>
				      장소등록이 되지않을 경우 새로고침 이후 다시 시도해주시길바랍니다.
				       새로 고침이후에도 장소가 등록되지않는다면 고객센터로 연락 부탁드립니다. 감사합니다.</div>
				    </div>
				  </div>
				  
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        Q. 등록한 장소가 뜨지 않아요.
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" >
				      <div class="accordion-body">
				      안녕하세요. P:)end입니다. 이용 중 불편을 드려 죄송합니다. <br>
				      호스트님께서 등록한 장소는 운영자의 승인 후 게시 됩니다. <br>
				      승인은 12시간 이내에 이루어집니다. 24시간 이후에도 승인이 완료되지않는다면 1:1 문의를 이용해주시길바랍니다. <br>
				      감사합니다.
				      
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
				        Q. 장소등록은 무료인가요?
				      </button>
				    </h2>
				    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" >
				      <div class="accordion-body">plend에서는 장소 등록은 무료 입니다 :-) <br>
							이용자의 결제시에만 서비스 수수료 10%가 발생합니다. <br>
							서비스 수수료에는 PG사 수수료를 포함하여 10%입니다.</div>
				    </div>
				  </div>
				</div>
				
				
				
				<!-- Faq: 결제 -->
				<div class="accordion accordion-flush spaceL mt-5 w-75" id="payment"  style="display:none">
				  
				  <div class="accordion-item ">
				    <h2 class="accordion-header FAQ" id="flush-headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        Q. 수수료는 얼마인가요?
				      </button>
				    </h2>
				    
				    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" >
				      <div class="accordion-body">안녕하세요. P:)end입니다.<br>
				      	수수료는 게스트가 결제한 대금의 10%이며, <br>
						수수료에는 부가세 및 PG사 수수료가 포함되어 있습니다.</div>
				    </div>
				  </div>
				  
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        Q. 정산은 언제 받을 수 있나요?
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" >
				      <div class="accordion-body">
				      	정산은 이용일 또는 취소일을 기준으로 정산을 해드리고 있으며, <br>
						결제 수단에 따라 정산일이 다르니 참고 부탁드립니다.
				      </div>
				    </div>
				  </div>
				</div>
				
				
				<!-- Faq: 환불 -->
				<div class="accordion accordion-flush spaceL mt-5 w-75" id="refund"  style="display:none">
				  
				  <div class="accordion-item ">
				    <h2 class="accordion-header FAQ" id="flush-headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        Q. 전액환불을 해주고싶어요
				      </button>
				    </h2>
				    
				    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" >
				      <div class="accordion-body">
				      	안녕하세요. P:)end입니다. <br>
				      	이용일 후의 취소/환불은 예약번호와 예약자 이름을 1:1 문의로 전달주시면, 확인 처리 후 안내드릴게요. 
				      </div>
				    </div>
				  </div>
				  
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        Q. 예약을 취소하고 싶어요
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" >
				      <div class="accordion-body">
				      	예약 취소는 호스트센터 > 장소관리에서 하실 수 있습니다. <br>
				      	이용 전 예약만 호스트님이 직접 취소할 수 있어요. <br>
    					(이용 중, 이용 완료 예약의 환불, 부분환불은 1:1 문의로 요청하셔야 합니다.)
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- Faq: 신고 -->
				<div class="accordion accordion-flush spaceL mt-5 w-75" id="report" style="display:none">
				  
				  <div class="accordion-item ">
				    <h2 class="accordion-header FAQ" id="flush-headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        Q. 악의적인 유저를 신고하고싶어요
				      </button>
				    </h2>
				    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" >
				      <div class="accordion-body">
				      	안녕하세요. P:)end입니다. <br>
				      	악의적인 유저는 리뷰 상세페이지에서 블락하실 수 있습니다. <br>
				      	운영자 확인 후에 블락처리 혹은 취소처리 할 수 있습니다. 
				      </div>
				    </div>
				  </div>
				  
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        Q. 시스템 오류가 있습니다
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" >
				      <div class="accordion-body">
				      	안녕하세요. P:)end입니다. <br>
				      	시스템 오류는 운영자 문의 페이지에서 문의 접수 부탁드립니다.
				      </div>
				    </div>
				  </div>
				</div>
		</section>
				<!-- a 태그는 inline-block이라 text-align 안먹음 -->
				<div style="text-align: center;" class="mt-5">
					<a href="<%=request.getContextPath()%>/inquiry_dev/inquiry_dev.do" style="text-decoration: underline;">원하는 답변이 없어요. 운영자에게 질문하러 가기</a>
				</div>
	</main>
	<div style="margin:300px;"></div>
	<footer id="footer"></footer>
	
	
	
</body>
</html>