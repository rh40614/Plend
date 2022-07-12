<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
    <script src="resources/js/jquery-3.6.0.min.js"></script>
    <script>
    $(".que").click(function() {
    	   $(this).next(".anw").stop().slideToggle(300);
    	  $(this).toggleClass('on').siblings().removeClass('on');
    	  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
    	});



    
    </script>
    <style>
    .que:first-child{
    border-top: 1px solid black;
  }
  
.que{
  position: relative;
  padding: 17px 0;
  cursor: pointer;
  font-size: 14px;
  border-bottom: 1px solid #dddddd;
  
}
  
.que::before{
  display: inline-block;
  content: 'Q';
  font-size: 14px;
  color: #006633;
  margin: 0 5px;
}

.que.on>span{
  font-weight: bold;
  color: #006633; 
}
  
.anw {
  display: none;
    overflow: hidden;
  font-size: 14px;
  background-color: #f4f4f2;
  padding: 27px 0;
}
  
.anw::before {
  display: inline-block;
  content: 'A';
  font-size: 14px;
  font-weight: bold;
  color: #666;
  margin: 0 5px;
}

.arrow-wrap {
  position: absolute;
  top:50%; right: 10px;
  transform: translate(0, -50%);
}

.que .arrow-top {
  display: none;
}
.que .arrow-bottom {
  display: block;
}
.que.on .arrow-bottom {
  display: none;
}
.que.on .arrow-top {
  display: block; 
}


Resources
    </style>
  </head>
  <body>
<%-- <%
    String clientId = "yuDMbMbNqBLt1ltRxtOG"; //애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/controller/callback.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %> --%>
 
 
 <div id="Accordion_wrap">
     <div class="que">
      <span>This is first question.</span>
       <div class="arrow-wrap">
         <span class="arrow-top">↑</span>
        <span class="arrow-bottom">↓</span>
       </div>
      
     </div>
     <div class="anw">
      <span>This is first answer.</span>
     </div>
      <div class="que">
      <span>This is second question.</span>
     </div>
     <div class="anw">
      <span>This is second answer.</span>
     </div>
      <div class="que">
      <span>This is third question.</span>
     </div>
     <div class="anw">
      <span>This is third answer.</span>
     </div>
</div>
 
 
 
 
  <a href="${navervo.apiURL }"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
  <br>
  <a href="callback.do">callback</a>
  
  
  
  
  </body>
</html>