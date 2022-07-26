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
			</tbody>
		</table>
		<div class="d-flex justify-content-between">
			<div class="form-check d-inline-flex">
			  <input class="form-check-input me-1" type="checkbox" value="" id="flexCheckDefault">
			  <label class="form-check-label" for="flexCheckDefault">
			    	상기 예약 정보를 확인하였습니다.
			  </label>
			</div> 
			<div class="d-inline-flex">
				<button type="button" class="btn btn-sm me-2">옵션 변경하기</button>
				<button type="button" class="btn btn-sm">결제하기</button>
			</div>
		</div>
	</main>
</div>
<footer id="footer" class="row mt-5 fixed-bottom"></footer>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 금액 단위 표시하기 -->
<script>
	$(".price").text(new Intl.NumberFormat().format(${placeOne.price}));
</script>
</body>
</html>




