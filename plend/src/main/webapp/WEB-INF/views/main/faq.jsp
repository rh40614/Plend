<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>plend</title>
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/faq.css" rel="stylesheet"> 

	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>

	
</head>

<body>
<div id="wrap">	
	<header id="header"></header>
	<main style="min-height:700px;">
	<div>
	<div style = "text-align:center;">
	<form action = "faq.do" method = "get">
		<input type = "text" id = "faqSearch" name="searchValue"> <button id = "searchBut">검색</button> 
	</form>
	</div>
	<br>
	<br>
	<div style = "text-align:center;margin-left:auto;margin-right:auto;">
		<input type = "button" name = "all" value = "전체">
		<input type = "button" name = "book" value = "예약">
		<input type = "button" name = "use" value = "이용">
		<input type = "button" name = "coupon" value = "쿠폰">
		<input type = "button" name = "sue" value = "신고">
	</div>
	</div>
	<br>
	<br>
	<c:if test = "${list.size() == 0 }">
		<div style = "text-align:center;" id = "html">
			검색된 결과가 없습니다.
		</div>
	</c:if>
 	<c:if test = "${list.size() > 0}">
 	<div id = "html">
  		<c:forEach var = "vo" items = "${list}">
			<div class="container" style = "margin:auto;">
			<div id="btn-all-close"></div>
				    <table class="table table-bordered table-striped table-white table-hover" style = "width:800px;margin:auto;">
				      <tbody class="text-center">
				        <tr>
				          <td class="text-left" width="50%">
				            <div class="panel-faq-container">
				              <p class="panel-faq-title" style = "margin-bottom:0px;">${vo.question}</p>
				              <div class="panel-faq-answer">
				              <hr>
				                	${vo.answer}
				                	<c:if test="${login.role eq '1'}">
								  	<input type = "button" value = "수정" id = "modiBtn" onclick="location.href='faqModify.do?fidx=${vo.fidx}'">
								 	 </c:if>
				              </div>
				            </div>
				          </td>
				        </tr>
				      </tbody>
				    </table>
				  </div>
				  <br>
		</c:forEach>
		</div>
	</c:if>
<br>
<div style = "margin-left:22%;margin-right:22%;">
		<c:if test="${login.role == '1'}">
	  	<input type = "button" id = "faqReg" value = "등록하기" onclick="location.href='faqReg.do'">
	 	 </c:if>
	 	 <c:if test="${login.role != '1'}">
	 	 </c:if>
	</div>

	</main>
	<footer id="footer" class="mt-5"></footer>
</div>
<script>
		$('input[name=all]').click(function(){
			$.ajax({
				url:'faqList.do',
				type : 'GET',
				dataType : 'text',
				success : function(data){
					$('#html').html(data);
	
				},
				error : function(err){
					console.log(err);
				}
			});
		});

		$('input[name=book]').click(function(){
			$.ajax({
				url : "faqList.do?category=book",
				type : "GET",
				dataType : "text",
				success : function(data){
					$('#html').html(data);
				},
				error : function(err){
					console.log(err);
				}
			});
		});
		
		$('input[name=use]').click(function(){
			$.ajax({
				url : "faqList.do?category=use",
				type : "GET",
				dataType : "text",
				success :function(data){
					$('#html').html(data);
				},
				error : function(err){
					console.log(err);
				}
				
			});
		});
		
		$('input[name=coupon]').click(function(){
			$.ajax({
				url : "faqList.do?category=coupon",
				type : "GET",
				dataType : "text",
				success :function(data){
					$('#html').html(data);
				},
				error : function(err){
					console.log(err);
				}
				
			});
		});
		
		$('input[name=sue]').click(function(){
			$.ajax({
				url : "faqList.do?category=sue",
				type : "GET",
				dataType : "text",
				success :function(data){
					$('#html').html(data);
				},
				error : function(err){
					console.log(err);
				}
				
			});
		});
		
	//질문 답변 작동하는 로직
	$(document).one('click',function(){
	  // panel-faq-container
	  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
	  
	  // panel-faq-answer
	  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");
	  
	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for( let i=0; i < panelFaqContainer.length; i++ ) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active1');
	    });
	  };
	});
	</script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>