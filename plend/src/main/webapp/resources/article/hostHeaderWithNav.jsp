<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

    

  <!-- Header -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top" style ="background-color:#2F506D; height: 70px;">
    <div class="container-fluid">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/host/managePlace.do" style = "margin-left:50px;">HOSTING CENTER</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse text-white" id="navbarCollapse" style = "margin-right:50px; justify-content: flex-end;">
       
        <c:if test="${login == null }">
        <!-- 인터셉터로 막기  -->
        <span>세션없음</span>
        </c:if>
        <c:if test="${login != null }">
        [<a href = "<%=request.getContextPath()%>/common/signOut.do" id = "header">로그아웃</a>&nbsp;|&nbsp;<a href = "<%=request.getContextPath()%>/" id = "header">메인 페이지</a>]
        </c:if>
      </div>
    </div>
  </nav>

<!-- nav -->
<div class="container"> 
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-black sidebar collapse fixed">
      <div class="position-sticky pt-3">
     	<ul class="H_ul" style="margin-top: 40px;">
     	<!-- 나중에 해당링크 들어간 곳 글씨 진하게하는 css 추가하기 -->
 		 <!-- <li><a href="#">매출 관리</a></li> -->
 		 <li><a href="<%=request.getContextPath()%>/host/income.do">매출&#38;정산</a></li>
 		 <li><a href="<%=request.getContextPath()%>/host/managePlace.do">장소 관리</a></li>
  		 <li><a href="<%=request.getContextPath()%>/host/inquiry_user.do">이용자 문의</a></li>
 		 <li><a href="<%=request.getContextPath()%>/host/eventList.do?startEnd=start">이벤트</a></li>
 		 <li><a href="<%=request.getContextPath()%>/host/notice_dev.do">공지사항</a></li>
 		
 		
 		<!--  <li><a href="#" >판매자 정보</a></li> -->
 		 <li><a href="<%=request.getContextPath()%>/inquiry_dev/inquiry_FAQ.do" style ="font-size:13px; font-size:13px; margin-top: 100%;" >FAQ</a></li>
 		 <li><a href="<%=request.getContextPath()%>/inquiry_dev/inquiry_dev.do" style ="font-size:13px; margin-bottom: 40%">운영자 문의</a></li>
	    </ul>
      </div>
    </nav>
   </div>
</div>


