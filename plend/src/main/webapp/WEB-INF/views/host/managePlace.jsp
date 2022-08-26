<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hostcenter-장소 관리</title>

	<link href="<%=request.getContextPath()%>/resources/css/global_Host.css" rel="stylesheet">
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
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
	
	<script>
		$(function(){
			//장소 로딩
			$.ajax({
				url: "placeList.do",
				type: "GET",
				success: function(data){
					$("#placeList").html(data);
				}
			});
			//예약 로딩
			$.ajax({
				url: "bookList.do",
				type: "GET",
				success: function(data){
					$("#bookList").html(data);
				}
			});
			//리뷰 로딩
			$.ajax({
				url: "reviewList.do",
				type: "GET",
				success: function(data){
					$("#reviewList").html(data);
				},
				error: function(){
					console.log("아이고");
				}
			});
			
		});
	</script>
	<style>
		tr>td{
			vertical-align: middle;
		}
	</style>
	

</head>
<body>

	<header id="header"></header>
	<!-- 거절 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">예약 거절 </h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="reject()">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form id="frm" method="GET">
		        	<input type="hidden" name="bidx" Id="bidx">
		          <div class="form-group">
		            <label for="message-text" class="col-form-label">거절 사유:</label>
		            <textarea class="form-control" id="message-text" placeholder="구체적인 거절 사유를 입력해주세요" name="rejectContent" style=" resize:none; " rows="10" ></textarea>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="reject()">취소</button>
		        <button type="button" class="btn btn-primary"  id="savebtn">저장</button>
		      </div>
		    </div>
		  </div>
		</div>

	<main>
	<!-- 장소관리 리스트 -->
		<section>
		<div class="container" style=" margin-left: 100px; display: flex;  justify-content: space-between; align-items: baseline; margin-left: 100px;">
			<span class="title1" style="margin:0px;">플레이스 리스트</span>
			<button class="mb-3 btnBig " onclick="location.href='<%=request.getContextPath()%>/host/insertPlace.do'">플레이스 등록</button>
		</div>		
			<div class=".table-responsive container " style="margin-left: 100px;" >
				<div id="placeList" style="min-height:550px;justify-content: space-between;align-items: center;" class="d-flex flex-column" >
					<!-- 데이터 들어오는 곳 -->
				</div>
			    <hr width="100%">
			</div>
		</section>
	<!-- 예약현황 리스트 -->	
		<section>
			<span class="title1 mt-5 mb-5" style="margin-left: 120px;">예약 현황</span>
				<div class=".table-responsive container " style="margin-left: 100px;" >
					<div id="bookList"  style="min-height:600px; justify-content: space-between;align-items: center;" class="d-flex flex-column ">
						<!-- 데이터 들어오는 곳 -->
					</div>
					<hr width="100%">
				</div>
		</section>		
	<!-- 후기 리스트 -->	
		<section>
			<span class="title1 mt-5 mb-5" style="margin-left: 120px;">후기</span>
				<div class=".table-responsive container " style="margin-left: 100px;" >
					<div id="reviewList" style="min-height:500px; justify-content: space-between;align-items: center;" class="d-flex flex-column">
						<!-- 데이터 들어오는 곳 -->
					</div>
					<hr width="100%">
				</div>
		</section>	

	</main>

	<footer id="footer"></footer>
	
	

	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script>
			<!-- 예약 승인 및 거절 -->
		var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
			  keyboard: false
			})
		
		/* 거절  */
		function rejectSubmit(idx){
			
			if($("#message-text").val().length > 300){
				alert("300자 이내로 작성해 주십시오.");		
				return;
			}else{
				//console.log(idx);
				const fm = $("#frm");
				
				$("#bidx").val(idx);
				$("#frm").attr('action','reportReject.do').submit();
				myModal.hide();
				$("#approvalN"+idx).html("승인 거절");
			}
		}
		
		
		/* 승인  */
		function approval(idx){

			if($("#approvalN"+idx).html() == '승인 완료' || $("#approvalY"+idx).html() == '승인 완료' ){
				alert("이미 승인된 요청입니다.");
			
			}else if($("#approvalR"+idx).html() == '승인 거절'){
				alert("이미 거절처리된 요청입니다. 거절된 요청은 재승인이 불가능합니다.");
				
			}else{
				
				if(confirm("승인하시겠습니까? 승인 완료 후 예약을 취소 할 수 없습니다.")){
				
					$.ajax({
					url: "<%=request.getContextPath()%>/ajax/approval.do", 
					type: "GET",
					data: "bidx="+idx,
					success: function(){
						alert("승인되었습니다.")
						$("#approvalN"+idx).html("승인 완료");
					}
				});
				
				}else{
					
					console.log("승인 거절");
					if(confirm("예약을 거절하시겠습니까? 창을 닫으시려면 취소를 눌러주세요.")){
						
						myModal.show();
						console.log("거절 모달");
						
						$("#savebtn").click(function(){
							rejectSubmit(idx);
						}) 
					}
				}
			}
		}
		
		/* 취소 (창 닫기) */
		function reject (){
			myModal.hide();
		}
	
	</script>	


</body>
</html>