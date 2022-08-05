<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>장소 상세 페이지</title>
	<!-- BootStrap css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- jquery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<!-- css -->
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/placeDetail.css" rel="stylesheet">
	<!-- 07.28 김연희: 부트페이 -->
	<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
	
	<!-- header/footer -->	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
	<style type="text/css">
		.beforeBook > tbody > tr > td {
			padding: 15px;
		}
	</style>
	
	<script>
	function payment(){
		//주문번호 pk에 사용할 수
		var today = new Date();   
		var hours = ('0' + today.getHours()).slice(-2); 
		var minutes = ('0' + today.getMinutes()).slice(-2);
		var seconds = ('0' + today.getSeconds()).slice(-2); 
		var timeString = hours + minutes + seconds;
	console.log(timeString);
		
		 BootPay.request({
		      price: '1000', //실제 결제되는 가격
		 
		      // 관리자로그인 -> 결제설치 -> 인증키 및 보안 -> WEB Application ID
		      application_id: "62e277882701800023bd122a",
		 
		      name: '${placeOne.placeName}', //결제창에서 보여질 이름
		      pg: 'nicepay',
		      method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
		      show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		      items: [
		          {
		              item_name: '${placeOne.placeName}', //상품명
		              qty: 1, //수량
		              unique: '${placeOne.pidx}', //해당 상품을 구분짓는 primary key
		              price: 1000, //상품 단가
		          }
		      ],
		      order_id: 'order_id_${placeOne.pidx}', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		  }).error(function (data) {
		      //결제 진행시 에러가 발생하면 수행됩니다.
		      console.log(data);
		  }).cancel(function (data) {
		      //결제가 취소되면 수행됩니다.
		      console.log(data);
		  }).close(function (data) {
		      // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		      console.log(data);
		  }).done(function (data) {
		      //결제가 정상적으로 완료되면 수행됩니다
		      console.log(data);     
		      $.ajax({
		    	  url: "bookDetail.do",
		    	  type: "POST",
		    	  data: data,
		    	  dataType: "json",
		    	  success:function(obj){
		    		  console.log("성공"); 
		    		  console.log(obj);
		    		  console.log(obj.price);
		    		  html ="";
		    		  html += "<td>결제 완료 시각:</td>";
		    		  html += "<td>"+ obj.purchased_at +"</td>";
		    		  html += "<td>결제 완료 금액:</td>";
		    		  html += "<td>"+obj.price+"</td>";
		    		   $("#bookDone").html(html);
		    		   
		    		   //하단 버튼 변경
		    		   html2 ="";
		    		   html2 +="<div class='d-inline-flex'>";
		    		   html2 +="<button type='button' class='btn btn-sm me-2' onclick='goMain()'>확인</button>";
		    		   html2 +="</div>";
		    		   
		    		   $("#bookDonebtn").html(html2);
		    	  },
		    	  error: function(){
		    		  console.log("실패");
		    	  }
		      });
		  });
	}
	 
	</script>
	<script>
	function goMain(){
		location.href="<%=request.getContextPath()%>/";
	}
	</script>
</head>

<body>

<div class="container">	
	<header class="row" id="header"></header>
	<br>
	<main class="row">
			<table class="table beforeBook">
				<thead>
					<tr> 
						<th colspan="2"> &bull; 예약 정보를 확인해주시길 바랍니다. </th>
					</tr>
				</thead>
				<tbody>
					<tr> 
						<td>공간:</td>
						<td> ${placeOne.placeName} </td>
					</tr>
					<tr> 
						<td>시간:</td>
						<td> ${bookvo.useTime}</td>
					</tr>
					<tr> 
						<td>인원:</td>
						<td> ${bookvo.cntPeople}</td>
					</tr>
					<tr> 
						<td>금액:</td>
						<td class="price"></td>
					</tr>
					<tr> 
						<td>옵션:</td>
						<td> ${placeOne.option1},${placeOne.option2} </td>
					</tr>
					<c:choose>
						<c:when test="${placeOne.eventYN eq 'Y'}">
							<tr> 
								<td>상설할인:</td>
								<td> ${placeOne.category} 10% 할인 </td>
							</tr>
							<tr> 
								<td>최종 결제가:</td>
								<td class="realPrice"></td>
							</tr>
							<!-- 최종 결제 가격 구하기 -->
							<script type="text/javascript">
								let realPrice = ${placeOne.price} - parseInt(${placeOne.price} * 0.1);
								$(".realPrice").text(new Intl.NumberFormat().format(realPrice));
							</script>
						</c:when>
						<c:when test="${placeOne.eventYN eq 'N'}">
							<tr> 
								<td>상설할인:</td>
								<td> 상설할인 대상이 아닙니다. </td>
							</tr>
							<tr> 
								<td>최종 결제가:</td>
								<td> ${placeOne.price} </td>
							</tr>
						</c:when>
					</c:choose>
							<tr id="bookDone"></tr>
				</tbody>
			</table>
			<div id="bookDonebtn">
				<div class="d-flex justify-content-between">
					<div class="form-check d-inline-flex">
					  <input class="form-check-input me-1" type="checkbox" value="" id="flexCheckDefault">
					  <label class="form-check-label" for="flexCheckDefault">
					    	상기 예약 정보를 확인하였습니다.
					  </label>
					</div> 
					<div class="d-inline-flex">
						<button type="button" class="btn btn-sm me-2">옵션 변경하기</button>
						<button type="button" class="btn btn-sm" onclick="payment()">결제하기</button>
					</div>
				</div>
			</div>
	</main>
</div>
<footer id="footer" class="row mt-5"></footer>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 금액 단위 표시하기 -->
<script>
	$(".price").text(new Intl.NumberFormat().format(${placeOne.price}));
</script>

</body>
</html>




