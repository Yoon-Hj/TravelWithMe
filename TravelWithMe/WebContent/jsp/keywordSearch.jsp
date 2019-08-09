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
<form action="apiKeywordSearch.do">
<input type="text" name="keyword" id="keyword"
value="<c:if test="${keyword != null}">${keyword}</c:if>" required>
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
	<button class="PageNavi1" value="1">처음</button>
	<button class="PageNavi1" value="${startpage - 1}">이전</button>
</c:if>

<c:forEach var="i" begin="${startpage }" end="${endpage }">
	<c:choose>
		<c:when test="${pageNo == i }">
			<a style="color:red">${i }</a>
		</c:when>
		<c:otherwise>
			<button class="PageNavi1" value="${i}">${i }</button>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${endpage < lastpage }">
	<button class="PageNavi1" value="${endpage + 1}">다음</button>
	<button class="PageNavi1" value="${lastpage}">마지막</button>
</c:if>


<h1>시작페이지 : ${startpage }</h1>
<h1>끝페이지 : ${endpage }</h1>
<h1>마지막 페이지 : ${lastpage }</h1>
<h1>현재 페이지 : ${pageNo }</h1>



</body>
</html>