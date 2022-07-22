<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<style type="text/css">
    a { color:#000000;text-decoration:none; }
    .scriptCalendar { text-align:center; }
    .scriptCalendar > thead > tr > td { width:50px;height:50px; }
    .scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
    .scriptCalendar > thead > tr:last-child > td { background-color:#90EE90; }
    .scriptCalendar > tbody > tr > td { width:50px;height:50px; }
</style>
<!-- jquery -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<!-- https://github.com/T00rk/bootstrap-material-datetimepicker 한번 집에서 사용해보기 -->
<script type="text/javascript">
	$().ready(function(){
		biludCalendar();
	});
	// 현재 시간 구하기
	var date = new Date(); 
	var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); 
	var kstGap = 9 * 60 * 60 * 1000; 
	var today = new Date(utc + kstGap);
	var localDate = new Date(utc + kstGap); 
	// 이전달 버튼 클릭
	function prevCalendar(){
		this.today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
		buildCalendar();
	}
	// 다음달 버튼 클릭
	function nextCalendar(){
		this.today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
		buildCalendar();
	}
	
	// 날짜 값을 받아 캘린더 폼을 생성하고 값을 채워 넣는다.
	function biludCalendar(){
		
		let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		let lastDate = new Date(today.getFullYear(), today.getMonth()+1,0);
		let tbCalendar = $(".scriptCalendar tbody");
		
		console.log(tbCalendar);
		
		$("#calYear").text(today.getFullYear());
		$("#calMonth").text(autoLeftPad((today.getMonth()+1),2));
		
		while(tbCalendar.length > 0){
			tbCalendar.deleteRow(tbCalendar.length -1);
		}
		
		let row = tbCalendar.insertRow();
		let dom = 1;
		let dayLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7 ) * 7) - doMonth.getDay();
		
		//달력 출력
		for(let day = 1 - doMonth.getDay(); dayLength >= day; day++){
			
			let column = row.insertCell();
			
			// 평일
			if(Math.sign(day) == 1 && lastDate.getDate() >= day){
				
				$(column).text(autoLeftPad(day,2));
				if(dom % 7 == 1){
					column.style.color = "#FF4D4D";
				}
				if(dom % 7 == 0){
					column.style.color = "#4D4DFF";
					row = tbCalendar.insertRow();
				}
			}else{
				let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
				column.innerText = autoLeftPad(exceptDay.getDate(), 2);
				column.style.color = "#A9A9A9";
			}
			
			if(today.getFullYear() == localDate.getFullYear()){
				if(today.getMonth() == localDate.getMonth()){
					if(localDate.getDate() > day && Math.sign(day) == 1){
						column.style.backgroundColor = "#E5E5E5";
					}else if(date.getDate() < day && lastDate.getDate() >= day){
						column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
					}else if(date.getDate == day){
						column.style.backgroundColor = "#FFFFE6";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
					}
				}else if(today.getMonth() < localDate.getMonth()){
					if(Math.sign(day) == 1 && day <= lastDate.getDate()){
						column.style.backgroundColor = "#E5E5E5";
					}
				}else{
					if(Math.sign(day) == 1 && day <= lastDate.getDate()){
						column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
					}
				}
			}else if(today.getFullYear() < localDate.getFullYear()){
				if(Math.sign(day) == 1 && day <= lastDate.getDate()){
					column.style.backgroundColor = "E5E5E5";
				}
			}else{
				if(Math.sign(day) == 1 && day <= lastDate.getDate()){
					column.style.backgroundColor = "#FFFFFF";
                    column.style.cursor = "pointer";
                    column.onclick = function(){ calendarChoiceDay(this); }
				}
			}
			
			dom++;
		}
	}
	
	function calendarChoiceDay(column){
		if($(".choiceDay")[0]){
			$(".choiceDay")[0].css("backgroundColor","#FFFFFF");
			$(".choiceDay")[0].removeClass("choiceDay");
		}
		column.style.backgroundColor = "#FF9999";
		column.classList.add("choiceDay");
	}
	
	function autoLeftPad(num, digit){
		if(String(num).length < digit){
			num = new Array(digit - String(num).length + 1).join("0") + num;
		}
		return num;
	}
	
</script>
</head>
<body>
	<table class="scriptCalendar">
	    <thead>
	        <tr>
	            <td onClick="prevCalendar();" style="cursor:pointer;">&#60;&#60;</td>
	            <td colspan="5">
	                <span id="calYear">YYYY</span>년
	                <span id="calMonth">MM</span>월
	            </td>
	            <td onClick="nextCalendar();" style="cursor:pointer;">&#62;&#62;</td>
	        </tr>
	        <tr>
	            <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
	        </tr>
	    </thead>
	    <tbody></tbody>
	</table>
</body>
</html>