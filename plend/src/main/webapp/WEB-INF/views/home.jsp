<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>plend</title>
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<script src="resources/js/jquery.shuffle-images.js"></script>
	<link href="resources/css/global.css" rel="stylesheet">
	<link href="resources/css/home.css" rel="stylesheet">

	<script type="text/javascript">
		$(function(){
			$("#header").load("resources/article/headerwithCate.jsp");
			$("#footer").load("resources/article/footer.jsp");
		})
	</script>

	<script>

	function like (obj, idx){

		if(${login ne null}){
			if($(obj).hasClass("fa-regular") == true){
				$.ajax({
					url: "<%=request.getContextPath()%>/place/heart.do?pidx="+idx+"&like=add",
					success: function(data){
						console.log(data);
						if(data == 1){
							$(obj).removeClass("fa-regular");
							$(obj).addClass("fa-solid");
							alert("찜목록에 등록되었습니다.");
						}else{
							alert("찜목록 등록에 실패했습니다.");
						}
					},
					error: function(){
						alert("찜목록 등록에 실패했습니다.");
					}
				});

			}else{
				$.ajax({
					url: "<%=request.getContextPath()%>/place/heart.do?pidx="+idx+"&like=delete",
					success: function(data){
						if(data == 1){
							$(obj).removeClass("fa-solid");
							$(obj).addClass("fa-regular");
							alert("찜목록에서 삭제했습니다.");
						}else{
							alert("찜목록 삭제에 실패했습니다.");
						}
					},
					error: function(){
						alert("찜목록 삭제에 실패했습니다.");
					}
				});
			}
		}else{
			alert("로그인을 해주세요.");
		}
	}

	</script>
	<!--데이터   -->
	<script>
		$(function(){
			$.ajax({
				url: "recommendPlace.do",
				type: "GET",
				success: function(data){
					$("#recommendPlace").html(data);
				}
			});
			$.ajax({
				url: "eventPlace.do",
				type: "GET",
				success: function(data){
					$("#eventPlace").html(data);
				}
			});
			$.ajax({
				url: "randomReview.do",
				type: "GET",
				success: function(data){
					$("#randomReview").html(data);
				}
			});
		});
	</script>





</head>

<body>
<div id="wrap">
	<header id="header"></header>
	<br>

	<main style="margin: 5% 19% 10% 19%; flex: 1;">
	<!--
	07.28 김하진 role 별로 로그인을 하고 navi바에서 들어가시길 바랍니다.
	불편하시면 따로 링크를 빼셔도 됩니다.
	 -->
	<a href="host/managePlace.do">장소등록 </a>
    <a href="developer/userList.do">유저리스트 </a>
    

  	<div style="    display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;">
    	<span class="navbar-brand title1">| 추천 장소 |</span>
    	<button  class="btn" onclick="newList()" style="vertical-align: bottom;margin-bottom:10px;"><i class="fa-solid fa-arrow-rotate-right">  더보기</i></button>
  	</div>
	<section class=" d-flex, flex-row  flex-start flex-wrap justify-content-between align-items-start" id="recommendPlace">
	</section>
	<hr>
	<br>

	
	<div style="display: flex; justify-content:space-between;">
    	<h3 class="navbar-brand title1" >| 이벤트</h3>
		<button  class="btn" onclick="newEvent()" style="vertical-align: bottom;margin-bottom:10px;"><i class="fa-solid fa-arrow-rotate-right">  더보기</i></button>
  	</div>
  	<section class=" d-flex, flex-row  flex-start flex-wrap justify-content-between align-items-start" id="eventPlace">
	</section>
	<hr>
	<br>

	<div>
    	<h3 class="navbar-brand title1">| 리뷰존</h3>
  	</div>
  	<section class=" d-flex, flex-row  flex-start flex-wrap justify-content-between align-items-start" id="randomReview">
	</section>





</main>


<footer id="footer" class="mt-5"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>
