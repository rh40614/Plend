<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap core CSS -->
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


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
      #header {
      	 text-decoration : none;
      }
      #header:link {
 		 color : white;
	  }
	  #header:visited {
 		 color : white;
	  }
	  #header:hover {
		  color : black;
	  }
	  #header:active {
 		 color : gray;
	  }
	  ul {
		  list-style-type: none;
		  margin: 0;
		  margin-top : 40px;
		  padding: 0;
		  width: 11%;
		  background-color: #242424;
		  position: fixed; left : 0;
		  height: 100%;
		  overflow: auto;
		}
	
		li a {
		  display: block;
		  color: white;
		  padding: 8px 16px;
		  text-decoration: none;
		  position : relative;
		  margin-top : 20px;
		  text-align:center;
		}
		li a:before{
			content: '';
		    position: absolute; /*?????? ???????????? position: relative??? ????????? ???*/
		    background-color: white;
		    height: 1px;
		
		    width: 0; /*????????? ????????? ?????????*/
		    bottom: 0; /*a?????? ????????? ??????*/
		    transition: 0.7s; /*??????????????? ?????? ?????? ?????? ??????*/
		    margin-right:64px;
		    right:0;
		}
		
		li a:hover:before{
			width: 100%;
		}
		li a:hover{
			color:white;	
	}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
  </head>
  <body>
    
<header>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top" style = "background-color:#2F506D;">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" style = "margin-left:50px;">HOSTING CENTER</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse text-white" id="navbarCollapse" style = "margin-right:50px;justify-content: flex-end;">
        [<a href = "" id = "header">????????????</a>&nbsp|&nbsp<a href = "" id = "header">???????????????</a>]
      </div>
    </div>
  </nav>
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-black sidebar collapse">
      <div class="position-sticky pt-3">
     	<ul>
     	<!-- ????????? ???????????? ????????? ??? ?????? ??????????????? css ???????????? -->
 		 <li><a href="#">?????? ??????</a></li>
 		 <li><a href="#">?????? ??????</a></li>
  		 <li><a href="#">?????? ??????</a></li>
 		 <li><a href="#">??????</a></li>
 		 <li><a href="#">?????? ??????</a></li>
 		 <li><a href="#">????????????</a></li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li>???</li>
 		 <li><a href="#" style = "font-size:13px;">????????? ??????</a></li>
 		 <li><a href="#" style = "font-size:13px;">????????? ??????</a></li>
	    </ul>
      </div>
    </nav>
   </div>
</div>

	<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
     </body>
</html>