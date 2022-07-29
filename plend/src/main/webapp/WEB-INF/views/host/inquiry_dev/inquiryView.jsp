<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<section>
	<span class="title1 spaceL">문의 내용  </span>
	<br>
	<table class="spaceL border border-3 rounded w-75" style="border-collapse: initial;" >
		<tbody>
			<tr>
				<td colspan="2" class="fs-5"  style="padding: 30px;">${inquiry.title}</td>
			</tr>
			<tr>
				<td class="ps-4 pe-2" style="width: 80px;">유형 : </td>
				<td>${inquiry.category}</td>
			</tr>
			<tr>
				<td class="ps-4 pe-2" style="width: 80px;">제목 : </td>
				<td>${inquiry.title}</td>
			</tr>
			<tr>
				<td class="ps-4 pe-2 text-break" style="width: 100px; vertical-align: top;">내용 :</td>
				<td>${inquiry.content}</td>
			</tr>
		</tbody>
	</table>
		<br>
		<span class="spaceL mb-5">답변이 달린 이후에는 수정이 불가능합니다. </span>
		<div class="btn-group spaceL" role="group" id="btnGroup" style="text-align: right;" >
			<c:if test="${inquiry.answerYN == 'N' && login.role ne '1'}">
				<button class="btnDefault me-3" type="button" onclick="inquiryEdit_dev(this)" value="${inquiry.iqidx}">수정</button>
			</c:if>
		</div>
</section>
