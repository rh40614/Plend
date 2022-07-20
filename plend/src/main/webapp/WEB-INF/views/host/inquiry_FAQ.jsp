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
			<span class="title1">FAQ</span>
			
			<div style="display: flex; align-items: center; ">
			<!-- 카테고리 -->
				<div class="btn-group spaceL" role="group" id="btnGroup" >
					<button type="button" class="btnBig me-3" onclick="btn(this)" value="place">플레이스 등록</button>
					<button type="button" class="btnBig me-3 btnDisabled"  onclick="btn(this)" value="payment">결제</button>
					<button type="button" class="btnBig me-3 btnDisabled"  onclick="btn(this)" value="refund">환불</button>
					<button type="button" class="btnBig me-3 btnDisabled"  onclick="btn(this)" value="report">신고</button>
				</div>
			
				<!-- 검색폼 -->
				<div class="mt-5 ms-5">
					<form action=".do" method="get">
						<div class="row search-form mb-5" style="float:right;">
							<div class="input-group justify-content-center">
								<select class="form-select-sm" name="searchType">
									<option value="place">플레이스</option>
				  					<option value="payment">결제</option>
				  					<option value="refund">환불</option>
				  					<option value="refort">신고</option>
								</select>
								
								<input name="searchValue" class="mx-1">
								<button class="btnDefault">검색</button>
							</div>
						</div>
					</form>
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
				      <div class="accordion-body">안녕하세요. P:)end입니다. 이용 중 불편을 드려 죄송합니다. <br>장소등록이 되지않을 경우 새로고침 이후 다시 시도해주시길바랍니다. 새로 고침이후에도 장소가 등록되지않는다면 고객센터로 연락 부탁드립니다. 감사합니다.</div>
				    </div>
				  </div>
				  
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        Accordion Item #2
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" >
				      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
				        Accordion Item #3
				      </button>
				    </h2>
				    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" >
				      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
				    </div>
				  </div>
				</div>
				
				
				
				<!-- Faq: 결제 -->
				<div class="accordion accordion-flush spaceL mt-5 w-75" id="payment"  style="display:none">
				  
				  <div class="accordion-item ">
				    <h2 class="accordion-header FAQ" id="flush-headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        Q. 결제
				      </button>
				    </h2>
				    
				    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" >
				      <div class="accordion-body">안녕하세요. P:)end입니다. 이용 중 불편을 드려 죄송합니다. <br>장소등록이 되지않을 경우 새로고침 이후 다시 시도해주시길바랍니다. 새로 고침이후에도 장소가 등록되지않는다면 고객센터로 연락 부탁드립니다. 감사합니다.</div>
				    </div>
				  </div>
				  
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        Accordion Item #2
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" >
				      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
				        Accordion Item #3
				      </button>
				    </h2>
				    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" >
				      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
				    </div>
				  </div>
				</div>
				
				
				<!-- Faq: 환불 -->
				<div class="accordion accordion-flush spaceL mt-5 w-75" id="refund"  style="display:none">
				  
				  <div class="accordion-item ">
				    <h2 class="accordion-header FAQ" id="flush-headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        Q. 환불
				      </button>
				    </h2>
				    
				    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" >
				      <div class="accordion-body">안녕하세요. P:)end입니다. 이용 중 불편을 드려 죄송합니다. <br>장소등록이 되지않을 경우 새로고침 이후 다시 시도해주시길바랍니다. 새로 고침이후에도 장소가 등록되지않는다면 고객센터로 연락 부탁드립니다. 감사합니다.</div>
				    </div>
				  </div>
				  
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        Accordion Item #2
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" >
				      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
				        Accordion Item #3
				      </button>
				    </h2>
				    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" >
				      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
				    </div>
				  </div>
				</div>
				
				<!-- Faq: 신고 -->
				<div class="accordion accordion-flush spaceL mt-5 w-75" id="report" style="display:none">
				  
				  <div class="accordion-item ">
				    <h2 class="accordion-header FAQ" id="flush-headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        Q. 신고
				      </button>
				    </h2>
				    
				    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" >
				      <div class="accordion-body">안녕하세요. P:)end입니다. 이용 중 불편을 드려 죄송합니다. <br>장소등록이 되지않을 경우 새로고침 이후 다시 시도해주시길바랍니다. 새로 고침이후에도 장소가 등록되지않는다면 고객센터로 연락 부탁드립니다. 감사합니다.</div>
				    </div>
				  </div>
				  
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        Accordion Item #2
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" >
				      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
				        Accordion Item #3
				      </button>
				    </h2>
				    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" >
				      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
				    </div>
				  </div>
				</div>
		</section>
				
				<!-- a 태그는 inline-block이라 text-align 안먹음 -->
				<div style="text-align: center;" class="mt-5">
					<a href="<%=request.getContextPath()%>/host/inquiry_dev.do">원하는 답변이 없어요. 운영자에게 질문하러 가기</a>
				</div>
				
		
		

	</main>
	<div style="margin:300px;"></div>
	<footer id="footer"></footer>
	
	
	
</body>
</html>