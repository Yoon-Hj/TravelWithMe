<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  
</style>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$('.selectnop').hide();
		$('#warningModal2').show();

	//session의 id가 registerList에 있으면 하단에 신청 취소 버튼 표시 
	
	//댓글 삭제여부가 1이면, '해당 댓글은 삭제되었습니다.'(text) 로 대체
	
	//모집인원(anumofpeople) - 신청인원(registerNum) 계산해서, 현재 신청가능 인원 수에 표시
	//모집인원이 0(무관)이면, 계산하지 않고 무관으로 출력
	
	//session의 id와 댓글 작성자의 id가 일치하면, 댓글삭제 버튼 표시
	
	//session에 id가 있으면, 댓글 입력 폼 + 작성버튼 표시
    //id가 없으면, 댓글 폼에 placeholder="댓글을 작성하려면 로그인 해주세요"(disabled) 
    //작성 버튼은 표시x, 답글작성 버튼도 표시x
	
	//신청인원이 0이 아닐 때, 수정 버튼 누르면 alert 표시
	}
</script>

	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 style="font-family: 함초롬돋움; margin-left: 30px">Travel With Me</h1>
	<hr>
	
	<div class="container">
	
		<c:if test="${user}==">
			<div style="margin-bottom: 10px;">
				<input type="button" class="btn default" value="modify" style="border: 2px solid #B5C3C8;">
				<input type="button" class="btn default" value="delete" style="border: 2px solid #B5C3C8;">
			</div>
		</c:if>
	
		<div class="card" style="font-family: '함초롬돋움';">
			<table class="viewCard"; style="border: none;">
				<tr>
					<th>작성자</th>
					<td>test1</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>동행구해요~</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>2019.0713 ~ 2019.07.15</td>
				</tr>
				<tr>
					<th>출발장소 및 시간</th>
					<td>서울역 10:00</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>경상남도 부산</td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td>5명</td>
				</tr>
				<tr>
					<th>취향</th>
					<td><b>1.여행테마</b> &nbsp; 쇼핑 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>2.선호 이동수단</b> &nbsp; 도보</td>
				</tr>
				<tr>
					<th>필수여행지</th>
					<td>해운대</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>즐겁게 여행 다녀올 동행자 구해요!</td>
				</tr>
				<tr>
					<th>주요정책</th>
					<td>여행 시작일 기준 <b style="color:#CD1039">1일전까지 연락이 되지 않는 분</b>은 작성자 임의로 신청취소를 진행할 수 있습니다.<br>
						<b style="color:#CD1039">신뢰지수 50점 이하</b>의 회원은 작성자 임의로 신청취소를 진행할 수 있습니다.</td>
				</tr>
			</table>
		</div>
		
		<div style="display: flex; margin-top: 10px; margin-left: 110px; font-family: '배달의민족 주아'">
			<p><input type="button" class="btn default" value="목록으로" style="border: 2px solid #B5C3C8;"></p>
			<p style="float: right; margin-left: 630px;">현재 신청 가능 인원 수 3명 &nbsp;&nbsp;
			<input type="button" class="btn default" value="신청" data-toggle="modal" data-target="#warningModal1" style="border: 2px solid #B5C3C8;"></p>
			<!-- 작성자면 신청->신청관리 버튼 뜨도록 -->
		</div>

		<div style="margin-top: 20px; margin-left: 110px;">
			<form class="comment">
				<input type="text" class="form-control" placeholder="댓글을 입력하세요." style="width: 830px">
				<button type="submit">댓글작성</button>
			</form>
		</div>
		
		<div style="margin-top: 20px;">
			<c:forEach var="comment" items="${commentList}" varStatus="status">
				<table>
					<tr>
						<td>${comment.mid}</td>
						<td>${comment.ccontent}</td>
						<td><button type="button">답글</button></td>
						<td><button type="button">댓글삭제</button></td>
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

 	 
</body>
</html>