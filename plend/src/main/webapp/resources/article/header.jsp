<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>
<style>
	#wrap {
	  display: flex;
	  min-height: 90px;
	  flex-direction: column;
   	  justify-content: flex-end;

	 }
</style>
<div id="wrap">
<header>


  <nav id="aticleHeader" class="navbar navbar-light shadow-sm fixed-top">


  <div class="container" style="align-items: center; flex-wrap: wrap; justify-content: center;">
  	<div style=" display: flex; flex-direction: row; align-items: center; width: 100%;">
    <a class="navbar-brand" style=" margin-right:auto; " href="/controller/"><img src="<%=request.getContextPath()%>/resources/image/plend.png" alt="logo not found"></a>
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
			<button type="button" class="btn-primary btn-lg mb-4" style="background: #FC5185; color: white; border-radius: 50px; border: none;float :left; "onclick="location.href='<%=request.getContextPath()%>/host/host.do?uidx=${login.uidx}' ">호스트 페이지</button>
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
          </li>>
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
</header>
  </div>
