<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.btn-group {
		background-color: var(--bs-gray-300) !important;
	}
	
	.btn-group > .btn {
		color: #838a90;
		border-radius: 0 !important;
	}
	
	.chooseTime {
		background-color: #639190 !important;
		color: white !important;
	}
	
	.diableTime {
		background-color: #344242 !important;
		pointer-events: none;
	}
</style>
<table class="table timeTable d-none caption-top">
	<caption style="padding-bottom: 10px; font-size: small; text-align: center; color: #db0000;">시작시간과 종료시간을 골라주세요</caption>
	<tbody>
		<tr>
			<td class="text-center" colspan="4" style="background-color: #2F506D; color: white;">AM</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100 01">01:00</td>
			<td class="btn w-100 02">02:00</td>
			<td class="btn w-100 03">03:00</td>
			<td class="btn w-100 04">04:00</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100 05">05:00</td>
			<td class="btn w-100 06">06:00</td>
			<td class="btn w-100 07">07:00</td>
			<td class="btn w-100 08">08:00</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100 09">09:00</td>
			<td class="btn w-100 10">10:00</td>
			<td class="btn w-100 11">11:00</td>
			<td class="btn w-100 12">12:00</td>
		</tr>
		<tr>
			<td class="text-center" colspan="4" style="background-color: #2F506D; color: white;">PM</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100 13">13:00</td>
			<td class="btn w-100 14">14:00</td>
			<td class="btn w-100 15">15:00</td>
			<td class="btn w-100 16">16:00</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100 17">17:00</td>
			<td class="btn w-100 18">18:00</td>
			<td class="btn w-100 19">19:00</td>
			<td class="btn w-100 20">20:00</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100 21">21:00</td>
			<td class="btn w-100 22">22:00</td>
			<td class="btn w-100 23">23:00</td>
			<td class="btn w-100 24">24:00</td>
		</tr>
	</tbody>
</table>
<!-- 시간 선택시 css 색상 변화/ 이전 시간 클릭시 초기화 -->
<script>
	$(".btn.w-100").click(function(){
		let num = $(this).text().substring(0,2);
		let pnum = parseInt(num)+1;
		if(pnum < 10){
			pnum = '0'+ pnum.toString();
		}
		let minTime = $(".chooseTime:lt(1)").text().substring(0,2);
		let lastTime = $(".chooseTime:last").text().substring(0,2);
		
		$(this).addClass("chooseTime");
		if(num < lastTime){
			$(".btn.w-100").removeClass("chooseTime");
			$(this).addClass("chooseTime");
			$(".selectTime").val("");
		}else if(num > minTime){
			if(minTime > 0 && !$(".btn.w-100").slice(minTime,num).is(".diableTime")){
				$(".btn.w-100").slice(minTime,num).addClass("chooseTime");
				$(".selectTime").val(minTime+","+num);
			}else if(minTime > 0){
				$(".btn.w-100").removeClass("chooseTime");
				$(".selectTime").val("");
			}
		}
	});
</script>