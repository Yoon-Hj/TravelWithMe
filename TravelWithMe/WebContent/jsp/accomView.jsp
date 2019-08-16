<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 style="font-family: 함초롬돋움; margin-left: 30px">Travel With Me</h1>
	<hr>
	
	<div class="container">
	
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
			<input type="button" class="btn default" value="신청" style="border: 2px solid #B5C3C8;"></p>
		</div>

		<div style="margin-top: 20px; margin-left: 110px;">
			<form class="comment">
				<input type="text" class="form-control" placeholder="댓글을 입력하세요." style="width: 830px">
				<button type="submit" class="cBtn">댓글작성</button>
			</form>
		</div>
		
	</div>	
</body>
</html>