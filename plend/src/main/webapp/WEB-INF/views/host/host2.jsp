<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		a{
			text-decoration: none;
		}
		a:link{
			text-decoration: none;
			color: black;
		}
		a:visited{
			text-decoration: none;
			color: black;
		}
		a:hover{
			color: #6e6e6e;
		}
		a:active{
			color: #6e6e6e;
		}
		
		.hostLogin{
			color:white;
			font-weight: bold;
			border-radius: 20px;
			text-align:center;
			width: 300px;
			height:100px;
			background-color:#2F506D; 
			font-size: 1.5rem;
			border: none;
		}
		.selectedBtn{
		background:#f9f9fa;
		color: #2F506D;
		box-shadow: 5px 5px 5px 5px  #a7a7a7;
	}
		
    </style>

    <script>
    </script>
    <!-- Custom styles for this template -->
    <link href="sticky-footer-navbar.css" rel="stylesheet">
</head>
<body style="background:#E8DCD5;">
	<div id = "wrap">

		  <!--header -->
		   <nav class="navbar navbar-expand-md navbar-dark " style = "background-color:#2F506D; height: 80px;">
		    <div class="container-fluid">
		      <a class="navbar-brand" href="#" style = "margin-left:50px;">HOSTING CENTER</a>
		      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		        <span class="navbar-toggler-icon"></span>
		      </button>
		    </div>
		  </nav> 
	
			<!-- content -->
			<main class="flex-shrink-0" style="flex:1;" >
				<img alt="호스트센터 " src="<%=request.getContextPath()%>/img/hostCenter.png" style="width:100%; height:30%;">
				<div style="height: 300px;"></div>
				<img alt="호스트센터 " src="<%=request.getContextPath()%>/img/hostCenter2.png" style="width:100%">
				<div style="height: 200px;"></div>
				<div class="d-flex" style="flex-direction: column; align-items: center;">
					<c:choose>
						<c:when test="${login == null }">
							<button onclick="location.href='<%=request.getContextPath()%>/common/signIn.do'" class="hostLogin" id="hostLogin">내 공간 등록하기</button>
						</c:when>
						<c:when test="${login.role eq '1' && login.role eq '3'}">
							<button onclick="location.href='<%=request.getContextPath()%>/host/managePlace.do'" class="hostLogin" id="hostLogin">내 공간 등록하기</button>
						</c:when>
						<c:when test="${login.role eq '2' }">
							<button onclick="hostLogin()" class="hostLogin" id="hostLogin">내 공간 등록하기</button>
						</c:when>
					</c:choose>
				</div>
				<div style="height: 400px;"></div>
			</main>
			

    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	</div>
	<script>
		$(function(){
			//마우스 hover
			$("#hostLogin").on('mouseenter', function(){
				$("#hostLogin").addClass("selectedBtn");
			})
			//마무스 out
			$("#hostLogin").on('mouseleave', function(){
				$("#hostLogin").removeClass("selectedBtn");
			})
		})
	</script>
	<!-- 공간 등록 분기  -->
	<script>
		function hostLogin (){
			
			if(confirm("현재 일반회원으로 로그인 되어있습니다. 사업자로 회원가입 하시겠습니까?") == true){
				location.href = '<%=request.getContextPath()%>/common/signUp.do';			
			}else{
			}
		}
	</script>

  </body>
  
</html>
