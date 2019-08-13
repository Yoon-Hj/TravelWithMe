<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="js/webSocket.js?v=<%=System.currentTimeMillis() %>"></script>
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
</style>
</head>
<body>

	<c:choose>
		<c:when test="${user==null}">
	   		<input type="button" value="LOGIN" data-toggle="modal" data-target="#loginForm" style="margin-left:1080px; background-color: transparent; border: 0px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;">
	   		<input type="button" value="JOIN" style="margin-left:10px; background-color: transparent; border: 0px; top: 30px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;">
	   		<span style="margin-left:10px; font-size:30px; color: black; cursor:pointer" onclick="openNav()">&#9776;</span> 
	   	</c:when>
	   	
	   	<c:when test="${user==admin}">
	   		<input type="button" value="LOGOUT" style="margin-left:10px; background-color: transparent; border: 0px; top: 30px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;">
	   		<input type="button" value="ADMIN PAGE" style="margin-left:10px; background-color: transparent; border: 0px; top: 30px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;">
	   		<span style="font-size:30px; color: black; cursor:pointer" onclick="openNav()">&#9776;</span>
	   	</c:when>
	   	
	   	<c:otherwise>
	   		<p>${user}님</p>
				<input type="button" value="LOGOUT" style="margin-left:10px; background-color: transparent; border: 0px; top: 30px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;">
		   		<input type="button" value="MY PAGE" style="margin-left:10px; background-color: transparent; border: 0px; top: 30px; font-size: 20px; font-family: 함초롬돋움; font-weight: bold;">
		   		<span style="font-size:30px; color: black; cursor:pointer" onclick="openNav()">&#9776;</span>
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
	         	 <label for="id" style="margin-right: 45px"><b>ID</b></label>
				 <input type="text" placeholder="Enter id" name="id" id="loginId" required><br>
				
				 <label for="pww"><b>Password</b></label>
				 <input type="password" placeholder="Enter Password" name="pw" id="loginPw" required><br><br>
				 
				  <button type="button" class="btn btn-success" id="login">Login</button>
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
					<a class="canClick" href="#">목록보기</a>
		   			<a class="canClick" href="#">글작성</a>
				</td>
				<td>
				 	<a style="color: #818181;">Travel with Guide</a>
				 	<a class="canClick" href="#">목록보기</a>
		   			<a class="canClick" href="#">글작성</a>
				</td>
				<td>
					<a class="canClick" href="#">Attraction Info</a>
					<a>&nbsp;</a>
					<a>&nbsp;</a>
				</td>
				<td>
					<a style="color: #818181;">Community</a>
					<a class="canClick" href="#">목록보기</a>
		   			<a class="canClick" href="#">글작성</a>
				</td>
			</tr>		
		</table>
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