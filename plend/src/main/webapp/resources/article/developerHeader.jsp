<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>

  <nav class="navbar navbar-light pt-4 fixed-top bg-white">
  <div class="container" style="flex-wrap: wrap; justify-content: center;">
  	<div style=" display: flex; flex-direction: row; align-items: center; width: 100%;">
      <a class="navbar-brand" style="margin-right:auto;" href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/image/logoTrial2.png" alt="logo not found" style="width: 200px; height:60px;"></a>
   	  <div id="searchBar" style="margin-right:auto; border-radius: 50px; height: 47px; width: 500px; background-color: #eceeee;">
    	<form class="d-flex" method="GET" action="<%=request.getContextPath()%>/place/searchPlace.do">
          <input class="form-control me-2" name="searchValue" type="search" placeholder="원하는 장소를 검색해보세요!" aria-label="Search" style="margin-top:5px; border: none; background-color: #eceeee; border-radius: 50px;">
          <button class="btn " type="submit" style="border:none; align-self: center;" ><img alt="searchBtn" src="<%=request.getContextPath()%>/resources/image/searchBtn.png" ></button>
        </form> 			
      </div>
      <button class="navbar-toggler" type="button" style="border: none; margin-left:auto;" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
    </div>
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
    		<a href="userList.do" class="btn flex-fill rounded-0 fw-bold">회원리스트</a>
    		<a href="reportList.do" class="btn flex-fill rounded-0">신고관리</a>
    		<a href="event.do" class="btn flex-fill rounded-0">이벤트 관리</a>
    	</div>
    </div>
    <!-- 07.13 김영민: 주소 수정-->
	<!-- 07.28 김영민: 업체 문의 내역 추가  -->
    <div class="container">
    	<div id="classification_category2" class="d-none flex-row  mw-100 classification_category">
    		<a href="enterList.do" class="btn flex-fill rounded-0 fw-bold">업체리스트</a>
    		<a href="enterConfirm.do" class="btn flex-fill rounded-0">업체장소 등록승인</a>
    		<a href="enterBlock.do" class="btn flex-fill rounded-0">사용자 블랙리스트</a>
    		<a href="inquiryList.do" class="btn flex-fill rounded-0">업체 문의내역</a>
    	</div>
    </div>
    <!-- 오른쪽 캔버스  -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header" style="background: #364F6B; height: 250px; flex-direction: column">
      	
        <button type="button" class="btn-close text-reset" style="margin-left: auto;" data-bs-dismiss="offcanvas" aria-label="Close" ></button>
     
		<c:if test="${login == null}">
		<br>
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: white; font-size:20px;">Plend</h5>

        <br>
        <button type="button" class="btn-primary btn-lg mb-4" style="background: #FC5185; color: white; border-radius: 50px; border: none; "onclick="location.href='<%=request.getContextPath()%>/common/signIn.do' ">로그인/회원가입</button>
     	</c:if>
     	<br>
     	<c:if test = "${login != null }">
     		<h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: white; font-size:20px;"><strong>${login.nickName}</strong>님 환영합니다!</h5>
     		<br>
     		<c:if test = "${login.role == 1}">
     		<button type="button" class="btn-primary btn-lg mb-4" style="background: #FC5185; color: white; border-radius: 50px; border: none;float :left; "onclick="location.href='<%=request.getContextPath()%>/developer/userList.do'">관리자 페이지</button>
     		</c:if>
     		<c:if test = "${login.role == 2}">
     		<button type="button" class="btn-primary btn-lg mb-4" style="background: #FC5185; color: white; border-radius: 50px; border: none;float :left; "onclick="location.href='<%=request.getContextPath()%>/myPage/myInfo.do?uidx=${login.uidx}' ">마이페이지</button>
     		</c:if>
			<c:if test = "${login.role == 3}">
			<button type="button" class="btn-primary btn-lg mb-4" style="background: #FC5185; color: white; border-radius: 50px; border: none;float :left; "onclick="location.href='<%=request.getContextPath()%>/host/managePlace.do?uidx=${login.uidx}' ">호스트 페이지</button>
       		</c:if>
     	</c:if>
      </div>
      <div class="offcanvas-body" style="background:#E5E5E5;">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/main/notice.do">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/main/faq.do">FAQ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">1:1 문의</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	 서비스 소개
            </a>
            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
              <li><a class="dropdown-item" href="#">프로젝트 소개</a></li>
              <li><a class="dropdown-item" href="#">팀원 소개</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
          <c:if test = "${login != null }">
            <hr>
	         <li>
	          	<a href = "<%=request.getContextPath()%>/common/signOut.do">로그아웃</a>
	          </li>
          </c:if>
        </ul>
      </div>
    </div>
</nav>
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
  