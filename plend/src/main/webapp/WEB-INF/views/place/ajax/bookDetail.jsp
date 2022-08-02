<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ page session="true" %>

		<table class="table beforeBook">
			<thead>
				<tr> 
					<th colspan="2" style="text-align: center;" > &bull; 예약이 완료되었습니다. </th>
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
						<tr> 
							<td>결제 완료 금액: </td>
							<td> ${placeOne.price} </td>
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
						<tr> 
							<td>결제 완료 시각:</td>
							<td> ${boot.requested_at} </td>
							<td>결제 완료 금액:</td>
							<td> ${boot.price} </td>
						</tr>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<div class="d-flex justify-content-between">
			<div class="d-inline-flex">
				<button type="button" class="btn btn-sm" onclick="location.href='<%=request.getContextPath()%>/'">확인</button>
			</div>
		</div>
