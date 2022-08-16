<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- 07.13 김영민 뷰제작 -->
<html>
<head>
	<meta charset="UTF-8">
	<title>업체정보수정</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- daum 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/developer.css" rel="stylesheet">
		
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/developerHeader.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>	
</head>

<body>
	<div id="wrap" class="container-fluid">	
		<header id="header" class="row"></header>
		<br><br>
		<div class="row" style="margin-top: 80px;">
			<div class="col category">
				<p class="h5 fw-bold category-title" style="padding-left: 10%;"> 업체정보수정 </p>
			</div>
		</div>
		<form name="frm" action="enterModify.do?uidx=${enter.uidx}" method="post" onsubmit="return modifySubmit()">
			<section class="row px-1">
				<div class="modify-div col me-5 mt-5">
					<p class="blockquote-footer mt-1"> 업체기본정보 </p>
					<table class="col table border-top border-dark">
					  <tbody>
					    <tr>
					      <td scope="row" class="align-middle text-center">아이디</td>
					      <td> <input type="text" class="form-control" name="id" value="${enter.id}"> </td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">비밀번호</td>
					      <td> <input type="text" class="form-control" name="password"></td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">대표자명</td>
					      <td> <input type="text" class="form-control" name="name" value="${enter.name}"></td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">이메일</td>
					      <td> <input type="text" class="form-control" name="email" value="${enter.email}"></td>
					    </tr>
					  </tbody>
				   </table>
				   <p class="blockquote-footer mt-5"> 업체 보유 장소 </p>
					<table class="col table border-top border-dark mb-5">
					  <thead>
					  	<tr>
					  		<td class="align-middle text-center">No. </td>
					  		<td class="align-middle text-center">장소명 </td>
					  		<td class="align-middle text-center">업체이름 </td>
					  	</tr> 
					  </thead>
					  <tbody>
						  <c:if test="${empty placeList }">
					  		<tr>
					  			<td colspan="3"> 등록된 장소가 없습니다. </td>
					  		</tr>
					  	  </c:if>
					  	  <c:forEach var="place" items="${placeList}" varStatus="status">
						    <tr>
						      <td scope="row" class="align-middle text-center">${status.index+1}</td>
						      <td class="align-middle text-center"> ${place.placeName} </td>
						      <td class="align-middle text-center"> ${enter.nickName} </td>
						    </tr>
					  	  </c:forEach>
					  </tbody>
				   </table>
				</div>
				<div class="modify-div col ms-5 mt-5">
					<p class="blockquote-footer mt-1"> 사이트 가입 정보 </p>
					<div class="mapApi mb-3">
						<div class="btn-group">
							<input type="text" class="form-control mt-1" id="postcode" placeholder="우편번호">
							<input type="button" class="form-control ms-1 mt-1 find-addr" onclick="DaumPostcode()" value="우편번호 찾기">
						</div>
						<input type="text" class="form-control mt-1" value="${enter.addr}" name="address" id="address" placeholder="주소">
						<input type="text" class="form-control mt-1" name="detailAddress" id="detailAddress" placeholder="상세주소">
						<input type="text" class="form-control mt-1" name="extraAddress" id="extraAddress" placeholder="참고항목">
						<input type="hidden" name="addr" id="addr">
					</div>
				   	<table class="col table border-top border-dark">
					  <tbody>
					    <tr>
					      <td scope="row" class="align-middle text-center">사업자번호</td>
					      <td><input type="text" class="form-control" name="regnum" value="${enter.regnum}"></td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">업체명</td>
					      <td><input type="text" class="form-control" name="nickName" value="${enter.nickName}"></td>
					    </tr>
					    <tr>
					      <td scope="row" class="align-middle text-center">연락처</td>
					      <td><input type="text" class="form-control" name="userPhone" value="${enter.userPhone}"></td>
					    </tr>
					  </tbody>
					</table>
					<input type="hidden" name="role" value="${enter.role}">
					<div class="float-end">
						<button class="btn btn-primary btn-sm">저장</button>
					</div>
				</div>
			</section>
		</form>
		<div class="flex-grow-1"></div>
		<footer id="footer" class="row"></footer>
	</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/js/developer/enterModify.js"></script>
</body>
</html>




