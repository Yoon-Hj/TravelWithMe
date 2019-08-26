<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font.css">
<link rel="stylesheet" type="text/css" href="css/boardList.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="js/boardList.js?v=<%=System.currentTimeMillis() %>"></script>
<title>Travel With Me</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#writetip").click(function(){
		var user = <%=(String)session.getAttribute("user")%>;
		if(user == null) alert("로그인 후 사용가능한 서비스입니다.");
	});
});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 style="font-family: '함초롬돋움'; clear: both; margin-left: 30px; cursor: pointer;" onclick="location.href='accomBoardList.do'">Travel With Me</h1>
	<hr>
	
	<div class="container">
	
		<a href="accomWriteForm.do" id="writetip" data-toggle="tooltip" data-placement="bottom" title="글 작성하기" 
			style="text-decoration: none; color: #787878; font-family: '함초롬돋움';">
			원하는 동행글이 없으신가요? 직접 동행글을 작성해보세요.</a>
		<br><br>

		<div class="card" style="font-family: '함초롬돋움';">
			 <form action="accomBoardList.do">
			 <table style="border: none;">
			 <tr>
			 	<td>
				 	<select name="type" class="custom-select" style="width: 130px">
				 	<option value="1" selected="selected">제목</option>
						<option value="2">내용</option>
						<option value="3">제목+내용</option>
						<option value="4">작성자(아이디)</option>
						<option value="5">지역</option>
					</select>
					<input type="hidden" id='hiddenType' value='${type}'>
				</td>
				<td><input type="text" class="form-control" name="keyword" value='${keyword}' style="width: 600px"></td>
			 </tr>
			 <tr>
			 	<td style="text-align: center">여행날짜</td>
			 	<td width="700px">
			 		<input type="date" name="sdate" value="${startdate}" max="2030-12-31" min="2019-01-01" 
			 				style="width: 250px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">&nbsp; ~ &nbsp;
					<input type="date" name="fdate" value="${finishdate}" max="2030-12-31" min="2019-01-01"
							style="width: 250px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">
				</td>
				<td colspan="3" width=130px; style="margint-left: 20px; margin-top: 150px"><button type="submit" class="btn" style="background-color: #B5C3C8; color: white; width: 140px; height: 40px;">SEARCH&nbsp;&nbsp;<i class="fa fa-search"></i></button></td>
			</tr>
			<tr>
				<td style="text-align: center">여행취향</td>
				<td>
					<input type="hidden" id='hiddenlikecode' value='${likecode}'>
					<select name="like" class="custom-select" style="width: 130px">
						<c:forEach var="like" items="${likeList}" varStatus="status">
							<option value="${like.likecode}" >${like.likename}</option>	
						</c:forEach>
					</select>
				</td>
			</tr>
			</table>
			</form>
		</div>
		
		<!-- 추천 4개 조회 -->
		<div style="margin-top: 50px">
		<h4 style="font-family: '함초롬돋움'; margin-bottom: 15px;">추천여행</h4>
		
			<div class="row">
			<c:if test="${fn:length(recommList)==0}">
				<h5 style="font-family: '함초롬돋움'; margin-bottom: 15px; margin: auto">
					오늘의 추천 여행이 존재하지 않습니다. 직접 동행여행을 계획해보세요.
				</h5>
			</c:if>
			<c:forEach var="b" items="${recommList}" varStatus="status">
			  <div class="column">
				<a href="readBoard.do?bnum=${b.bnum}&bkind=A"><img style="width:100%; height: 100%;"></a>
				<div class="content">
					<p class="iarea"><fmt:formatDate value="${b.astartdate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${b.afinishdate}" pattern="yyyy-MM-dd"/>
					<br><input type="hidden" value="${b.aarea}">[${b.aarea}] ${b.btitle}<br>${b.mid} &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp; ${b.breadcount}</p>
				</div>
			  </div>
			</c:forEach>
			</div>
			
		</div>
		
		<!-- 전체 리스트 조회 -->
		<div style="margin-top: 60px">
		<h4 style="font-family: '함초롬돋움'; margin-bottom: 15px;">전체여행</h4>
		
			<div class="row">
			<c:if test="${fn:length(boardList)==0}">
				<h5 style="font-family: '함초롬돋움'; margin-bottom: 15px; margin: auto">
					검색결과가 존재하지 않습니다.
				</h5>
			</c:if>
			<c:forEach var="a" items="${boardList}" varStatus="status">
			  <div class="column" style="margin-bottom: 12px;">
				<a href="readBoard.do?bnum=${a.bnum}&bkind=A"><img style="width:100%; height: 100%;"></a>
				<div class="content">
					<p class="iarea"><fmt:formatDate value="${a.astartdate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${a.afinishdate}" pattern="yyyy-MM-dd"/>
					<br><input type="hidden" value="${a.aarea}">[${a.aarea}] ${a.btitle}<br>${a.mid} &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp; ${a.breadcount}</p>
				</div>
			  </div>
			</c:forEach>
			</div>
			
		</div>
	</div>

	<div class="pagination" style="margin-top: 25px; margin-left: 400px; text-align: center;">
		<c:if test="${ start != 1}">
			<a href="accomBoardList.do?page=1">&laquo;</a>
			<a href="accomBoardList.do?page=${start-1}">&#8249;</a> 
		</c:if>
		
		<c:forEach var="i" begin="${ start }" end="${ end }" varStatus="status">
			<c:choose>
				<c:when test="${ current == status.index }">
					<a class="active">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="accomBoardList.do?page=${i}<c:if test="${keyword != null }">&keyword=${keyword}&type=${type}</c:if><c:if test='${startdate!=null}'>&sdate=${startdate}</c:if><c:if test='${finishdate!=null}'>&fdate=${finishdate}</c:if><c:if test='${likecode!=null}'>&like=${likecode }</c:if>" style="font-size: 17px"> ${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			
		<c:if test="${ end != last }">
			<a href="accomBoardList.do?page=${end+1}">&#8250;</a> 
			<a href="accomBoardList.do?page=${last}">&raquo;</a>
		</c:if>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>