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
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>


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
      a {
      	 text-decoration : none;
      }
      a:link {
 		 color : white;
	  }
	  a:visited {
 		 color : white;
	  }
	  a:hover {
		  color : black;
	  }
	  a:active {
 		 color : gray;
	  }

    </style>

    <script>
	$(document).ready(function(){
		//화면의 높이와 너비를 구합니다.

		    var loadingImg = '';      
		    loadingImg += "<div id='loadingImg'>";
		    loadingImg += "<img src='<%=request.getContextPath()%>/img/host.gif' style='position: relative; display: block; margin: 270px auto;'>";
		    loadingImg += "</div>";

		    //화면에 레이어 추가
		    $('body')
		        //.append(mask)
		        .append(loadingImg)

		     //로딩중 이미지 표시
		    $('#loadingImg').show();
		
		setTimeout(function(){
			$('#loadingImg').hide();
			$('#loadingImg').remove();  
			window.location.href = 'host2.do';
		},1000);
		
		
	})
    </script>
    <!-- Custom styles for this template --> 
    <link href="sticky-footer-navbar.css" rel="stylesheet">
</head>
  <body class="d-flex flex-column h-100">
    


<!-- Begin page content -->



    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      
  </body>
</html>