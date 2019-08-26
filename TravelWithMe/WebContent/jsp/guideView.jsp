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
<link rel="stylesheet" type="text/css" href="css/guideView.css?v=<%=System.currentTimeMillis() %>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="js/guideView.js?v=<%=System.currentTimeMillis() %>"></script>
<title>Travel With Me</title>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 style="font-family: '함초롬돋움'; clear: both; margin-left: 30px;">Travel With Guide</h1>
	<hr>
	
	<div class="container">

		<c:if test="${user==guideBoard.mid}">
			<div style="margin-bottom: 10px; margin-left: 860px; font-family: '배달의민족 주아';">
				<input type="button" class="btn default" value="게시글 수정" id="modiBtn" style="border: 2px solid #B5C3C8;">
				<input type="button" class="btn default" value="게시글 삭제" id="delBtn" style="border: 2px solid #B5C3C8;">
			</div>
		</c:if>
		
		<div class="card">
			<table class="viewCard" style="border: none;">
				<tr>
					<th>작성자</th>
					<td id="writeid">${guideBoard.mid}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${guideBoard.btitle}<input type="hidden" id="hiddenbnum" value="${guideBoard.bnum}"></td>
				</tr>
				<tr>
					<td colspan='2'">
						<div class="slideshow-container" style="text-align: center; margin-left: 5%">
						<a id='prev' style='color:white' onclick='plusSlides(-1)'>&#10094;</a>
						<a id='next' style='color:white' onclick='plusSlides(1)'>&#10095;</a>
							<c:forEach var="photo" items="${photo}">
								<div class='mySlides'>
									<a><img src="download.do?photopath=${photo}" style='width: 300px; height: 250px; margin-left: 83px;'></a>
								</div>
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td><fmt:formatDate value="${guideBoard.gstartdate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${guideBoard.gstartdate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<th>출발장소 및 시간</th>
					<td>${guideBoard.gdepartplace} ${guideBoard.gdeparttime}시</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>${guideBoard.garea}</td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td>
						<c:choose>
							<c:when test="${guideBoard.gnop==0}">무관</c:when>
							<c:otherwise>${guideBoard.gnop}명</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>테마</th>
					<td>${guideBoard.gthema}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${guideBoard.bcontent}</td>
				</tr>
				<tr>
					<th style="vertical-align: top;">세부일정</th>
					<td>
						<div id='canvasDiv'>
							<c:forEach var='sche' items="${guideSche}">
								<input type="hidden" name='sdate' value="${sche.sdate }">
								<input type="hidden" name='stime' value="${sche.stime }">
								<input type="hidden" name='splace' value="${sche.splace }">
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<th>주요정책</th>
					<td>
						<c:choose>
							<c:when test="${fn:length(policy) != 0}">
							<c:forEach var="p" items="${policy}" varStatus="status">
							<c:if test="${p.pcode==2}">여행 시작일 기준 <b style="color:#CD1039">${p.pvalue}일 전까지 연락이 되지 않는 분</b>은 작성자 임의로 신청거절을 진행할 수 있습니다.<br></c:if>
							<c:if test="${p.pcode==3}"><b style="color:#CD1039">신뢰지수 ${p.pvalue}점 이하</b>의 회원은 작성자 임의로 신청거절을 진행할 수 있습니다.<br></c:if>
							</c:forEach>
							</c:when>
							<c:otherwise>공지된 출발장소 및 시간에 모인 인원과 동행을 진행하며, 특별한 제제사항은 없습니다.</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</div>
		
		<div style="display: flex; margin-top: 10px; margin-left: 110px; font-family: '배달의민족 주아'">
			<p><input type="button" class="btn default" value="목록으로" style="border: 2px solid #B5C3C8;" onclick="location.href='guideBoardList.do'"></p>
			<p style="float: right; margin-left: 610px;">현재 신청 가능 인원 수 <span class="nop" style="color: #F56E6E; font-size: 20px;"></span>명 &nbsp;&nbsp;
					<input type="button" id="rmbtn" class="btn default" value="신청관리" data-toggle="modal" data-target="#manageModal" style="border: 2px solid #B5C3C8; width: 80px; display:none;">
					<input type="button" id="rcbtn" class="btn default" value="신청취소" style="border: 2px solid #B5C3C8; width: 80px; display:none;">
					<input type="button" id="rbtn" class="btn default" value="신청" data-toggle="modal" data-target="#warningModal1" style="border: 2px solid #B5C3C8; width: 80px; display:none;">
					<input type="hidden" id="hid"><input type="hidden" id="hn">			
			</p>
		</div>

		<div style="margin-top: 20px; margin-left: 110px; margin-bottom: 20px;">
			<form class="comment">
					<input type="text" id="cform" class="cocontent" class="form-control" placeholder="댓글을 입력하세요." style="width: 830px; display: none;">
					<button type="submit" id="cbtn" class="writecoBtn" style="display: none;">댓글작성</button>
			</form>
			<input type="text" id="clform" class="form-control" placeholder="댓글을 작성하려면 로그인 해주세요." style="width: 930px; height:35px; display: none;">
		</div>
		
		<div style="margin-top:20px; margin-bottom: 20px; margin-left: 110px; width: 90%;">
			<table class="commtable">
			<c:forEach var="comment" items="${commentList}" varStatus="status">
					<tr>
						<c:choose>
						<c:when test="${comment.cnum==comment.cgrid}">
							<th width="100px;" style="text-align: center; font-weight: bold;"><input type="hidden" value="${comment.cgrid}">${comment.mid}</th>
							<td colspan="2">
								<c:if test="${comment.cdel==0}">${comment.ccontent} 
									<input type="hidden" value="${comment.cnum}">
									<c:if test="${user==comment.mid}"><button class="commDelBtn">×</button></c:if>
								<button style="border:none; font-size: 13px; background: white; cursor: pointer;" class="replyBtn">답글</button>
							</c:if>
							<c:if test="${comment.cdel==1}"><span style="color: #828282; font-size: 13px;">해당 댓글은 삭제되었습니다.</span></c:if>
							</td>
						</c:when>
						<c:otherwise>
							<td>&nbsp;&nbsp;</td>
							<td width="90px;" style="text-align: left; font-weight: bold;"><i class="material-icons" style="font-size: 15px;">&#xe5da;&nbsp;</i>${comment.mid}</td>
							<td width="700px;" style="text-align: left;">
								<c:if test="${comment.cdel==0}">${comment.ccontent} 
									<input type="hidden" value="${comment.cnum}">
									<c:if test="${user==comment.mid}"><button class="commDelBtn">×</button></c:if>
								</c:if>
								<c:if test="${comment.cdel==1}"><span style="color: #828282; font-size: 13px;">해당 댓글은 삭제되었습니다.</span></c:if>
							</td>
						</c:otherwise>
						</c:choose>
					</tr>
			</c:forEach>
			</table>
		</div>
		 
	</div>
	
	<!-- 신청모달1 -->
	<div class="modal fade" id="warningModal1">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: '배달의민족 도현'">신청시 주의해야할 주요정책</h3>
					<button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '함초롬돋움';">
		    		<c:choose>
						<c:when test="${fn:length(policy) != 0}">
						<c:forEach var="p" items="${policy}" varStatus="status">
						<c:if test="${p.pcode==2}">여행 시작일 기준 <b style="color:#CD1039">${p.pvalue}일 전까지 연락이 되지 않는 분</b>은 작성자 임의로 신청거절을 진행할 수 있습니다.<br></c:if>
						<c:if test="${p.pcode==3}"><b style="color:#CD1039">신뢰지수 ${p.pvalue}점 이하</b>의 회원은 작성자 임의로 신청거절을 진행할 수 있습니다.<br></c:if>
						</c:forEach>
						</c:when>
						<c:otherwise>공지된 출발장소 및 시간에 모인 인원과 동행을 진행하며, 특별한 제제사항은 없습니다.</c:otherwise>
					</c:choose>
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn" data-dismiss="modal" style="background-color: #FF7A85; color:white; font-family: '배달의민족 주아'">취소</button>
		          <button type="button" class="btn" id="agreeBtn" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아';">동의</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>
 	 		        
	<!-- 신청모달2 -->
	<div class="modal fade" id="warningModal2">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: '배달의민족 도현'">신청 가능 인원 수 : <span class="nop" style="color: #F56E6E; font-size: 25px;"></span>명</h3>
					<button type="button" class="close" clss="cc">×</button>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '함초롬돋움';">
		          신청 인원 수 &nbsp;
					<input type="number" id="registerNum" name="registernum" value="1" min="1" onkeyup="check(this)">명      
					<br>
					<br>
					※ NoShow는 서로의 소중한 시간을 낭비하는 행위입니다.<br>
					서로를 존중하는 성숙한 여행인이 됩시다.
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn" id="regiBtn" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아';">신청완료</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>

	<!-- 신청완료모달 -->
	<div class="modal fade" id="succModal">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: '배달의민족 도현'">신청이 완료되었습니다</h3>
					<button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '함초롬돋움';">
		          작성자 연락처 : <span id="contact" style="color: #F56E6E;"></span><br><br>
		          
					※ 작성자의 NoShow는 사이트 내 관리자 이메일로 문의바랍니다.<br>
					즐겁게 여행을 마무리할 수 있도록 서로 배려하는 여행인이 됩시다.
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn" id="finishBtn" data-dismiss="modal" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아';">확인</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>
 	 
 	 <!-- 신청현황 모달 -->
	<div class="modal fade" id="manageModal">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: '배달의민족 도현'">신청현황</h3>
					<button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '나눔고딕';">
					<table id="mtable" style="text-align:center;">

					</table>
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn" data-dismiss="modal" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아'">확인</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>
	
	<jsp:include page="footer.jsp"></jsp:include>
 	 
</body>
</html>