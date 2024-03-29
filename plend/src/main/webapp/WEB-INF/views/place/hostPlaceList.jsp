<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<!-- 반응형 viewport  -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
	<title>plend에서 원하는 장소를 찾아보세요</title>
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>

	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/home.css" rel="stylesheet">
	<!-- 07.29 김연희 : 플랫피커 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<!-- 헤더 해당하는 카테고리에 색 넣기 -->
	<style type="text/css">
	.active {
		border-bottom: 3px solid #2F506D !important;
	}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp", function(){
				$(".${category.category}").addClass("active");
			});
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		});
	</script>

</head>

<body>
<div id="wrap">
	<header id="header" style ="background: white; "></header>
	<main style="margin: 5% 19% 10% 19%; flex: 1; min-height: 450px;" class="mainArrangement">
	
	<!-- 카테고리 제목 -->
	<div class="mb-5 ms-3" style="border-bottom: 3px solid #6c6c6c;">
    	<span class="title2" style="font-size: 18px; font-weight: 100;">
    	'${host.nickName}' 님의 공간이 마음에 드셨나요?<br>
    	'${host.nickName}' 님이 플렌드와 함께 공유하고 있는 공간들입니다. 
    	</span>
  	</div>
  	
  	
  <div id="search_result">
	<section class=" d-flex, flex-row  flex-start flex-wrap justify-content-start align-items-start sectionArrangement">
		<c:if test="${list.size() == 0}">
			<P class="m-auto" style="min-height:300px; display: inline-block; margin: 20px 0px 20px 0px; vertical-align: top; font-size: 20px; color: grey; padding-top: 200px;">
				등록된 장소가 없습니다. 더 많은 장소로 찾아오겠습니다. 
			</P>
		</c:if>
	
		<c:if test="${list.size() > 0 }">
			<c:forEach var ="c" items="${list}" varStatus="status"> 
			
			<div class="card border-0 mb-5" style="width: 22rem; height: 25rem; margin: 20px;">
  				<c:choose>
  					<c:when test="${c.placeImg == null}">
  						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
  							<img src="<%=request.getContextPath()%>/img/alternative/noPhoto.png" class="card-img-top" alt="등록된 사진이 없습니다." style="height: 13rem;">
  						</a>
  					</c:when>
  					<c:when test="${c.placeImg != null}">
  						<a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">
  							<img src="<%=request.getContextPath()%>/imageView.do?realFileName=${c.placeImg}" class="card-img-top" alt="사진 로딩 오류" style="height: 13rem;">
  						</a>
  					</c:when>
  				</c:choose>
 			<div class="card-body">
 				<h5 class="card-title title2-1" class=""><a href="<%=request.getContextPath()%>/place/view.do?pidx=${c.pidx}">${c.placeName}</a></h5>
 				<p class="card-text">${c.address}</p>
 				<span class="card-text title3"><fmt:formatNumber value="${c.price}" pattern="#,###"/></span><span>  원/시간</span>
 				<i class="fa-regular fa-star" style="float:right;margin-top: 7px;">  ${c.avgRate}</i>
 				<!-- 찜하기 -->
				 <c:choose>
					<c:when test="${c.heart eq '0'}">
						<a class="me-2 ms-2" style="cursor: pointer;">
							<i onclick="like(this, ${c.pidx})" class="fa-regular fa-heart" style="color: red;"></i>
							<span class="cntHeartOff${c.pidx}" style="color:red"> ${c.cntHeart}</span>
						</a>
					</c:when>
					<%-- <c:when test="${c.heart eq '1'}"> --%>
					<c:otherwise>
						<a class="me-2 ms-2" style="cursor: pointer;">
							<i onclick="like(this, ${c.pidx})" class="fa-solid fa-heart" style="color: red;" ></i>
							<span class="cntHeartOn${c.pidx}" style="color:red"> ${c.cntHeart}</span>
						</a>
					</c:otherwise>
					<%-- </c:when> --%>
				</c:choose> 
  			</div>
			</div>
			
			</c:forEach>
		</c:if>
	</section>
</div>


</main>


<footer id="footer" class="mt-5"></footer>
</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<!-- 찜하기 -->
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
								
								var cntH = $(".cntHeartOff"+idx).text();
								$(".cntHeartOff"+idx).text(' '+(parseInt(cntH)+1));
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
								
								var cntH = $(".cntHeartOn"+idx).text();
								$(".cntHeartOn"+idx).text(' '+(parseInt(cntH)-1));
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

	</script>
	<!-- 마이페이지 클릭시 세션 값이 있는지 확인 -->
	<script>
	function check(){
		var login = "${login.uidx}";
		if (login == "") {
			alert("로그인이 필요합니다.");
			location.href="<%=request.getContextPath()%>/common/signIn.do";
		} else {
			location.href="<%=request.getContextPath()%>/myPage/myInfo.do?uidx=${login.uidx}";
		}
	}
	
	</script>
	
	<!-- 달력 -->
	<script>
	$(function(){
		$(".selector").flatpickr({
			/* 시간은 안쓸거라 삭제 */
			minDate: "today", //과거의 날짜 비활성화
			maxDate: new Date().fp_incr(120), // 지금부터 120일 이내 
		});
		
	})
	</script>

	<!-- 부트 스트랩 팝오버 초기화-->
	<script>
  	$( function () {
		var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
	 	 return new bootstrap.Popover(popoverTriggerEl)
		});
  	} );
	</script>
	
	<!-- 팝오버 작동시 태그 구현  -->
	<script>
	function filter(){
		if($(".filter_human").css("visibility") == "hidden"){
			$(".filter_human").css("visibility","visible");
		}else if($(".filter_human").css("visibility") == "visible"){
			$(".filter_human").css("visibility","hidden");
		}  
	}
	
	 
	 function filter_human_set(){
		console.log("설정완료");
		$(".filter_human").css("visibility","hidden");
		
	}
	
	</script>
	
	<!-- 검색 -->
	<script>
		function search(){
			
			if($("#cntPeople").val() == 0){
				$("#cntPeople").val(1);
			}
			
		    var formData = $("#frm").serialize();
			console.log(formData);
		    $.ajax({
				url:"filter_search.do",
				method:"GET",
				data: formData,
				contentType: "text/html;charset=utf-8",
				success: function(obj){
					$("#search_result").html(obj);
				},
				error: function(){
					console.log("실패");
				}
				
			});
		}
	</script>
	<!-- 찜하기 -->
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

</body>
</html>
