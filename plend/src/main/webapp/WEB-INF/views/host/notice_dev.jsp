<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-공지사항</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<!-- bootstrap  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!--  fontAwesome -->
	<script src="https://kit.fontawesome.com/f5807db9d4.js" crossorigin="anonymous"></script>
	
	
	<script type="text/javascript">
	//프론트 디자인
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/hostHeaderWithNav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/hostfooter.jsp");
		})
	</script>
	<!-- 검색 -->	
	<script>
	function noticeSearch(){
		
		if($("select option:selected").text() == "카테고리"){
			alert("검색 카테고리를 선택해주십시오.")
			return;
		} 
		
		var searchContent = $("form[name=frm]").serialize();
		
		console.log(searchContent);
		$.ajax({
			url:"noticeSearch.do",
			type: "GET",
			data: searchContent,
			success: function(data){
				console.log("검색성공");
				$("#afterSearch").html(data);
			},
			error: function(data){
				console.log("검색실패");
				console.log(data)
			}
			
		});
	}
	</script>


</head>
<body>

	<header id="header"></header>
	
<main>
		<section style="margin-top: 100px;">
			<span class="title1">공지사항</span>
		
				<div class=".table-responsive container " style="margin: 20px 0px 0px 100px;" >
				
					<!-- 검색폼 -->
						<form  name="frm" id="frm" >
							<div class="row search-form mb-5" style="float:right;">
								<div class="input-group justify-content-center">
								<button type="button" class="me-3" style="background: #eceeef; border: none; color: grey; width: 80px; border-radius: 4px" onclick="location.href='<%=request.getContextPath()%>/host/notice_dev.do'">초기화</button>
									<select class="form-select-sm" name="searchType" required>
										<c:choose>
											<c:when test="${pagination.searchType eq null}">
												<option value="" disabled selected >카테고리</option>
												<option value="title">제목</option>
					  							<option value="content">내용</option>
											</c:when>
											<c:when test="${pagination.searchType eq 'title'}">
												<option value="" disabled >카테고리</option>
												<option value="title" selected >제목</option>
					  							<option value="content">내용</option>
											</c:when>
											<c:when test="${pagination.searchType eq 'content'}">
												<option value="" disabled>카테고리</option>
												<option value="title" >제목</option>
					  							<option value="content" selected >내용</option>
											</c:when>
											<c:otherwise>
												<option value="" disabled selected >카테고리</option>
												<option value="title">제목</option>
					  							<option value="content">내용</option>
											</c:otherwise>
										</c:choose>
									
									</select>
									<c:if test="${pagination.searchValue ne null}">
										<input type="text" name="searchValue" class="mx-1" value="${pagination.searchValue}">
									</c:if>
									<c:if test="${pagination.searchValue eq null}">
										<input type="text" name="searchValue" class="mx-1">
									</c:if>
									
									<button type="button" id="searchbtn" style="background: #2F506D; border: none; color: white; width: 80px; border-radius: 4px" onclick="noticeSearch()">검색</button>
									
								</div>
							</div>
						</form>
					
				<div id=afterSearch>
					<!-- 공지사항 -->
					<div style="height:	580px;">
					<table class="table table-hover text-center clearfix " >
						<thead class="table-dark">
							<tr style="text-al">
								<td>번호</td><td>제목</td><td style="width: 10%">조회수</td><td style="width: 10%">작성일</td>
							</tr>
						<thead>
						<tbody>
							<c:if test="${list.size() == 0}">	
								<tr>
									<td colspan="6">등록된 문의가 없습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${list.size() > 0}">
								<c:forEach var="n" items="${list}">
									<tr >
										<td class="col-md-1">${n.rnum}</td>
										<td class="col-md-8" style="text-align:left!important;"><a href="<%=request.getContextPath()%>/host/noticeView.do?nidx=${n.nidx}&searchType=${pagination.searchType}&searchValue=${pagination.searchValue}&rnum=${n.rnum}">${n.title}</a></td>
										<td class="col-md-1">${n.hit}</td>
										<td class="col-md-2">${n.date.substring(0,10)}</td>
									</tr>
								</c:forEach>
							</c:if> 
						</tbody>
					</table>
				</div>	
				<!-- 페이징 -->
				<c:if test="${not empty list}">
					<nav aria-label="Page navigation example" class="m-auto">
					  <ul class="pagination justify-content-center " >
					  	
						<c:if test="${pagination.startPage > 5}">
							<li class="page-item">
					      		<a class="page-link" href="notice_dev.do?nowPage=4">&laquo;</a>
					    	</li>
					    </c:if>
					    
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="p">
							<c:choose>
								<c:when test="${p == pagination.nowPage }">
									 <li class="page-item text-secondary ">
									 <a class="page-link text-secondary activePage" href="notice_dev.do?nowPage=${p}&searchType=${pagination.searchType}&searchValue=${pagination.searchValue}">${p}</a></li>
								</c:when>
								<c:when test="${p != pagination.nowPage }">
									<li class="page-item text-secondary">
									<a class="page-link text-secondary" href="notice_dev.do?nowPage=${p}&searchType=${pagination.searchType}&searchValue=${pagination.searchValue}">${p}</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					
				    	<c:if test="${pagination.endPage != pagination.lastPage}">
						    <li class="page-item">
						      <a class="page-link" href="notice_dev.do?nowPage=${pagination.endPage +1}">&raquo;</a>
						    </li>
				    	</c:if>
					  </ul>
					</nav>
				</c:if> 
			</div>
		</div>	
		</section>
		
	</main>
	<div style="margin:300px;"></div> 
	<footer id="footer"></footer>
	
	
	
</body>
</html>