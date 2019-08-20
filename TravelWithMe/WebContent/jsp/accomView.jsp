<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/font.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Travel With Me</title>
<style type="text/css">

 .card {
 	  width: 950px;
 	  margin-left: 100px;
	  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	  padding-top: 16px;
	  padding-bottom: 16px;
	  padding-left: 40px;
	  padding-right: 40px;
	  text-align: left;
	  background-color: #f1f1f1;
  }
  
  .viewCard th{
  	  font-size: 17px;
  	  width: 20%;
  	  padding: 5px;
  }
  
  .viewCard td{
  	 color: #464646;
  }
  
  .btn {
	  border: 2px solid black;
	  background-color: white;
	  color: black;
	  padding: 14px;
	  font-size: 16px;
	  cursor: pointer;
  }
  
 .default:hover {
  	  background: #B5C3C8;
  }
  
  form.comment input[type=text] {
	  padding: 5px;
	  font-size: 17px;
	  border: 1px solid #ccc;
	  border-right: none;
	  float: left;
	  width: 80%;
	  background: #f1f1f1;
	  border-radius: 0px;
	  height: 35px;
  }
  
  form.comment button[type=submit] {
	  float: left;
	  width: 100px;
	  height: 35px;
	  padding: 5px;
	  background: white;
	  color: black;
	  font-size: 13px;
	  border-left: none;
	  cursor: pointer;
	  border: 1px solid #ccc;
	  border-left: none;
  }
  
  table.commtable {
  	 border-collapse: collapse;
 	 border-spacing: 0;
 	 width: 100%;
  	 border: 1px solid #ddd;
  	 font-family: '함초롬돋움';
  	 font-size: 15px;
  }
  
  table.commtable th, td{
  	 padding: 8px;
  	 text-align: left;
  }
  
  table.commtable button{
  	border:none; 
  	font-size: 13px; 
  	background: white; 
  	cursor: pointer;
  }
  
</style>
</head>
<body>

<script type="text/javascript">
	$(document).ready(function(){
		//$('.selectnop').hide();
		//$('#warningModal2').show();

	//session의 id가 registerList에 있으면 하단에 신청 취소 버튼 표시 
	

	
	//모집인원(anumofpeople) - 신청인원(registerNum) 계산해서, 현재 신청가능 인원 수에 표시
	//모집인원이 0(무관)이면, 계산하지 않고 무관으로 출력
	
	//session의 id와 댓글 작성자의 id가 일치하면, 댓글삭제 버튼 표시
	
	//session에 id가 있으면, 댓글 입력 폼 + 작성버튼 표시
    //id가 없으면, 댓글 폼에 placeholder="댓글을 작성하려면 로그인 해주세요"(disabled) 
    //작성 버튼은 표시x, 답글작성 버튼도 표시x
	
	//신청인원이 0이 아닐 때, 수정 버튼 누르면 alert 표시
		
	
		$('.replyBtn').on('click', function(){
			//if($(this).closest("tr").after().html()==""){				
				$(this).closest("tr").after("<tr><td>&#x21B3;<input type='text'></td></tr>");
			//}
		});
		
		//댓글삭제
		//댓글 삭제여부가 1이면, '해당 댓글은 삭제되었습니다.'(text) 로 대체
		$('.commDelBtn').on('click', function(){
			//클릭한 삭제버튼과 가장 가까운 <tr>을 찾은 후, 그 행의 첫번째 <td>안의 text를 불러옴
			//(삭제를 위해 보내야 할 stuid -> 첫번째 <td>안의 text값)
			var delrow = $(this).siblings("input:hidden").val();
			var tmp = $(this).parents("td");
		$.ajax({
				url : "delComment.do",
				data : {cnum : delrow},
				type : "get",
				success : function(data){
					tmp.text("해당 댓글은 삭제되었습니다.");
				}
			});
		});
	
	});

</script>

	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 style="font-family: 함초롬돋움; margin-left: 30px">Travel With Me</h1>
	<hr>
	
	<div class="container">
	
		<c:if test="${user==accomBoard.mid}">
			<div style="margin-bottom: 10px; margin-left: 850px; font-family: '배달의민족 주아';">
				<input type="button" class="btn default" value="게시글 수정" style="border: 2px solid #B5C3C8;">
				<input type="button" class="btn default" value="게시글 삭제" style="border: 2px solid #B5C3C8;">
			</div>
		</c:if>
		
		<div class="card" style="font-family: '함초롬돋움';">
			<table class="viewCard"; style="border: none;">
				<tr>
					<th>작성자</th>
					<td>${accomBoard.mid}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${accomBoard.btitle}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td><fmt:formatDate value="${accomBoard.astartdate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${accomBoard.astartdate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<th>출발장소 및 시간</th>
					<td>${accomBoard.adepartplace} ${accomBoard.adeparttime}시</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>${accomBoard.aarea}</td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td>${accomBoard.anop}명</td>
				</tr>
				<tr>
					<th>취향</th>
					<td>1. 여행테마 - ${accomBoard.likename} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. 선호 이동수단 - ${accomBoard.atransport}</td>
				</tr>
				<tr>
					<th>필수여행지</th>
					<td>${accomBoard.acourse}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${accomBoard.bcontent}</td>
				</tr>
				<tr>
					<th>주요정책</th>
					<td>
						<c:choose>
							<c:when test="${fn:length(policy) != 0}">
							<c:forEach var="p" items="${policy}" varStatus="status">
							<c:if test="${p.pcode==2}">여행 시작일 기준 <b style="color:#CD1039">${p.pvalue}일 전까지 연락이 되지 않는 분</b>은 작성자 임의로 신청취소를 진행할 수 있습니다.<br></c:if>
							<c:if test="${p.pcode==3}"><b style="color:#CD1039">신뢰지수 ${p.pvalue}점 이하</b>의 회원은 작성자 임의로 신청취소를 진행할 수 있습니다.<br></c:if>
							</c:forEach>
							</c:when>
							<c:otherwise>공지된 출발장소 및 시간에 모인 인원과 동행을 진행하며, 특별 제제사항은 없습니다.</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</div>
		
		<div style="display: flex; margin-top: 10px; margin-left: 110px; font-family: '배달의민족 주아'">
			<p><input type="button" class="btn default" value="목록으로" style="border: 2px solid #B5C3C8;" onclick="location.href='accomBoardList.do'"></p>
			<p style="float: right; margin-left: 630px;">현재 신청 가능 인원 수 3명 &nbsp;&nbsp;
			<input type="button" class="btn default" value="신청" data-toggle="modal" data-target="#warningModal1" style="border: 2px solid #B5C3C8;"></p>
			<!-- 작성자면 신청->신청관리 버튼 뜨도록 -->
		</div>

		<div style="margin-top: 20px; margin-left: 110px; margin-bottom: 20px;">
			<form class="comment">
				<input type="text" class="form-control" placeholder="댓글을 입력하세요." style="width: 830px">
				<button type="submit">댓글작성</button>
			</form>
		</div>

		<div style="margin-top:20px; margin-bottom: 20px; margin-left: 110px; width: 90%;">
			<c:forEach var="comment" items="${commentList}" varStatus="status">
				<table class="commtable">
					<tr>
						<th width="100px;" style="text-align: center;">${comment.mid}</th>
						<td>${comment.ccontent} &nbsp; 
							<input type="hidden" value="${comment.cnum}">
							<c:if test="${user==comment.mid}">
								<button class="commDelBtn">×</button>
							</c:if>
						<button style="border:none; font-size: 13px; background: white; cursor: pointer;" class="replyBtn">답글</button>
						</td>
					</tr>
				</table>
			</c:forEach>
		</div>
		 
	</div>
	
	<!-- 신청모달1 -->
	<div class="modal fade" id="warningModal1">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: 배달의민족 도현">신청시 주의해야할 주요정책</h3>
					<button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '함초롬돋움';">
		          여행 시작일 기준 <b style="color:#CD1039">1일전까지 연락이 되지 않는 분</b>은<br>
				  작성자 임의로 신청취소를 진행할 수 있습니다.<br>
				  <b style="color:#CD1039">신뢰지수 50점 이하</b>의 회원은 작성자 임의로 신청취소를 진행할 수 있습니다.<br>
		          위 사항을 숙지하고 동의하시면 동행 신청을 이어 할 수 있습니다.<br>
				  동의하시겠습니까?<br>
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		          <button type="button" class="btn btn-success" onclick="">동의</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>
 	 
 	 		        
	<!-- 신청모달2 -->
	<div class="selectnop" id="warningModal2" style="display: none;">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: 배달의민족 도현">신청 가능 인원 수 : 명</h3>
					<button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '함초롬돋움';">
		          신청 인원 수 :
		          <select name="type" class="custom-select" style="width: 130px">
				 	<option value="1" selected="selected">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
					<br>
					※ NoShow는 서로의 소중한 시간을 낭비하는 행위입니다.<br>
					서로를 존중하는 성숙한 여행인이 됩시다.
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-success" data-dismiss="modal" data-toggle="modal" data-target="#warningModal3">신청완료</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>

	<jsp:include page="footer.jsp"></jsp:include>
 	 
</body>
</html>