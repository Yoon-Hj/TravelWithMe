<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Travel With Me</title>
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
<style type="text/css">
	table th, td{
		text-align: center;
		font-family: '나눔고딕';
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container" style="margin-top: 30px; width:75%;">
		
		<span class="badge badge-pill badge-primary" style="margin-bottom:10px; font-family: '함초롬돋움'; color: black; clear: both; margin-left: 10px; font-size: 30px; background-color: #E8D4D4;">Travel With Me</span>
		<a style="color: #b3b3b3; font-size: 15px; margin-left: 290px;">※ 제목을 클릭하면, 해당 게시물로 이동할 수 있습니다.</a>
		
		<table id="Atable" class="table">
			<thead class="thead-light">
				<tr id='A'>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='b' items="${boardList}" varStatus="status">
					<c:if test="${status.count == 1}">
						<c:set var="cnt" value="${status.index}"/>
					</c:if>
					<c:if test="${b.BKIND=='A'}">
						<c:set var="cnt" value="${cnt + 1}"/>
						<tr>
							<td>${cnt}</td>
							<td onclick="location.href='readBoard.do?bnum=${b.BNUM}&bkind=${b.BKIND}'" style="cursor: pointer;">${b.BTITLE}</td>
							<td>${b.MID}</td>
							<td><fmt:formatDate value="${b.BWRITEDATE}" pattern="yyyy-MM-dd"/></td>
							<td>${b.BREADCOUNT}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		
		<span class="badge badge-pill badge-primary" style="margin-top: 10px; margin-bottom:10px; font-family: '함초롬돋움';  color: black; clear: both; margin-left: 10px; font-size: 30px; background-color: #E8D4D4;">Travel With Guide</span>
		<a style="color: #b3b3b3; font-size: 15px; margin-left: 250px;">※ 제목을 클릭하면, 해당 게시물로 이동할 수 있습니다.</a>
		
		<table id="Gtable" class="table">
			<thead class="thead-light">
				<tr id='G'>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='b' items="${boardList}" varStatus="status">
					<c:if test="${status.count == 1}">
						<c:set var="cnt" value="${status.index}"/>
					</c:if>
					<c:if test="${b.BKIND=='G'}">
						<c:set var="cnt" value="${cnt + 1}"/>
						<tr>
							<td>${cnt}</td>
							<td onclick="location.href='readBoard.do?bnum=${b.BNUM}&bkind=${b.BKIND}'">${b.BTITLE}</td>
							<td>${b.MID}</td>
							<td><fmt:formatDate value="${b.BWRITEDATE}" pattern="yyyy-MM-dd"/></td>
							<td>${b.BREADCOUNT}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>