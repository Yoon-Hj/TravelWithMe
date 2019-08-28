<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="fonts/font.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="js/header.js?v=<%=System.currentTimeMillis() %>"></script>
<title>Travel With Me</title>
<style>
	.overlay {
	  height: 0%;
	  width: 100%;
	  position: fixed;
	  z-index: 1;
	  top: 0;
	  left: 0;
	  background-color: rgb(0,0,0);
	  background-color: rgba(0,0,0, 0.9);
	  overflow-y: hidden;
	  transition: 0.5s;
	}
	
	.overlay-content {
	  position: relative;
	  top: 25%;
	  width: 100%;
	  text-align: center;
	  margin-top: 30px;
	}
	
	.overlay a { 
	  padding: 20px;	
	  text-decoration: none;
	  font-size: 36px;
	  color: #818181;
	  display: block;
	  transition: 0.3s;
	}
	
	.canClick:hover, .canClick:focus {
	  color: #f1f1f1;
	  text-decoration: none;
	}
	
	.overlay .closebtn {
	  position: absolute;
	  top: 20px;
	  right: 45px;
	  font-size: 60px;
	}
	
	@media screen and (max-height: 450px) {
	  .overlay {overflow-y: auto;}
	  .overlay a {font-size: 20px}
	  .overlay .closebtn {
	  font-size: 40px;
	  top: 15px;
	  right: 35px;
	  }  
   }
   .userId{
   	cursor:default;'
   }
</style>
</head>
<body>

<input type="hidden" id="user" value="${user}">
	
	<img src="imgs/logo.jpg" width="180px;" height="32px;" style="float: left; margin-left: 20px; margin-bottom: 20px; margin-top: 13px; cursor: pointer;" onclick="location.href='index.do'"> 
		
	<c:choose>
		<c:when test="${user==null}">
	
	   		<input type="button" value="LOGIN" data-toggle="modal" data-target="#loginForm" style="margin-left:870px; background-color: transparent; border: 0px; font-size: 17px; font-family: D2Coding;">
	   		<input type="button" value="JOIN" id="joinForm" style="margin-left:10px; background-color: transparent; border: 0px; top: 30px; font-size: 17px; font-family: D2Coding;">

	   		<span style="margin-left:10px; font-size:30px; color: black; cursor:pointer" onclick="openNav()">&#9776;</span> 
	   
	   	</c:when>
	   	
	   	<c:when test="${user=='admin'}">
	   	
	   		<input type="button" value="LOGOUT" id="logout" style="margin-left: 847px; background-color: transparent; border: 0px; top: 30px; font-size: 17px; font-family: D2Coding;">
	   		<input type="button" value="ADMIN PAGE" onclick="location.href='adminPage.do'" style="margin-left: 5px; background-color: transparent; border: 0px; top: 30px; font-size: 17px; font-family: D2Coding;">

	   		<span style="margin-left: 5px; font-size:30px; color: black; cursor:pointer" onclick="openNav()">&#9776;</span>
	   	</c:when>
	   	
	   	<c:otherwise>
		   		<a class="userId" style="font-family: D2Coding; margin-left: 716px; font-size: 17px;" data-toggle="tooltip">${user}</a>님
				<a href="#" style="color: black; margin-left: 7px; font-family: D2Coding; font-size: 17px;" data-toggle="modal" data-target="#moreNewsForm" class="moreNews">알림<span id="noticeCnt" class="w3-badge w3-red" style="font-size: 15px">5</span></a>

				<input type="button" value="LOGOUT" id="logout" style="margin-left: 5px; background-color: transparent; border: 0px; top: 30px; font-size: 17px; font-family: D2Coding;">
			   	<input type="button" value="MY PAGE" id="myPage" style="margin-left: 3px; background-color: transparent; border: 0px; top: 30px; font-size: 17px; font-family: D2Coding;">

			  	<span style="font-size:30px; color: black; margin-left: 5px; cursor:pointer" onclick="openNav()">&#9776;</span>
	   	</c:otherwise>	
	 </c:choose>
	
    <!-- 로그인 모달 -->
	  <div class="modal fade" id="loginForm">
		<div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h3 class="modal-title" style="font-family: 배달의민족 도현">LOGIN</h3>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body" style="text-align: center">
	         	 <label for="id" style="margin-left: 25px; margin-right: 37px; font-family: '함초롬돋움';"><b>ID</b></label>
				 <input type="text" placeholder="Enter id" name="id" id="loginId" required><br>
				
				 <label for="pww" style="margin-right: 8px; font-family: '함초롬돋움';"><b>Password</b></label>
				 <input type="password" placeholder="Enter Password" name="pw" id="loginPw" required><br><br>
				 
				  <button type="button" class="btn" id="login" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아'; margin-left: 10px;">Login</button>
				   <button type="button" class="btn" id="find" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아'">Find ID/PW</button>
				   
	        </div>
	       </div>
	     </div>
	  </div>
	 
	 <!-- 리모콘바 --> 
	  <div id="myNav" class="overlay">
	 	 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" style="text-decoration: none;">&times;</a>
	 	 <div class="overlay-content">
		 <table style="margin-left: 50px;">
			<tr>
				<td>
					<a style="color: #818181;">Travel with Me</a>
					<a class="canClick" href="accomBoardList.do">목록보기</a>
		   			<a class="canClick" id='AwriteBtn' href='#'>글작성</a>
				</td>
				<td>
				 	<a style="color: #818181;">Travel with Guide</a>
				 	<a class="canClick" href="guideBoardList.do">목록보기</a>
		   			<a class="canClick" id='GwriteBtn' href='#'>글작성</a>
				</td>
				<td>
					<a class="canClick" href="attractionInfo.do">Attraction Info</a>
					<a>&nbsp;</a>
					<a>&nbsp;</a>
				</td>
				<td>
					<a style="color: #818181;">Community</a>
					<a class="canClick" href="commBoardList.do">목록보기</a>
		   			<a class="canClick" href="#">글작성</a>
				</td>
			</tr>		
		</table>
	  </div>
	</div>
	
	
			<!-- 알림내역 더보기 -->	
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
	        		<tbody class="newsRow"></tbody>
	        	</table>
	        </div>
	        <div class="starRev" style="display:none;text-align:center">
	        	<div>
	        		<h3>가이드 평가</h3>
	        		<h5 id="guideTitle"></h5>
	        	</div>
				<span class="starR on" value="1">1</span>
				<span class="starR">2</span>
				<span class="starR">3</span>
				<span class="starR">4</span>
				<span class="starR">5</span>
				<input type="hidden" value="a" id="gPoint">
				<input type="hidden" value="a" id="guideBnum">
				<input type="hidden" value="a" id="g_noticeId">
				<input type="hidden" value="f" id="checkEval">
			</div>
			<div class="attendanceModal" style="display:none;text-align:center">
				<div>
	        		<h3>참석여부 체크</h3>
	        		<h5>참석하지 않은 신청자의 아이디를 선택해주세요.</h5><br>
	        		<center>
	        		<table id="registers" style="text-align:left">
	        		<tbody class="registersRow"></tbody>
	        		</table>
	        		</center><br>
	        		<input type="hidden" value="a" id="noticeId">
	        	</div>
	        	
			</div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" id="ok" class="btn" data-dismiss="modal" style="background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아'; display:none;">확인</button>
		          <button type="button" id="evGuide" class="btn" data-dismiss="modal" style="background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아'; display:none;">확인</button>
		          <button type="button" id="checkAttend" class="btn" data-dismiss="modal" style="background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아'; display:none;">확인</button>
		          <button type="button" id="back" class="btn" style="background-color: #E8D4D4; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아'; display:none;">이전</button>
		          <input type="hidden" id="chk" value="f">
		        </div>
	       </div>
	     </div>
	  </div>
	
	

	<script>
	function openNav() {
	  document.getElementById("myNav").style.height = "100%";
	}
	
	function closeNav() {
	  document.getElementById("myNav").style.height = "0%";
	}
	
	</script>  
	
</body>
</html>