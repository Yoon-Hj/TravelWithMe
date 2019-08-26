<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel With Me</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
h1{
	font-family: '함초롬돋움'; 
	clear: both; 
	margin-left: 30px; 
}
h2{
	font-family: '함초롬돋움'; 
	clear: both; 
	margin : auto;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	if($("#Atable").find("tr:last").html()==$("#A").html()){
		$("#A").remove();
		$("#Atable").after("검색한 게시글 결과가 존재하지 않습니다.");
	}
	if($("#Gtable").find("tr:last").html()==$("#G").html()){
		$("#G").remove();
		$("#Gtable").after("검색한 게시글 결과가 존재하지 않습니다.");
	}
});
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1>Travel With Me</h1>
<hr>
<table id="Atable">
	<tr id='A'>
		<th>제목</th>
		<th>작성자</th>
		<th>작성날짜</th>
		<th>조회수</th>
	</tr>

	<c:forEach var='b' items="${boardList}">
		<c:if test="${b.BKIND=='A'}">
			<tr onclick="location.href='readBoard.do?bnum=${b.BNUM}&bkind=${b.BKIND}'">
				<td>${b.BTITLE}</td>
				<td>${b.MID}</td>
				<td>${b.BWRITEDATE}</td>
				<td>${b.BREADCOUNT}</td>
			</tr>
		</c:if>
	</c:forEach>
</table>
<h1>Travel With Guide</h1>
<hr>
<table id="Gtable">
	<tr id='G'>
		<th>제목</th>
		<th>작성자</th>
		<th>작성날짜</th>
		<th>조회수</th>
	</tr>
	<c:forEach var='b' items="${boardList}">
		<c:if test="${b.BKIND=='G'}">
			<tr onclick="location.href='readBoard.do?bnum=${b.BNUM}&bkind=${b.BKIND}'">
				<td>${b.BTITLE}</td>
				<td>${b.MID}</td>
				<td>${b.BWRITEDATE}</td>
				<td>${b.BREADCOUNT}</td>
			</tr>
		</c:if>
	</c:forEach>
</table>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>