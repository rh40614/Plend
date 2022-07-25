<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
		<span class="title1 spaceL">답변 확인 </span>
		<br>
		<button type="button" onclick="replyOpen(this)" class="btnBig spaceL" value="${inquiry.iqidx}">답변작성</button>
		
		<table class="spaceL border border-3 rounded w-75 h-75" style="border-collapse: initial;" >
			<tbody>
				<tr>
					<td class="ps-4 pe-2" style="width: 80px;">제목 : </td><td>${reply.title}</td>
				</tr>
				<tr>
					<td class="ps-4 pe-2 " style="width: 80px; vertical-align: top;">내용 :</td>
					<td>${reply.content}</td>
				</tr>
			</tbody>
		</table>
	</section>