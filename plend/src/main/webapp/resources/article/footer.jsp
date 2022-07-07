<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js">
    
    </script>
    <title>header</title>
	<meta charset="UTF-8">

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/album/">

    <!-- Bootstrap core CSS -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">




    <style>
      /* footer 하단고정 */
       #wrap {
  
	  display: flex;
	  min-height: 100vh;
	  flex-direction: column; 
   	  justify-content: flex-end;
	  
	  }
	  
	 
	 html,body{
	 margin: 0px;
	 }

      @media (max-width: 1000px) {
        #searchBar {
         display:none;
        }
      }
      
      @media (max-width: 576px) {
        #category {
         display:none;
        }
      }
      
           
      /* 07.04 김연희 : 검색창 클릭했을때 테두리 안나오게 설정  */
      input:focus{outline:none;}
      
    </style>


	
  </head>
  <body>
  <div id="wrap">

<footer class="text-muted py-5" style="background: rgba(217, 217, 217, 0.43);">
  <div class="container" style="display:flex; align-items: flex-end; flex-direction: row; justify-content: space-around;">
    
   	<div >
   	<img alt="logo" src="./resources/image/plend.png">
    <p class="mb-1">welcome to Plend! We offer you very special experiences! </p>
    <p class="mb-1">github: https://github.com/rh40614/Plend</p>
    <p class="mb-1">notion: https://url.kr/u8syia   </p>
    </div>
    <div>
    	<p class="mb-1">대표메일: representative@email.com</p>
    	<p class="mb-0">대표연락처: 010-0000-0000</p>
    </div>
    <div>
  		<p>ⓒCopyrights Plend. All rights reserved.</p>
  	</div>
    
  </div>
  
  
</footer>


    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </div>
   
  </body>
  
  
  
</html>


  
