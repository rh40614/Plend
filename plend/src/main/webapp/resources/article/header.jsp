<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>
<style>
#category {
	padding-top: 50px;
	margin-bottom: 15px;
}
#category>a {
	color: #646d75;
	padding-bottom: 3px;
	margin-right: 8px;
	border-bottom: 3px solid #dfe1e2;
}
</style>  

  <nav class="navbar navbar-light shadow-sm pt-4 fixed-top bg-white">
  <div class="container" style="flex-wrap: wrap; justify-content: center;">
  	<div style=" display: flex; flex-direction: row; align-items: center; width: 100%;">
      <a class="navbar-brand" style="margin-right:auto;" href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/image/logoTrial2.png" alt="logo not found" style="width: 200px; height:60px;"></a>
   	  <div id="searchBar" style="margin-right:auto; border-radius: 50px; height: 47px; width: 500px; background-color: #eceeee;">
    	<form class="d-flex" method="GET" action="<%=request.getContextPath()%>/place/searchPlace.do">
          <input class="form-control me-2" name="searchValue" type="search" placeholder="원하는 장소를 검색해보세요!" aria-label="Search" style="margin-top:5px; border: none; background-color: #eceeee; border-radius: 50px;">
          <button class="btn " type="submit" style="border:none; align-self: center;" ><img alt="searchBtn" src="<%=request.getContextPath()%>/resources/image/searchBtn.png" ></button>
        </form> 			
      </div>
      <div class="d-flex">
		<div id="categoryList" class="fw-bold" style="color: #838a90; cursor: pointer;">카테고리 &nbsp;</div>
		<div class="fw-bold" style="color: #838a90;"> | </div>
		
		<div class="fw-bold"><a href="<%=request.getContextPath()%>/host.do" style="color: #838a90;" target="_blank">&nbsp; 공간 등록 </a></div>
	  
	  </div>			
      <button class="navbar-toggler" type="button" style="border: none; margin-left:auto;" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
    <div id="category" class="d-none">
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=partyRoom" class="partyRoom" >파티룸</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=dancePractice" class="dancePractice" >춤연습실</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=homeGim" class="homeGim" >운동시설</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=meeting" class="meeting" >회의실</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=office" class="office" >독립 오피스</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=officeShare" class="officeShare" >공유 오피스</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=recording" class="recording" >녹음실</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=singPractice" class="singPractice" >노래연습실</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=smallWedding" class="smallWedding" >스몰웨딩</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=studio" class="studio" >스튜디오</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=gallery" class="gallery" >갤러리</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=shareKitchen" class="shareKitchen" >공유주방</a>
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
  </div>
</nav>
<!-- category 호버시 상세 category 보여주기 -->
<script>
$("#categoryList").hover(
	function(){
		$("#category").removeClass("d-none");	
	}
);
$(".navbar.navbar-light").mouseleave(function() {
	$("#category").addClass("d-none");
});
</script>
<script>
$("#categoryList").click(function(){
		$("#category").toggleClass("d-none");	
	}
);
</script>

















