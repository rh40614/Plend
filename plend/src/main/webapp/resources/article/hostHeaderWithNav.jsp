<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<header>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top" style = "background-color:#2F506D;">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" style = "margin-left:50px;">HOSTING CENTER</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse text-white" id="navbarCollapse" style = "margin-right:50px;justify-content: flex-end;">
        [<a href = "" id = "header">로그아웃</a>&nbsp|&nbsp<a href = "" id = "header">마이페이지</a>]
      </div>
    </div>
  </nav>
</header>

<div class="container"> 
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-black sidebar collapse fixed">
      <div class="position-sticky pt-3">
     	<ul style="margin-top: 40px;">
     	<!-- 나중에 해당링크 들어간 곳 글씨 진하게하는 css 추가하기 -->
 		 <li><a href="#">매출 관리</a></li>
 		 <li><a href="#">장소 관리</a></li>
  		 <li><a href="#">문의 관리</a></li>
 		 <li><a href="#">쿠폰</a></li>
 		 <li><a href="#">제휴 혜택</a></li>
 		 <li><a href="#">공지사항</a></li>
 		
 		
 		 <li><a href="#" style = "font-size:13px; margin-top: 500px;">판매자 정보</a></li>
 		 <li><a href="#" style = "font-size:13px;">운영자 문의</a></li>
	    </ul>
      </div>
    </nav>
   </div>
</div>

