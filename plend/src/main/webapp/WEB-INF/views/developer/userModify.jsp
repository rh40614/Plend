<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- 07.12 김영민 뷰제작 -->
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보수정</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- daum 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/developer.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
		
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
				<p class="h5 fw-bold category-title"> 회원정보수정 </p>
			</div>
		</div>
		<section class="row px-1" style="margin-bottom: 80px;">
			<div class="modify-div col me-5 mt-5">
				<p class="blockquote-footer mt-1"> 회원기본정보 </p>
				<table class="col table border-top border-dark">
				  <tbody>
				    <tr>
				      <td scope="row" class="align-middle text-center">아이디</td>
				      <td> <input type="text" class="form-control" value="${user.id}"> </td>
				    </tr>
				    <tr>
				      <td scope="row" class="align-middle text-center">비밀번호</td>
				      <td> <input type="text" class="form-control" value="${user.password}"></td>
				    </tr>
				    <tr>
				      <td scope="row" class="align-middle text-center">이름</td>
				      <td> <input type="text" class="form-control" value="${user.name}"></td>
				    </tr>
				    <tr>
				      <td scope="row" class="align-middle text-center">이메일</td>
				      <td> <input type="text" class="form-control" value="${user.email}"></td>
				    </tr>
				  </tbody>
			   </table>
			</div>
			<div class="modify-div col ms-5 mt-5">
				<p class="blockquote-footer mt-1"> 사이트가입정보 </p>
				<div class="mapApi mb-3">
					<div class="btn-group">
						<input type="text" class="form-control mt-1" id="postcode" placeholder="우편번호">
						<input type="button" class="form-control ms-1 mt-1 find-addr" onclick="DaumPostcode()" value="우편번호 찾기">
					</div>
					<input type="text" class="form-control mt-1" name="address" id="address" placeholder="주소" value="${user.addr}">
					<input type="text" class="form-control mt-1" name="detailAddress" id="detailAddress" placeholder="상세주소">
					<input type="text" class="form-control mt-1" name="extraAddress" id="extraAddress" placeholder="참고항목">
				</div>
			   	<table class="col table border-top border-dark">
				  <tbody>
				    <tr>
				      <td scope="row" class="align-middle text-center">생년월일</td>
				      <td><input type="text" class="form-control" value="${user.birth}"></td>
				    </tr>
				    <tr>
				      <td scope="row" class="align-middle text-center">닉네임</td>
				      <td><input type="text" class="form-control" value="${user.nickName}"></td>
				    </tr>
				    <tr>
				      <td scope="row" class="align-middle text-center">연락처</td>
				      <td><input type="text" class="form-control" value="${user.userPhone}"></td>
				    </tr>
				  </tbody>
				</table>
				<div class="float-end">
					<button class="btn btn-primary btn-sm">저장</button>
				</div>
			</div>
		</section>
		<div class="flex-grow-1"></div>
		<footer id="footer" class="row"></footer>
	</div>
	<!-- daumMapAPI javaScript -->
	<script>
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
	</script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>




