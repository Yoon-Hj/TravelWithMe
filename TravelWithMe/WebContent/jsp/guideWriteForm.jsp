<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel With Me</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/font.css">
<link rel="stylesheet" type="text/css" href="css/writeForm.css?v=<%=System.currentTimeMillis() %>">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" src="js/writeForm.js?v=<%=System.currentTimeMillis() %>"></script>

</head>
<body>
<jsp:include page="header.jsp"/>
<br><br><br>

<div class="container">
<div class="writeFormDiv">
	<table>
		<tr>
			<td><button class="writeFormBtn" onclick="openBasicInfo()" id="basicBtn">기본정보</button></td>
			<td><button class="writeFormBtn" onclick="openDetailInfo()" id="detailBtn">세부사항</button></td>
			<td><button class="writeFormBtn" onclick="openPreview()" id="previewBtn">미리보기</button></td>
		</tr>
	</table>
</div>

<br><br><br>

<div id="basicInfo" style="font-family: 함초롬돋움">
	<h3>
		&nbsp;&nbsp;기본정보
		<a style="color : #b3b3b3; font-size: 15px;">&nbsp;투어의 기본정보를 작성하세요(필수)</a>
	</h3>
	
	<br>
	
	<table>
		<tr>
			<td class="InfoTd">제목</td>
			<td><input type="text" class="form-control" style="width: 600px" name="btitle"></td>
		</tr>
		<tr>
			<td class="InfoTd">날짜</td>
			<td>
				<a style="color: #b3b3b3; font-size: 15px;">시작날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종료날짜</a><br>
				<input type="date" name="gstartdate" id="gstartdate" max="2030-12-31" class="NoBootStrap">
				~
				<input type="date" name="gfinishdate" id="gfinishdate" max = "2030-12-31" class="NoBootStrap">
				<br>
				<a style="color: #b3b3b3; font-size: 15px;">※가이드 투어는 최대 3일까지 등록 가능합니다.</a>
			</td>
		</tr>
		<tr>
			<td class="InfoTd">모집 마감날짜</td>
			<td>
				<input type="date" name="genddate" id="genddate" class="form-control" style="width: 200px">
				<a style="color: #b3b3b3; font-size: 15px;">※모집 마감날짜를 작성하지 않으면 여행 출발 1일전에 여행모집 자동마감합니다.</a>
			</td>
		</tr>
		<tr>
			<td class="InfoTd">출발장소 및 시간</td>
			<td>
				<input type="text" style="width:390px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; ">
				<input type="time" class="NoBootStrap" id="departtime">
			</td>
		</tr>
		<tr>
			<td class="InfoTd">지역</td>
			<td>
				<select name="garea" class="custom-select" style="width: 185px;">
				  <option value="서울특별시">서울특별시</option>
				  <option value="경기도">경기도</option>
				  <option value="강원도">강원도</option>
				  <option value="충청남도">충청남도</option>
				  <option value="충청북도">충청북도</option>
				  <option value="전라북도">전라북도</option>
				  <option value="전라남도">전라남도</option>
				  <option value="경상북도">경상북도</option>
				  <option value="경상남도">경상남도</option>
				  <option value="제주도">제주도</option> 				  
				</select>
				<input type="text" style="width:405px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; ">
			</td>
		</tr>
		<tr>
			<td class="InfoTd">인원</td>
			<td><input type="number" min="1" value="1" style="width:100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; ">명</td>
		</tr>
	</table>
	
	<br>
	
	<h3>
		&nbsp;&nbsp;주요정책
		<a style="color: #b3b3b3; font-size: 15px;">&nbsp;여행의 주요 정책을 선택하고 본인의 의사에 맞게 정책을 작성하세요(필수)</a>
	</h3>
	
	<br>
	
	<table>
		<tr>
			<td class="InfoTd">주요 정책</td>
			<td>
				<input type="checkbox" name="pcode" value="1">
				1. 공지된 미팅장소 및 시간에 모인 인원과 가이드 투어를 진행하며<br> 특별한 제제사항은 없습니다.<br><br>
				<input type="checkbox" name="pcode" value="2">
				2. 여행 시작일 기준 <input type="number" min="0" style="width:50px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">일
				전까지 연락이 되지 않는 분은<br> 작성자 임의로 신청거절을 진행할 수 있습니다.<br><br>
				<input type="checkbox" name="pcode" value="3">
				3. 신뢰지수 <input type="number" max="100" min="0" style="width:70px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">점
				이하의 회원은 작성자 임의로 신청거절을 진행할 수 있습니다.<br>
				<a style="color: #b3b3b3; font-size: 15px;">※2번,3번 중복선택 가능</a>
			</td>
		</tr>
	</table>
	
	<a class="nextA" id="basicTodetail" onclick="openDetailInfo()">Next &raquo;</a>
</div>
<div id="detailInfo" style="font-family: 함초롬돋움">
	<h3>
		&nbsp;&nbsp;테마
		<a style="color: #b3b3b3; font-size: 15px;">&nbsp;투어의 테마를 최대 3가지 작성하세요(선택)</a>
	</h3>
	
	<br>
	
	<table>
		<tr>
			<td class="InfoTd">테마</td>
			<td>
				<input type="text" class="NoBootStrap" id="gthema">
			</td>
		</tr>
	</table>
	
	<br>
	
	<h3>
		&nbsp;&nbsp;세부일정
		<a style="color: #b3b3b3; font-size: 15px;">&nbsp;투어의 세부일정을 작성하세요(필수)</a>
	</h3>
	
	<br>
	
	<table id="day">
		<thead>
			<tr>
				<td><a style="color: #b3b3b3; font-size: 15px;">&nbsp;&nbsp;Day</a></td>
				<td><a style="color: #b3b3b3; font-size: 15px;">시간</a></td>
				<td><a style="color: #b3b3b3; font-size: 15px;">투어내용(10글자제한)</a></td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	<br>
	<h3>
		&nbsp;&nbsp;투어소개
		<a style="color: #b3b3b3; font-size: 15px;">&nbsp;투어에 대한 소개를 자유롭게 작성하세요(선택)</a>
	</h3>
	
	<br>
	
	<table>
		<tr>
			<td class="InfoTd">내용</td>
			<td>
				<textarea rows="15px" cols="80px" class="form-control"></textarea>
			</td>
		</tr>
	</table>
	
	<br>
	
	<h3>
		&nbsp;&nbsp;사진첨부
		<a style="color: #b3b3b3; font-size: 15px;">&nbsp;투어를 표현할 사진을 자유롭게 첨부하세요(최대 10장)(선택)</a>
	</h3>
	
	<br>
	
	<table>
		<tr>
			<td class="InfoTd">첨부</td>
			<td>
				<input type="file" multiple="multiple">
			</td>
		</tr>
	</table>
	
	<a class="previousA" onclick="openBasicInfo()">&laquo; Previous</a>
	<a class="nextA" onclick="openPreview()">Next &raquo;</a>
</div>
<div id="preview" style="font-family: 함초롬돋움">
	<table>
		<tr>
			<td class="InfoTd">작성자</td>
			<td></td>
		</tr>
		<tr>
			<td class="InfoTd">제목</td>
			<td></td>	
		</tr>
		<tr>
			<td class="InfoTd">사진</td>
			<td></td>
		</tr>
		<tr>
			<td class="InfoTd">날짜</td>
			<td></td>
		</tr>
		<tr>
			<td class="InfoTd">모집 마감날짜</td>
			<td></td>
		</tr>
		<tr>
			<td class="InfoTd">출발장소 및 시간</td>
			<td></td>
		</tr>
		<tr>
			<td class="InfoTd">지역</td>
			<td></td>
		</tr>
		<tr>
			<td class="InfoTd">인원</td>
			<td></td>
		</tr>
		<tr>
			<td class="InfoTd">테마</td>
			<td></td>
		</tr>
		<tr>
			<td class="InfoTd">투어소개</td>
			<td></td>
		</tr>
		<tr>
			<td class="InfoTd">세부일정</td>
			<td></td>
		</tr>
		<tr>
			<td class="InfoTd">주요 정책</td>
			<td></td>
		</tr>
	</table>

	<a class="previousA" onclick="openDetailInfo()">&laquo; 이전</a>
	<a class="nextA" onclick="">완료</a>
</div>
</div>
</body>
</html>