<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
		<span class="title1 spaceL">답변 확인 </span>
		<br>
		<span class="spaceL"> 추가적인 문의사항은 새로운 문의를 통하여 질문해 주시길 바랍니다.</span>
		
		<table class="spaceL border border-3 rounded w-75 h-75" style="border-collapse: initial;" >
			<tbody>
				<tr>
					<td class="ps-4 pe-2" style="width: 80px;">제목 : </td><td>${answer.title}</td>
				</tr>
				<tr>
					<td class="ps-4 pe-2 " style="width: 80px; vertical-align: top;">내용 :</td>
					<td>${answer.content}</td>
				</tr>
			</tbody>
		</table>
	</section>