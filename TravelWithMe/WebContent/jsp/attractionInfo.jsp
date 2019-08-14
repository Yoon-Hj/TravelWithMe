<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js">
</script>
<script src="js/attraction.js?v=<%=System.currentTimeMillis() %>"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1>ATTRACTION INFO</h1><hr>
<h3>키워드 검색</h3>
<form action="apiKeywordSearch.do">
<input type="text" name="keyword" required>
<input type="submit" value="검색">
</form>

<hr>
<h3>축제 검색</h3>
<form action="festivalSearch.do">
<input type="date" name="eventStartDate" required>
<input type="date" name="eventEndDate">
<select name="area">
	<option value="">선택</option>
	<option value="1">서울</option>
	<option value="2">인천</option>
	<option value="3">대전</option>
	<option value="4">대구</option>
	<option value="5">광주</option>
	<option value="6">부산</option>
	<option value="7">울산</option>
	<option value="31">경기도</option>
	<option value="32">강원도</option>
	<option value="33">충청북도</option>
	<option value="34">충청남도</option>
	<option value="35">경상북도</option>
	<option value="36">경상남도</option>
	<option value="37">전라북도</option>
	<option value="38">전라남도</option>
	<option value="39">제주도</option>
</select>
<input type="submit" value="검색">
</form>

<hr>
<h3>지역 검색</h3>

<button class="areaBtn" value="1">서울</button>
<button class="areaBtn" value="31">경기도</button>
<button class="areaBtn" value="32">강원도</button>
<button class="areaBtn" value="33">충청북도</button>
<button class="areaBtn" value="34">충청남도</button><BR>
<button class="areaBtn" value="37">전라북도</button>
<button class="areaBtn" value="38">전라남도</button>
<button class="areaBtn" value="35">경상북도</button>
<button class="areaBtn" value="36">경상남도</button>
<button class="areaBtn" value="39">제주도</button>

</body>
</html>