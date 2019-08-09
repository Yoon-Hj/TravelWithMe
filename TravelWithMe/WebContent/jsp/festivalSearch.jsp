<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<h1>아버지! 날 보고있다면 정답을 알려줘</h1><HR>
<form action="festivalSearch.do">
<input type="date" name="eventStartDate" id="sDate" value="${eventStartDate }" required>
<input type="date" name="eventEndDate" id="eDate" value="${eventEndDate }">
<select name="area" id="area">
	<option value="" <c:if test="${area == ''}">selected</c:if>>선택</option>
	<option value="1" <c:if test="${area == 1}">selected</c:if>>서울</option>
	<option value="2" <c:if test="${area == 2}">selected</c:if>>인천</option>
	<option value="3" <c:if test="${area == 3}">selected</c:if>>대전</option>
	<option value="4" <c:if test="${area == 4}">selected</c:if>>대구</option>
	<option value="5" <c:if test="${area == 5}">selected</c:if>>광주</option>
	<option value="6" <c:if test="${area == 6}">selected</c:if>>부산</option>
	<option value="7" <c:if test="${area == 7}">selected</c:if>>울산</option>
	<option value="31" <c:if test="${area == 31}">selected</c:if>>경기도</option>
	<option value="32" <c:if test="${area == 32}">selected</c:if>>강원도</option>
	<option value="33" <c:if test="${area == 33}">selected</c:if>>충청북도</option>
	<option value="34" <c:if test="${area == 34}">selected</c:if>>충청남도</option>
	<option value="35" <c:if test="${area == 35}">selected</c:if>>경상북도</option>
	<option value="36" <c:if test="${area == 36}">selected</c:if>>경상남도</option>
	<option value="37" <c:if test="${area == 37}">selected</c:if>>전라북도</option>
	<option value="38" <c:if test="${area == 38}">selected</c:if>>전라남도</option>
	<option value="39" <c:if test="${area == 39}">selected</c:if>>제주도</option>
</select>
<input type="submit" value="검색">
</form>



<table>
<tr>
<c:forEach var="i" items="${ilist }" varStatus="s">
	<c:choose>
		<c:when test="${s.count % 4 == 0 }">
		<td>
			<table>
				<tr>
					<td><image src="${i.firstimage }" style="width:100px; height:100px"
					onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/></td>
				</tr>
				<tr>
					<td><p>${i.title }</p></td>
				</tr>
			</table>
			</tr>		
		</td>
		</c:when>
		<c:when test="${s.count  == 5 }">
		<tr>		
		<td>
			<table>
				<tr>
					<td><image src="${i.firstimage }" style="width:100px; height:100px"
					onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/></td>
				</tr>
				<tr>
					<td><p>${i.title }</p></td>
				</tr>
			</table>
		</td>
		</c:when>
		<c:otherwise>
		<td>
			<table>
				<tr>
					<td><image src="${i.firstimage }" style="width:100px; height:100px"
					onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/></td>
				</tr>
				<tr>
					<td><p>${i.title }</p></td>
				</tr>
			</table>
		</td>
		</c:otherwise>
	</c:choose>
</c:forEach>
</tr>
</table>
<c:if test="${startpage != 1 }">
	<button class="PageNavi2" value="1">처음</button>
	<button class="PageNavi2" value="${startpage - 1}">이전</button>
</c:if>

<c:forEach var="i" begin="${startpage }" end="${endpage }">
	<c:choose>
		<c:when test="${pageNo == i }">
			<a style="color:red">${i }</a>
		</c:when>
		<c:otherwise>
			<button class="PageNavi2" value="${i}">${i }</button>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${endpage < lastpage }">
	<button class="PageNavi2" value="${endpage + 1}">다음</button>
	<button class="PageNavi2" value="${lastpage}">마지막</button>
</c:if>


<h1>시작페이지 : ${startpage }</h1>
<h1>끝페이지 : ${endpage }</h1>
<h1>마지막 페이지 : ${lastpage }</h1>
<h1>현재 페이지 : ${pageNo }</h1>



</body>
</html>