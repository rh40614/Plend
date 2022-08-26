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

  <nav class="navbar navbar-light shadow-sm pt-3 fixed-top bg-white">
  <div class="container" style="flex-wrap: wrap; justify-content: center;">
  	<div style=" display: flex; flex-direction: row; align-items: center; width: 100%;">
	      <a class="navbar-brand" style="margin-right:auto;" href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/image/logoTrial2.png" alt="logo not found" style="width: 150px; height:45px;" id="logo"></a>
	   	  
	   	  <div id="searchBar" style="margin-right:auto; border-radius: 50px; height: 47px; width: 500px; background-color: #eceeee;">
			<form class="d-flex" id="frm">
	          	<input class="form-control me-2 searchBtn" name="searchValue" type="search" placeholder="원하는 장소를 검색해보세요!" aria-label="Search" onKeyPress="if( event.keyCode==13 ){searchPlace();}">
	          	<button class="btn " type="button" style="border:none; align-self: center;" onclick="searchPlace()"><i class="fa-solid fa-magnifying-glass" style="padding-right: 5;padding-top: 6;color: #7f8b93;"></i></button>
	        </form> 			
	      </div>
	      <div class="d-flex" id="CnP">
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
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=homeGym" class="homeGym" >운동시설</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=meeting" class="meeting" >회의실</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=office" class="office" >독립 오피스</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=shareOffice" class="shareOffice" >공유 오피스</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=recording" class="recording" >녹음실</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=singPractice" class="singPractice" >노래연습실</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=smallWedding" class="smallWedding" >스몰웨딩</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=studio" class="studio" >스튜디오</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=gallery" class="gallery" >갤러리</a>
    	<a href="<%=request.getContextPath()%>/place/placeList.do?category=shareKitchen" class="shareKitchen" >공유주방</a>
    </div>
    <!-- 오른쪽 캔버스  -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel" id="offcanvas">
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
     		<button type="button" class="btn-primary btn-lg mb-4" style="background: #FC5185; color: white; border-radius: 50px; border: none;float :left; "onclick="location.href='<%=request.getContextPath()%>/myPage/myPageCheck.do?uidx=${login.uidx}' ">마이페이지</button>
     		</c:if>
			<c:if test = "${login.role == 3}">
			<button type="button" class="btn-primary btn-lg mb-4" style="background: #FC5185; color: white; border-radius: 50px; border: none;float :left; "onclick="location.href='<%=request.getContextPath()%>/host/income.do?uidx=${login.uidx}' ">호스트 페이지</button>
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
            <a class="nav-link" onclick = "alert('서비스 준비중 입니다.');" href="#">1:1 문의</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	 서비스 소개
            </a>
            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
              <li><a class="dropdown-item" href="<%=request.getContextPath()%>/projectInfo.do">프로젝트 소개</a></li>
              <li><a class="dropdown-item" href="<%=request.getContextPath()%>/teamInfo.do">팀원 소개</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
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
<script type="text/javascript">
	var en_h = "rRseEfaqQtTdwWczxvg";
	var reg_h = "[" + en_h + "]";
	
	var en_b = {
	    k:0,o:1,i:2,O:3,j:4,p:5,u:6,P:7,h:8,hk:9,ho:10,hl:11,y:12,n:13,nj:14,np:15,nl:16,b:17,m:18,ml:19,l:20
	}
	var reg_b = "hk|ho|hl|nj|np|nl|ml|k|o|i|O|j|p|u|P|h|y|n|b|m|l";
	
	var en_f = {
	    "":0,r:1,R:2,rt:3,s:4,sw:5,sg:6,e:7,f:8,fr:9,fa:10,fq:11,ft:12,fx:13,fv:14,fg:15,a:16,q:17,qt:18,t:19,T:20,d:21,w:22,c:23,z:24,x:25,v:26,g:27
	}
	var reg_f = "rt|sw|sg|fr|fa|fq|ft|fx|fv|fg|qt|r|R|s|e|f|a|q|t|T|d|w|c|z|x|v|g|";
	
	var reg_exp = new RegExp("("+reg_h+")("+reg_b+")((?:"+reg_f+")(?=(?:"+reg_h+")(?:"+reg_b+"))|(?:"+reg_f+"))","g");
	
	function toKorean(str) {
		var result = str.replace(reg_exp,replace);
		console.log(result);
		
	    return result;
	}
	
	function replace(str,h,b,f) {
	    return String.fromCharCode(en_h.indexOf(h)*21*28 + en_b[b]*28 + en_f[f] + 44032);
	}

</script>
<!-- 검색 -->
 <script>
 	function searchPlace(){
 		var searchValue = $("input[name=searchValue]").val();
 		
		//분기 만들어서 테스트 하기()
 		<%-- $.(function(){
 			url:"<%=request.getContextPath()%>/place/searchPlace.do",
 			data: searchValue,
 			success:function(data){
 				
 			}
 			
 		}) --%>
 		
 		var result = toKorean(searchValue);
 		console.log(result);
 		
 		$("input[name=searchValue]").val(result);
 		$("#frm").attr("action","<%=request.getContextPath()%>/place/searchPlace.do").submit();
 	}
 </script>













