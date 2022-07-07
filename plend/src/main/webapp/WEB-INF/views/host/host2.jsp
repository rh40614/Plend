<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>호스트 페이지</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sticky-footer-navbar/">

    

    <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">
<script src="../resources/js/jquery-3.6.0.min.js"></script>


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      #link {
      	 text-decoration : none;
      }
      #link:link {
 		 color : white;
	  }
	  #link:visited {
 		 color : white;
	  }
	  #link:hover {
		  color : black;
	  }
	  #link:active {
 		 color : gray;
	  }
	
	  #wrap{
	  	display : flex;
	  	min-height: 100vh;
	  	flex-direction :column;
	  	justify-content:flex-end;
	  }
	  h3{
	  	margin-left:50px;
	  }
	  h4{
	  	margin-right:50px;
	  }
    </style>

    <script>
    </script>
    <!-- Custom styles for this template -->
    <link href="sticky-footer-navbar.css" rel="stylesheet">
</head>
  <body class="d-flex flex-column h-100">
<div id = "wrap">
<header>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top" style = "background-color:#2F506D;">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" style = "margin-left:50px;">HOSTING CENTER</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse text-white" id="navbarCollapse" style = "margin-right:50px;">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            
          </li>
          <li class="nav-item">
          </li>
          <li class="nav-item">
          </li>
        </ul>
        [<a href = "" id = "link">로그아웃</a>&nbsp|&nbsp<a href = "" id = "link">마이페이지</a>]
      </div>
    </div>
  </nav>
</header>
<!-- Begin page content -->
<main class="flex-shrink-0">
<br>
<br>
<br>
<br>
<br>
<span>
	<h3>플레이스를 만들고 관리해보세요!</h3>
	<h3>P:)end가 당신의 플레이스 운영을 도와줄거에요.</h3>
</span>
<br>
<hr style = "height:2px;">
<br>
<br>
<span style = "text-align:right;">
	<h4>등록한 플레이스를 관리하세요.</h4>
	<h4>호스트에게 필요한 관리 정보를 제공합니다.</h4>
</span>
<br>
<br>
<div style = "display:flex;justify-content: space-evenly;">
	<img src="../resources/image/money.png" style ="width:120px;height:120px;">
	<img src="../resources/image/earth.png" style ="width:120px;height:120px;">
	<img src="../resources/image/people.png" style ="width:120px;height:120px;">
	<img src="../resources/image/consulting.png" style ="width:120px;height:120px;">
</div>
<br>
<br>
<div style = "text-align:center;height:70px;padding:17px 0;background-color:#2F506D;">
	<a href = "#" id = "link" style = "font-size:25px;">플레이스 시작하기</a>
</div>
</main>

<footer class="footer mt-auto py-3 bg-light">
  <div class="container">
    <span class="text-muted">Place sticky footer content here.</span>
  </div>
</footer>


    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</div>
  </body>
  
</html>
