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
<header>
 
  <nav class="navbar navbar-light shadow-sm fixed-top mt-4">
 
  <div class="container" style="align-items: center; flex-wrap: wrap; justify-content: center;">
  <div style=" display: flex; flex-direction: row; align-items: center; width: 100%;">
    <a class="navbar-brand" style=" margin-right:auto; " href="#"><img src="./resources/image/plend.png" alt="logo not found"></a>
    <div id="searchBar" style="border: 3px solid grey; border-radius: 10px; height: 47px; width: 750px;">
    	<form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="원하는 장소를 검색해보세요!" aria-label="Search" style="border: none;">
          <button class="btn " type="submit" style="border:none;" ><img alt="searchBtn" src="./resources/image/searchBtn.png" ></button>
        </form> 			
    </div>
    <button class="navbar-toggler" type="button" style="border: none; margin-left:auto;" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    </div>
    
    <div class="mt-5 row" id="category">
    	<div class="col-lg-12 col-sm-10 col-xs-8">
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_partyRoom.png" alt="파티룸" ></button> 
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_dancePractice.png" alt="춤연습실" ></button> 
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_homeGim.png" alt="운동시설" ></button> 
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_meeting.png" alt="회의실" ></button> 
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_office.png" alt="독립 오피스" ></button> 
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_officeShare.png" alt="공유오피스" ></button> 
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_recording.png" alt="녹음실" ></button> 
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_singPractice.png" alt="노래연습실" ></button>
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_smallWedding.png" alt="스몰웨딩" ></button> 
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_studio.png" alt="스튜디오" ></button> 
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_gallery.png" alt="갤러리" ></button> 
    	<button style="border:none; background:none; "><img src="./resources/image/category/i_shareKitchen.png" alt="공유주방" ></button>
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
  </div>
</nav>
</header>














<footer class="text-muted py-5" style="background: rgba(217, 217, 217, 0.43);">
  <div class="container" style="display:flex;">
    
   	<div>
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
    	<p class="float-end mb-1">
     	 <a href="#">Back to top</a>
    	</p>
  		<p>ⓒCopyrights Plend. All rights reserved.</p>
  	</div>
    
    
  </div>
  
  
</footer>


    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </div>
   
  </body>
  
  
  
</html>


  
