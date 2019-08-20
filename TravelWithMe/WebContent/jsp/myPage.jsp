<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	
	
	
	
	
	
	
	.starR{
	  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	  background-size: auto 100%;
	  width: 30px;
	  height: 30px;
	  display: inline-block;
	  text-indent: -9999px;
	  cursor: pointer;
	}
	.starR.on{background-position:0 0;}
	
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/mypage.js?v=<%=System.currentTimeMillis() %>"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
response.setHeader("cache-control","no-store");
response.setHeader("expires","0");
response.setHeader("pragma","no-cache");
%>
<h1>MY PAGE</h1><HR>
<div class="row">
<div class="myInfo">
<h4>MY INFO</h4><BR>
<center>
<table id="info" style="width : 400px; height : 100px; text-align:center;">
	<tr>
		<th>아이디</th>
		<td>${memberInfo.mid }</td>
		<th rowspan="4">
		<c:choose>
			<c:when test="${memPoint.CNT > 0 }">
				<c:choose>
					<c:when test="${memPoint.GRADE == 'Gold' }">
						<img src="imgs/gold.jpg" style="width:70px;height:70px;"/><BR>
					</c:when>
					<c:when test="${memPoint.GRADE == 'Silver' }">
						<img src="imgs/silver.jpg" style="width:70px;height:70px;"/><BR>
					</c:when>
					<c:when test="${memPoint.GRADE == 'Bronze' }">
						<img src="imgs/bronze.jpg" style="width:70px;height:70px;"/><BR>
					</c:when>
				</c:choose>
					가이드 포인트  ${memberInfo.mguidepoint}점<BR>
					가이드 횟수 ${memPoint.CNT }회
			</c:when>
			<c:otherwise>
				아직 가이드경험이 없습니다.
			</c:otherwise>
		</c:choose>
		</th>
	</tr>
	<tr>
		<th>성명</th>
		<td>${memberInfo.mname}</td>
	</tr>
	<tr>
		<th>연락처</th>
		<td>${memberInfo.mcontact}</td>
	</tr>
	<tr>
		<th>
			신뢰지수<BR>
		</th>
		<td>
			${memberInfo.mpoint } / 100 점
		</td>
	</tr>
</table><BR>
</center>
<div class="inInfo">
<input type="button" id="reviseForm" value="회원정보 수정" data-toggle="modal" data-target="#meminfoReviseForm" style="background-color: transparent; border: 0px; font-size: 15px; font-weight: bold;">
<input type="button" id="withdrawal" value="회원탈퇴"style="background-color: transparent; border: 0px; font-size: 15px; font-weight: bold;">
</div>
</div>

<!-- 스크립트는 header.js에 있다. -->
<div class="myNews">
<h4>알림내역</h4>
<table class="news" style="width:500px">
<c:forEach var="n" items="${notice }">
	<tr>
		<td style="height:70px;width:500px">
		<input type="hidden" value="${n.NOTICESTATUS }">
		<input type="hidden" value="${n.BNUM }">
		<input type="hidden" value="${n.BKIND }">
		<input type="hidden" value="${n.NKCODE }">
		<input type="hidden" value="${n.EVALSTATUS }">
		<input type="hidden" value="${n.NID }">
		<input type="hidden" value="${n.BTITLE }">
		<a class="newsRows">
		${n.BTITLE }<BR>
		${n.NKREASON }</a></td>
	</tr>
</c:forEach>
</table>
<c:if test="${fn:length(notice) == 5}">
<div class="inNews">
<input type="button" class="moreNews" value="더보기" data-toggle="modal" data-target="#moreNewsForm" style="background-color: transparent; border: 0px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;">
</div>
</c:if>
</div>

<div class="myBoards">
<h4>내가 작성한 글</h4>
<table>
<c:forEach var="b" items="${myBoard }">
	<tr>
		<td style="width:400px;height:40px;">
		<a class="boardsRow">
		<input type="hidden" value="${b.BNUM }"/>
		<input type="hidden" value="${b.BKIND }"/>
		<c:choose>
			<c:when test="${b.BKIND == 'A' }">[Travel with Me]</c:when>
			<c:when test="${b.BKIND == 'G' }">[Travel with Guide]</c:when>
			<c:when test="${b.BKIND == 'C' }">[Community]</c:when>
		</c:choose>
		${b.BTITLE }</a>
		</td>
	</tr>
</c:forEach>
</table>
<div class="inBoards">
<input type="button" id="moreBoards" value="더보기" style="background-color: transparent; border: 0px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;">
</div>
</div>

<div class="myRegister">
<h4>신청내역</h4>
<table class="myRegi">
<c:forEach var="r" items="${register }">
	<tr>
		<td style="width:400px;height:40px;">
		<a class="regisRow">
		<input type="hidden" value="${r.BNUM }"/>
		<input type="hidden" value="${r.BKIND }"/>
		<c:choose>
			<c:when test="${r.BKIND == 'A' }">[Travel with Me]</c:when>
			<c:when test="${r.BKIND == 'G' }">[Travel with Guide]</c:when>
		</c:choose>
		${r.BTITLE }</a>
		<div style="width:100px;margin-left:auto;">
		</div>
		</td>
	</tr>
</c:forEach>
</table>
<c:if test="${fn:length(register) == 5}">
<div class="inRegister">
<input type="button" id="moreRegister" value="더보기" data-toggle="modal" data-target="#moreRegiForm" style="background-color: transparent; border: 0px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;">
</div>
</c:if>
</div>

</div>






	<!-- 신청내역 더보기 -->	
	  <div class="modal fade" id="moreRegiForm">
		<div class="modal-dialog modal-dialog-scrollable">
	      <div class="modal-content">
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h3 class="modal-title" style="font-family: 배달의민족 도현">신청내역</h3>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body" style="text-align: center">
	        	<table id="allRegis">
	        		<tbody class="regisRows"></tbody>
	        	</table>
	        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" id="evGuide" class="btn btn-success" data-dismiss="modal">확인</button>
		        </div>
	       </div>
	     </div>
	  </div>



	<!-- 회원정보 수정모달 -->	
	  <div class="modal fade" id="meminfoReviseForm">
		<div class="modal-dialog modal-dialog-scrollable">
	      <div class="modal-content">
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h3 class="modal-title" style="font-family: 배달의민족 도현">회원정보 수정</h3>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body" style="text-align: center">
	        	<h3></h3>
	        </div>
	        <div id="checkPw" style="display:none; text-align:center;">
	        	<h5>비밀번호를 입력하세요</h5><br>
	        	<input type="password" id="pw"/>
	        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" id="ok" class="btn btn-success" data-dismiss="modal">확인</button>
		          <button type="button" id="checkPass" class="btn btn-success">확인</button>
		        </div>
	       </div>
	     </div>
	  </div>












</body>
</html>