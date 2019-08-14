<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{
		margin:10%;
	}
	
	.row{
		grid-template-columns:auto auto auto;
	}
	
	.myInfo{
		margin-top:20px;
		margin-left:10%;
		width:500px;
		height:30%;
	}
	.myInfo > .inInfo {
		margin-bottom:0;
		margin-left:auto;
		width : 250px;
	}
	.myNews{
		margin-top:20px;
		margin-left:auto;
		margin-right:10%;
		width:500px;
		height:500px;
	}
	.myNews > .inNews{
		margin-bottom:0;
		margin-left:auto;
		width : 80px;
	}
	.myBoards{
		margin-top:20px;
		margin-left:10%;
		width:500px;
		height:400px;
	}
	.myBoards > .inBoards{
		margin-bottom:0;
		margin-left:auto;
		width : 80px;
	}
	.myRegister{
		margin-top:20px;
		margin-left:auto;
		margin-right:10%;
		width:500px;
		height:400px;
	}
	.myRegister > .inRegister{
		margin-bottom:0;
		margin-left:auto;
		width : 80px;
	}
	.news > td{
		width:200px;
		height:80px;
		font-color:red;
	}
	.myRegi{
		text-align:left;"
	}
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/mypage.js?v=<%=System.currentTimeMillis() %>"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1>MY PAGE</h1><HR>
<div class="row">


<div class="myInfo">
<h4>MY INFO</h4>
<table id="info">
	<tr>
		<th>아이디</th>
		<td>${memberInfo.mid }</td>
	</tr>
	<tr>
		<th>성명</th>
		<td>${memberInfo.mname}</td>
	</tr>
	<tr>
		<th>연락처</th>
		<td>${memberInfo.mcontact}</td>
	</tr>
<%-- 	<tr>
		<th>신뢰지수</th>
		<th>가이드 포인트</th>
	</tr>
	<tr>
		<td>${memberInfo.mpoint}</td>
		<td>
		<c:choose>
			<c:when test="${memberInfo.mguidepoint != '0'}">${memberInfo.mguidepoint}</c:when>
			<c:otherwise>아직 가이드경험이 없습니다.</c:otherwise>
		</c:choose></td>
	</tr> --%>
</table><BR>
<div class="inInfo">
<button>회원정보 수정</button>
<button>회원탈퇴</button>
</div>
</div>



<div class="myNews">
<h4>알림내역</h4>
<table class="news" style="width:300px">
<c:forEach var="n" items="${notice }">
	<tr>
		<td style="height:70px">
		<c:choose>
			<c:when test="${n.BKIND == 'A' }">[Travel with Me]</c:when>
			<c:when test="${n.BKIND == 'G' }">[Travel with Guide]</c:when>
			<c:when test="${n.BKIND == 'C' }">[Community]</c:when>
		</c:choose>
		${n.BTITLE }<BR>
		${n.NKREASON }</td>
	</tr>
</c:forEach>
</table>
<div class="inNews">
<input type="button" id="moreNews" value="더보기" data-toggle="modal" data-target="#moreNewsForm" style="background-color: transparent; border: 0px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;">
<!-- <input type="button" onclick="t()" value="더보기" data-toggle="modal" data-target="#moreNewsForm" style="background-color: transparent; border: 0px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;"> -->
<!-- <span style="font-size:15px; color: black; cursor:pointer" onclick="openNewsModal()">더보기</span> -->
<!-- <button id="moreNews">더보기</button> -->
</div>
</div>

<div class="myBoards">
<h4>내가 작성한 글</h4>
<table>
<c:forEach var="b" items="${myBoard }">
	<tr>
		<td style="width:400px">
		<c:choose>
			<c:when test="${b.BKIND == 'A' }">[Travel with Me]</c:when>
			<c:when test="${b.BKIND == 'G' }">[Travel with Guide]</c:when>
			<c:when test="${b.BKIND == 'C' }">[Community]</c:when>
		</c:choose>
		${b.BTITLE }
		</td>
	</tr>
</c:forEach>
</table>
<div class="inBoards">
<button id="moreBoards">더보기</button>
</div>
</div>

<div class="myRegister">
<h4>신청내역</h4>
<table class="myRegi">
<c:forEach var="r" items="${register }">
	<tr>
		<td style="width:400px;height:60px;">
		<c:choose>
			<c:when test="${r.BKIND == 'A' }">[Travel with Me]</c:when>
			<c:when test="${r.BKIND == 'G' }">[Travel with Guide]</c:when>
		</c:choose>
		${r.BTITLE }<BR>
		<div style="width:100px;margin-left:auto;">
		<button class="cancelRegister" value="${r.RID }">신청 취소</button>
		</div>
		</td>
	</tr>
</c:forEach>
</table>
<div class="inRegister">
<button id="moreRegister">더보기</button>
</div>
</div>

</div>



<!--
 <div id="newsModal" class="overlay">
	 	 <a href="javascript:void(0)" class="closebtn" onclick="closeNewsModal()" style="text-decoration: none;">&times;</a>
	 	 <div class="overlay-content">
			뭔가 켜지긴 했음..
	  </div>
	</div>
  -->

	  <div class="modal fade" id="moreNewsForm">
		<div class="modal-dialog modal-dialog-scrollable">
	      <div class="modal-content">
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h3 class="modal-title" style="font-family: 배달의민족 도현">알림내역</h3>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body" style="text-align: center">
	        	<table id="allNews">
	        		<tbody></tbody>
	        	</table>
	        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
		        </div>
	       </div>
	     </div>
	  </div>













</body>
</html>