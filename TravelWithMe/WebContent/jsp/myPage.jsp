<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>Travel With Me</title>
<script src="js/mypage.js?v=<%=System.currentTimeMillis() %>"></script>
<style>
	h1{
		margin:10%;
	}
	
	/* .row{
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
	
	
	#memInfo > th{
		width : 200px;
	}
	 */
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
	
	 .card {
	 	  width: 500px;
	 	  height: 500px;
	 	  margin-left: 10px;
		  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
		  padding-top: 16px;
		  padding-bottom: 16px;
		  padding-left: 20px;
		  padding-right: 30px;
		  text-align: left;
		  background-color: #f1f1f1;
		  font-family: '나눔고딕';
	  }
	  
	  .viewCard th{
	  	  width: 20%;
	  	  padding: 5px;
	  	  text-align: center;
	  }
	  
	  .viewCard td{
	  	 color: #464646;
	  }
	  
	  .column {
		  float: left;
		  width: 50%;
		  padding: 10px;
	  }
	
	
	.row:after {
		  content: "";
		  display: table;
		  clear: both;
	  }
</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
	%>
	<h1 style="font-family: '함초롬돋움'; clear: both; margin-left: 30px; margin-top: 10px;">MY PAGE</h1><hr>
	
<div class="container" style="margin-bottom: 450px;">
	
	<div class="row" style="margin-bottom: 15px;">
		<div class="myInfo column">
		
			<div class="card" style="position: absolute; left: 60px; top: 15px;">
				<span class="badge badge-primary" 
					style="font-family: '함초롬돋움'; clear: both; margin-bottom: 20px; font-size: 25px; background-color: #E8D4D4; color: black;">MY INFO</span>
			
				<table id="info" style="width : 450px; height : 150px; text-align: left; border: none;" class="viewCard">
					<tr>
						<th>아이디</th>
						<td>${memberInfo.mid }</td>
						<td rowspan="2">
						<c:choose>
							<c:when test="${memPoint.CNT > 0 }">
								<c:choose>
									<c:when test="${memPoint.GRADE == 'Gold' }">
										<img src="imgs/gold2.jpg" style="width:70px;height:70px; margin-left: 30px;"/><BR>
									</c:when>
									<c:when test="${memPoint.GRADE == 'Silver' }">
										<img src="imgs/silver2.jpg" style="width:70px;height:70px; margin-left: 30px;"/><BR>
									</c:when>
									<c:when test="${memPoint.GRADE == 'Bronze' }">
										<img src="imgs/bronze2.jpg" style="width:70px;height:70px; margin-left: 30px;"/><BR>
									</c:when>
								</c:choose>
									<BR>
									
							</c:when>
							<c:otherwise>
								아직 가이드경험이 없습니다.
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<th>성명</th>
						<td>${memberInfo.mname}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${memberInfo.mcontact}</td>
						<td><b>가이드 포인트</b> &nbsp;&nbsp;  ${memberInfo.mguidepoint}점</td>
					</tr>
					<tr>
						<th>
							신뢰지수<BR>
						</th>
						<td>${memberInfo.mpoint } / 100 점</td>
						<td style="margin-left: 10px;"><b>가이드 횟수</b> &nbsp;&nbsp; ${memPoint.CNT }회</td>
					</tr>
				</table>
				
				<div class="inInfo" style="margin-top: 20px; margin-left: 200px;">
					<input type="button" id="reviseForm" class="btn" value="회원정보 수정" data-toggle="modal" data-target="#meminfoReviseForm" style="width: 120px; background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아';">
					<input type="button" id="withdrawal" class="btn" value="회원탈퇴" data-toggle="modal" data-target="#meminfoReviseForm" style="width: 120px; background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아';">
				</div>
			</div>
	</div>
	
	<!-- 스크립트는 header.js에 있다. -->
	<div class="myNews column">
		<div class="card">
			<span class="badge badge-primary" style="font-family: '함초롬돋움'; clear: both; font-size: 25px; background-color: #E8D4D4; color: black;">알림내역</span>
			
			<table class="news viewCard" style="width: 450px; font-size: 14px; font-family: '나눔고딕'">
			<c:forEach var="n" items="${notice }">
				<tr>
					<td style="padding: 5px;">
						<input type="hidden" value="${n.NOTICESTATUS }">
						<input type="hidden" value="${n.BNUM }">
						<input type="hidden" value="${n.BKIND }">
						<input type="hidden" value="${n.NKCODE }">
						<input type="hidden" value="${n.EVALSTATUS }">
						<input type="hidden" value="${n.NID }">
						<input type="hidden" value="${n.BTITLE }">
						<a class="newsRows">
						${n.BTITLE }<BR>
						${n.NKREASON }</a>
					</td>
				</tr>
			</c:forEach>
			</table>
			
			<c:if test="${fn:length(notice) == 5}">
			
				<div class="inNews" style="margin-left: 330px;">
					<input type="button" class="moreNews 
" value="더보기" data-toggle="modal" data-target="#moreNewsForm" style="width: 120px; background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아';">
				</div>
				</c:if>
			
		</div>
	</div>		
	
	<!-- 첫low끝나는 div -->
	</div>

	<div class="row" style="margin-top:10px;">
	
		<div class="myBoards column">
			<div class="card" style="height: 300px; position: relative; left: 50px; top: 300px;">
				<span class="badge badge-primary" style="font-family: '함초롬돋움'; clear: both; margin-bottom: 20px; font-size: 25px; background-color: #E8D4D4; color: black;">내가 작성한 글</span>
				
				<table class="viewCard" style="font-family: '나눔고딕'">
				<c:forEach var="b" items="${myBoard }">
					<tr>
						<td style="padding: 5px;">
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
				
				<div class="inBoards" style="margin-top: 20px; margin-left: 350px;">
					<input type="button" class="btn" id="moreBoards" value="더보기" style="width: 120px; background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아';">
				</div>
			</div>
		</div>
		
		<div class="myRegister column">
			<div class="card" style="height: 300px;  position: relative; top:300px;">
			<span class="badge badge-primary" style="font-family: '함초롬돋움'; clear: both; margin-bottom: 20px; font-size: 25px; background-color: #E8D4D4; color: black;">신청내역</span>
			
			<table class="myRegi viewCard" style="font-family: '나눔고딕'">
			<c:forEach var="r" items="${register }">
				<tr>
					<td style="padding: 5px;">
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
			<div class="inRegister" style="margin-top: 20px; margin-left: 350px;">
				<input type="button" class="btn" id="moreRegister" value="더보기" data-toggle="modal" data-target="#moreRegiForm" style="width: 120px; background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아';">
			</div>
			</c:if>
			
			</div>
		</div>
		
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
		          <button type="button" id="evGuide" class="btn" data-dismiss="modal" style="background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아';">확인</button>
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
	        <div class="modal-body" style="text-align: right">
	        	<center>
	        	<h5 style="font-family: '함초롬돋움';">※ 수정하고 싶은 정보를 다시 입력하세요</h5><br>
	        	<form id="modiForm" action="">
	        		<table id="memInfo" style="wirth:300px;">
	        			<tr>
	        				<th style="width:100px">아이디</th>
	        				<td>${memberInfo.mid }</td>
	        			</tr>
	        			<tr>
	        				<th style="width:100px">이름</th>
	        				<td><input type="text" name="mname" id="name" value="${memberInfo.mname }" class="form-control" style="width:200px;"></td>
	        			</tr>
	        			<tr>
	        				<th style="width:100px">대표 연락처</th>
	        				<td><input type="text" name="mcontact" id="contact" value="${memberInfo.mcontact }" class="form-control" style="width:200px;"></td>
	        			</tr>
		        	</form>
	        		</table>
	        	</center><BR>
	        	<input type="button" id="modiPassForm" value="비밀번호 변경" style="background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아'; padding: 5px;">
	        	<input type="hidden" id="storeName" value="${memberInfo.mname }">
	        	<input type="hidden" id="storeContact" value="${memberInfo.mcontact }">
	        </div>
	        <div id="checkPw" style="display:none; text-align:center;">
	        	<BR><h4 style="font-family: '함초롬돋움';">비밀번호를 입력하세요</h4><br>
	        	<input type="password" id="pw" class="form-control" style="width: 300px; margin-left: 100px;"/><BR><BR>
	        </div>
	        <div id="modiPwForm" style="display:none; text-align:center;">
	        	<BR><h4 style="font-family: '함초롬돋움';">비밀번호 변경</h4><br>
	        	<center>
	        	<table>
	        		<tr>
	        			<th style="width:150px">비밀번호</th>
	        			<td><input type="password" id="modiPw"/></td>
	        		</tr>
	        		<tr>
	        			<th style="width:150px">비밀번호 확인</th>
	        			<td><input type="password" id="modiPwCheck"/></td>
	        		</tr>
	        		<tr>
	        			<td colspan="2"><span id="pwChk"></span></td>
	        		</tr>
	        	</table>
	        	</center><BR>
	        </div>
	        <input type="hidden" id="passType" value="f">
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" id="ok" class="btn" data-dismiss="modal" style="background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아'; display:none;">확인</button>
		          <button type="button" id="checkPass" class="btn" style="background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아';">확인</button>
		          <button type="button" id="modiInfo" class="btn" style="background-color: #E8D4D4; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아'; display:none;">수정</button>
		          <button type="button" id="modiPwBtn" class="btn" style="background-color: #E8D4D4; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아'; display:none;">수정</button>
		        </div>
	       </div>
	     </div>
	  </div>








<jsp:include page="footer.jsp"></jsp:include>



</body>
</html>