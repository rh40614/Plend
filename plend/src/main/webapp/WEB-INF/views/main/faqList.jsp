<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	//질문 답변 작동하는 로직

	  // panel-faq-container
	  var panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
	  
	  // panel-faq-answer
	  var panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for( let i=0; i < panelFaqContainer.length; i++ ) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active1');
	    });
	  };
	
	</script>
<c:forEach var = "vo" items = "${list}">
			<div class="container" style = "margin:auto;">
				    <table class="table table-bordered table-striped table-white table-hover" style = "width:800px;margin:auto;">
				      <tbody class="text-center">
				        <tr>
				          <td class="text-left" width="50%">
				            <div class="panel-faq-container">
				              <p class="panel-faq-title">${vo.question}</p>
				              <div class="panel-faq-answer">
				              <hr>
				                	${vo.answer}
				                	<br>
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
		

