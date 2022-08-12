<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>plend</title>
	<!-- 07.08 김연희: 폰트어썸 - 카드 별, 하트 아이콘   -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="../resources/js/jquery-3.6.0.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/global.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/home.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/notice.css" rel="stylesheet">
	
	<script type="text/javascript">
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/headerwithCate.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		})
	</script>
	
	<script>
	
	function like (obj){
		if($(obj).hasClass("fa-regular") == true){
			$(obj).removeClass("fa-regular");
			$(obj).addClass("fa-solid");
		}else{
			$(obj).removeClass("fa-solid");
			$(obj).addClass("fa-regular");
		}
		
	}
	
	</script>
</head>

<body>
<div id="wrap">	
	<header id="header"></header>
	<br>
	<br>
	<div style = "text-align:center;">
	<form action = "notice.do" method = "get">
		<input type = "text" id = "searchBar" name="searchValue"> <button id = "searchBut">검색</button> 
	</form>
	</div>
	<br>
	<br>
	<table class="table table-striped" id = "tab">
  <thead>
    <tr>
      <th scope="row">no</th>
      <th id = "title">제목</th>
      <th id = "write">작성자</th>
      <th id = "write">작성일</th>
      <th id = "hit">조회수</th>
    </tr>
  </thead>
  <tbody>
  <c:if test = "${list.size() == 0}">
  <tr>
		<td colspan = "5">등록된 게시글이 없습니다.</td>
  </tr>
  </c:if>
  <c:if test = "${list.size() > 0}">
  	<c:forEach var = "vo" items = "${list}">
    <tr>
      <td scope="row">${vo.nidx}</td>
      <td id = "title"><a href = "noticeView.do?nidx=${vo.nidx}">${vo.title}</a></td>
      <td id = "write">${vo.nickName}</td>
      <td id = "write">${vo.date.substring(0,10)}</td>
      <td id = "hit">${vo.hit}</td>
    </tr>
    </c:forEach>
  </c:if>
  </tbody>
  </table>
  <br>
  <div style = "margin-left:20%;margin-right:20%;float:right;">
	  <c:if test="${login.role == '1'}">
	  <input type = "button" id = "noticeReg" value = "등록하기" onclick="location.href='noticeReg.do' ">
	  </c:if>
	  <c:if test="${login.role != '1'}">
	  </c:if>
  </div>
  <br>
  <c:if test="${not empty list}">
			<nav id="pagenation" class="row">
			  <ul class="pagination justify-content-center">
			  	<c:if test="${pagenation.startPage > 5}">
				    <li class="page-item">
				      <a class="page-link" href="notice.do?nowPage=4">&laquo;</a>
				    </li>
			  	</c:if>
			  	<c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="p">
					<c:choose>
						<c:when test="${p == pagenation.nowPage }">
							<li class="page-item"><a class="page-link text-white" style="background-color:#2F506D;" href="notice.do?nowPage=${p}">${p}</a></li>
						</c:when>
						<c:when test="${p != pagenation.nowPage }">
							<li class="page-item"><a class="page-link" href="notice.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			    <c:if test="${pagenation.endPage != pagenation.lastPage}">
				    <li class="page-item">
				      <a class="page-link" href="notice.do?nowPage=${pagenation.endPage +1}">&raquo;</a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</c:if>
</nav>
<footer id="footer" class="mt-5"></footer>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>