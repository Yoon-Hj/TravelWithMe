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
<link rel="stylesheet" type="text/css" href="css/writeForm.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" src="js/writeForm.js?v=<%=System.currentTimeMillis() %>"></script>

</head>
<body>
<jsp:include page="header.jsp"/>
<br><br><br>
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
		<a style="color: #b3b3b3; font-size: 15px;">&nbsp;투어의 기본정보를 작성하세요</a>
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
				<input type="date" name="gstartdate" id="gstartdate" min="2019-01-01" max="2030-12-31" style="width: 200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">
				~
				<input type="date" name="gfinishdate" id="gfinishdate" min="2019-01-01" max = "2030-12-31" style="width: 200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">
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
				<input type="time" style="width:205px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">
			</td>
		</tr>
		<tr>
			<td class="InfoTd">지역</td>
			<td>
				<input type="dr" style="width:390px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; ">
				<input type="time" style="width:205px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">
			</td>
		</tr>
		<tr>
			<td class="InfoTd">인원</td>
			<td><input type="text" class="form-control" style="width: 600px"></td>
		</tr>
	</table>
</div>
<div id="detailInfo">
	다른내용다른내용
</div>
<div id="preview">
	또다른내용또다른내용
</div>

</body>
</html>