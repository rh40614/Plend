<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#wrap {
	  display: flex;
	  min-height: 300px;
	  flex-direction: column; 
   	  justify-content: flex-end;
	  
	 }
</style>
<div id="wrap">
<header>
 
  <nav class="navbar navbar-light shadow-sm fixed-top mt-4">
 
  <div class="container" style="align-items: center; flex-wrap: wrap; justify-content: center;">
  	<div style=" display: flex; flex-direction: row; align-items: center; width: 100%;">
    <a class="navbar-brand" style=" margin-right:auto; " href="#"><img src="<%=request.getContextPath()%>/resources/image/plend.png" alt="logo not found"></a>
    <div id="searchBar" style="border: 3px solid grey; border-radius: 10px; height: 47px; width: 750px;">
    	<form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="원하는 장소를 검색해보세요!" aria-label="Search" style="border: none;">
          <button class="btn " type="submit" style="border:none;" ><img alt="searchBtn" src="<%=request.getContextPath()%>/resources/image/searchBtn.png" ></button>
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
    <div class="container d-block mt-5 p-0 mw-100">
    	<div id="classification_level" class="d-flex flex-row  mw-100" style="height: 50px">
    		<a class="btn btn-primary flex-fill rounded-0 active2" style="background-color: #D9D9D9 ; border-color: #D9D9D9 ">회원관리</a>
    		<a class="btn btn-primary flex-fill rounded-0" style="background-color: #D9D9D9 ; border-color: #D9D9D9 ">업체관리</a>
    	</div>
    </div>
    <!-- 소분류 -->
    <div class="container d-block m-0 p-0 mw-100">
    	<div id="classification_category1" class="d-flex flex-row  mw-100 classification_category">
    		<a class="btn btn-primary flex-fill rounded-0 fw-bold" style="background-color: #2F506D; border-color: #2F506D">회원리스트</a>
    		<a class="btn btn-primary flex-fill rounded-0" style="background-color: #2F506D; border-color: #2F506D">신고관리</a>
    		<a class="btn btn-primary flex-fill rounded-0" style="background-color: #2F506D; border-color: #2F506D">이벤트 관리</a>
    	</div>
    </div>
    <div class="container d-block m-0 p-0 mw-100">
    	<div id="classification_category2" class="d-none flex-row  mw-100 classification_category">
    		<a class="btn btn-primary flex-fill rounded-0 fw-bold" style="background-color: #2F506D; border-color: #2F506D">업체리스트</a>
    		<a class="btn btn-primary flex-fill rounded-0" style="background-color: #2F506D; border-color: #2F506D">업체장소등록 승인</a>
    		<a class="btn btn-primary flex-fill rounded-0" style="background-color: #2F506D; border-color: #2F506D">사용자 블랙리스트</a>
    	</div>
    </div>
    <!-- 오른쪽 캔버스  -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header" style="background: #364F6B; height: 250px; flex-direction: column">
      	
        <button type="button" class="btn-close text-reset" style="margin-left: auto;" data-bs-dismiss="offcanvas" aria-label="Close" ></button>
     
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: white; font-size:20px;">Plend</h5>
        
        
        <button type="button" class="btn-primary btn-lg mb-4" style="background: #FC5185; color: white; border-radius: 50px; border: none; ">로그인/회원가입</button>
      </div>
      <div class="offcanvas-body" style="background:#E5E5E5;">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">FAQ</a>
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
        </ul>
      </div>
    </div>
</nav>
</header>
  </div>
  	<!-- 대분류/ 소분류 클릭함수 -->
   	<script>
  		// 네비 대분류 선택 함수
	  	$("#classification_level").children("a").click(function(){
	  		$("#classification_level").children("a").removeClass("active2");
	  	  $(this).addClass("active2");
	  	  if($(this).text() == "회원관리"){
	  		$("#classification_category1").removeClass("d-none");
	  		$("#classification_category1").addClass("d-flex");
	  		$("#classification_category2").addClass("d-none");
	  		  
	  	  }else{
	  		$("#classification_category2").removeClass("d-none");
	  		$("#classification_category2").addClass("d-flex");
	  		$("#classification_category1").addClass("d-none");
	  	  }
	  	});
  		// 네비 소분류 선택함수
  		$(".classification_category").children("a").click(function(){
	  		$(".classification_category").children("a").removeClass("fw-bold");
	  	  $(this).addClass("fw-bold");
	  	});
  	</script>


  