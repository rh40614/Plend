<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>

    <!-- 하단 nav -->
    <!-- 김영민 07.05 color : #2F506D-->
    <!-- 대분류 -->
    <div class="container" style="margin-top: 150px;">
    	<div id="classification_level" style="height: 50px">
    		<a href="userList.do" class="btn cLevel_1 active flex-fill rounded-0 fw-bold">회원관리</a>
    		<a href="enterList.do" class="btn cLevel_1 flex-fill rounded-0 fw-bold">업체관리</a>
    	</div>
    </div>
    <!-- 소분류 -->
    <div class="container">
    	<div id="classification_category1" class="d-flex flex-row  mw-100 classification_category">
    		<a href="userList.do" class="btn  rounded-0 fw-bold ">회원리스트</a>
    		<a href="reportList.do" class="btn  rounded-0 ">신고관리</a>
    		<a href="event.do" class="btn  rounded-0 ">이벤트 관리</a>
    	</div>
    </div>
    <!-- 07.13 김영민: 주소 수정-->
	<!-- 07.28 김영민: 업체 문의 내역 추가  -->
    <div class="container">
    	<div id="classification_category2" class="d-none flex-row  mw-100 classification_category">
    		<a href="enterList.do" class="btn  rounded-0 fw-bold">업체리스트</a>
    		<a href="enterConfirm.do" class="btn  rounded-0">업체장소 등록승인</a>
    		<a href="enterBlock.do" class="btn  rounded-0">사용자 블랙리스트</a>
    		<a href="inquiryList.do" class="btn  rounded-0">업체 문의내역</a>
    	</div>
    </div>
<!-- 08.16 김영민 대분류 호버 이벤트 -->
<script>
 $("#classification_level").children("a").hover(
		 function(){
			$("#classification_level").children("a").removeClass("active");
		 	$(this).addClass("active");
	 		if($(this).text() == "회원관리"){
		 		$("#classification_category1").removeClass("d-none");
		 		$("#classification_category1").addClass("d-flex");
		 		$("#classification_category2").addClass("d-none");  
		 	  }else{
		 		$("#classification_category2").removeClass("d-none");
		 		$("#classification_category2").addClass("d-flex");
		 		$("#classification_category1").addClass("d-none");
		 	  }
		 }
 );
</script>
<!-- 07.13 김영민 스크립트 추가  -->
<!-- 대분류 상황에 맞게 고정 -->
<script>
	var categoryTitle = $(".category-title").text();
	if(categoryTitle.match("업체")) {
		$("#classification_category2").removeClass("d-none");
 		$("#classification_category2").addClass("d-flex");
 		$("#classification_category1").addClass("d-none");
 		
 		$("#classification_level").children("a").toggleClass("active");
	}
</script>
<!-- 소분류 상황에 맞게 고정 -->
<script>
 	var title = $("title").text();
	var category = $(".classification_category").children("a");
	category.each(function(){
		if($(this).text().match(title)){
			$(".classification_category").children("a").removeClass("fw-bold");
			$(this).addClass("fw-bold");
		}
	})
</script>
  