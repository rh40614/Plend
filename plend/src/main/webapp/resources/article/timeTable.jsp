<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.btn-group {
		background-color: lightgray !important;
	}
	
	.btn-group > .btn {
		border-radius: 0 !important;
	}
	
	.chooseTime {
		background-color: #2F506D !important;
		color: white !important;
	}
</style>
<table class="table timeTable d-none">
	<tbody>
		<tr>
			<td class="text-center" colspan="4">AM</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100">01:00</td>
			<td class="btn w-100">02:00</td>
			<td class="btn w-100">03:00</td>
			<td class="btn w-100">04:00</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100">05:00</td>
			<td class="btn w-100">06:00</td>
			<td class="btn w-100">07:00</td>
			<td class="btn w-100">08:00</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100">09:00</td>
			<td class="btn w-100">10:00</td>
			<td class="btn w-100">11:00</td>
			<td class="btn w-100">12:00</td>
		</tr>
		<tr>
			<td class="text-center" colspan="4">PM</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100">13:00</td>
			<td class="btn w-100">14:00</td>
			<td class="btn w-100">15:00</td>
			<td class="btn w-100">16:00</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100">17:00</td>
			<td class="btn w-100">18:00</td>
			<td class="btn w-100">19:00</td>
			<td class="btn w-100">20:00</td>
		</tr>
		<tr class="btn-group w-100">
			<td class="btn w-100">21:00</td>
			<td class="btn w-100">22:00</td>
			<td class="btn w-100">23:00</td>
			<td class="btn w-100">24:00</td>
		</tr>
	</tbody>
</table>
<!-- 시간 선택시 css 색상 변화/ 이전 시간 클릭시 초기화 -->
<script>
	$(".btn.w-100").click(function(){
		let num = $(this).text().substring(0,2);
		let minTime = $(".chooseTime:lt(1)").text().substring(0,2);

		$(this).addClass("chooseTime");
		$(".selectTime").val(num+","+(parseInt(num)+1));
		if(num < minTime){
			$(".btn.w-100").removeClass("chooseTime");
			$(this).addClass("chooseTime");
			$(".selectTime").val(num+","+(parseInt(num)+1));
		}else if(num > minTime){
			if(minTime > 0){
				$(".btn.w-100").slice(minTime,num).addClass("chooseTime");
				$(".selectTime").val(minTime+","+num);
			}
		}
	});
</script>