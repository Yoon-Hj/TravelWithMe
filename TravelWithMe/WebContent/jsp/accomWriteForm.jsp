<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	<h1 style="font-family: '함초롬돋움'; clear: both; margin-left: 30px;">Travel With Me</h1>
	<hr>
	<div class="container">
		<div class="writeFormDiv">
			<table>
				<tr>
					<td><p class="writeFormBtn" id="basicBtn">기본정보</p></td>
					<td><p class="writeFormBtn" id="detailBtn">세부사항</p></td>
					<td><p class="writeFormBtn" id="previewBtn">미리보기</p></td>
				</tr>
			</table>
		</div>

		<br><br>

		<div id="basicInfo" style="font-family: 함초롬돋움">
			<h3>
				&nbsp;&nbsp;기본정보
				<a style="color : #b3b3b3; font-size: 15px;">&nbsp;투어의 기본정보를 작성하세요(필수)</a>
			</h3>
			<br>
			
			<table>
				<tr>
					<td class="InfoTd">제목</td>
					<td><input type="text" id="btitle" name="btitle" class="form-control" style="width: 600px"></td>
				</tr>
				<tr>
					<td class="InfoTd">날짜</td>
					<td>
						<a style="color: #b3b3b3; font-size: 15px;">시작날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종료날짜</a><br>
						<input type="date" name="astartdate" id="startdate" max="2030-12-31" class="NoBootStrap">
						~
						<input type="date" name="afinishdate" id="finishdate" max = "2030-12-31" class="NoBootStrap">
						<br>
					</td>
				</tr>
				<tr>
					<td class="InfoTd">출발장소 및 시간</td>
					<td>
						<input type="text" id="departplace" name="adepartplace" style="width:390px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; ">
						<input type="time" class="NoBootStrap" id="gdeparttime" name="adeparttime">
					</td>
				</tr>
				<tr>
					<td class="InfoTd">지역</td>
					<td>
						<select id="garea1" name="aarea1" class="custom-select" style="width: 185px;">
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
						<input type="text" id="garea2" name="aarea2" style="width:405px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; ">
					</td>
				</tr>
				<tr>
					<td class="InfoTd">모집인원</td>
					<td>
					<input id="gnop" name="anop" type="number" min="0" value="0" style="width:100px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; ">명
					<br>
					<a style="color: #b3b3b3; font-size: 15px;">※모집인원이 0명일 경우, 모집인원 무관으로 대체됩니다.</a>
					</td>
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
					<td class="InfoTd">주요정책</td>
					<td>
						<input type="checkbox" id="pcode1" name="pcode" value="1">
						1. 공지된 미팅장소 및 시간에 모인 인원과 가이드 투어를 진행하며<br> 특별한 제제사항은 없습니다.<br><br>
						<input type="checkbox" id="pcode2" name="pcode" value="2">
						2. 여행 시작일 기준 <input id="pvalue2" name="pvalue" type="number" min="0" style="width:60px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">일
						전까지 연락이 되지 않는 분은<br> 작성자 임의로 신청거절을 진행할 수 있습니다.<br><br>
						<input type="checkbox" id="pcode3" name="pcode" value="3">
						3. 신뢰지수 <input id="pvalue3" name="pvalue" type="number" max="100" min="0" style="width:70px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">점
						이하의 회원은 작성자 임의로 신청거절을 진행할 수 있습니다.<br>
						<a style="color: #b3b3b3; font-size: 15px;">※2번,3번 중복선택 가능</a>
					</td>
				</tr>
			</table>
			
			<a class="nextA" id="basicTodetail">Next &raquo;</a>
		</div>
		
		<div id="detailInfo" style="font-family: 함초롬돋움">
			
			<h3>
				&nbsp;&nbsp;여행취향
				<a style="color: #b3b3b3; font-size: 15px;">&nbsp;주요 여행테마와 선호하는 이동수단을 선택하세요(필수)</a>
			</h3>
			
			<br>
			<table>
				<tr>
					<td class="InfoTd">1. 여행테마</td>
					<td>
						<c:forEach var="like" items="${likeList}" varStatus="status">
							<input type="radio" name="like" value="${like.likecode}">&nbsp;<label for="${like.likecode}">${like.likename}</label> &nbsp;&nbsp;&nbsp;
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td class="InfoTd">2. 선호 이동수단</td>
					<td>
						<input type="radio" name="transport" value="도보">&nbsp; 도보 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="transport" value="대중교통">&nbsp; 대중교통 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="transport" value="택시">&nbsp; 택시 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			
			<br>
		
			<h3>
				&nbsp;&nbsp;필수여행지
				<a style="color: #b3b3b3; font-size: 15px;">&nbsp;본인이 꼭 가고 싶은 여행지를 최대 3가지 작성하세요(선택)</a>
			</h3>
			
			<br>
			
			<table>
				<tr>
					<td class="InfoTd">필수여행지</td>
					<td>
						<input type="text" class="NoBootStrap" name="acourse" id="gthema"><br>
						<a style="color: #b3b3b3; font-size: 15px;">※여행지 추가를 원하시면 여행지 작성 후 Enter 또는 Tab을 눌러주세요</a><br>
						<a style="color: #b3b3b3; font-size: 15px;">※여행지 삭제를 원하시면 작성된 여행지를 클릭하세요</a>
					</td>
				</tr>
			</table>
			
			<br>
			
			<h3>
				&nbsp;&nbsp;내용
				<a style="color: #b3b3b3; font-size: 15px;">&nbsp;하고 싶은 말을 자유롭게 작성하세요(선택)</a>
			</h3>
			
			<br>
			
			<table>
				<tr>
					<td class="InfoTd">내용</td>
					<td>
						<textarea rows="15px" id="bcontent" name="bcontent" cols="80px" class="form-control"></textarea>
					</td>
				</tr>
			</table>
			
			<br>
			
			<a class="previousA" id="detailToBasicA">&laquo; Previous</a>
			<a class="nextA" id="AdetailToPreview">Next &raquo;</a>
		</div>
		
		<div id="preview" style="font-family: 함초롬돋움">
		
			<h3>
				&nbsp;&nbsp;작성글 미리보기
			</h3>
			<br>
			<table id="previewTable" style="font-family: 함초롬돋움;">
				<tr>
					<td class="InfoTd">작성자</td>
					<td><%=(String)session.getAttribute("user")%></td>
				</tr>
				<tr>
					<td class="InfoTd">제목</td>
					<td></td>	
				</tr>
				
				<tr>
					<td class="InfoTd">날짜</td>
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
					<td class="InfoTd">여행취향</td>
					<td></td>
				</tr>
				<tr>
					<td class="InfoTd">필수여행지</td>
					<td></td>
				</tr>
				<tr>
					<td class="InfoTd">투어소개</td>
					<td></td>
				</tr>
				<tr>
					<td class="InfoTd">주요정책</td>
					<td></td>
				</tr>
			</table>
		
			<a class="previousA" id="previewToDetail">&laquo; Previous</a>
			<a class="nextA" id="submit">Submit</a>
		</div>
</div>
</body>
</html>