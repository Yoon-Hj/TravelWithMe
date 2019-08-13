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
<script src="js/webSocket.js?v=<%=System.currentTimeMillis() %>"></script>
</head>
<body>
<input type="hidden" value="${user }" id="user">
<h1>ID : ${user }</h1>

<h1 style="text-align: center;">헤더페이지 테스트함</h1>

	<br>
	<input type="text" id="loginId">
	<input type="password" id="loginPw">
	
	<button id="login">로그인</button><BR><BR><BR>
	<div style="text-align: center;">

		<form action="">

			<!-- <input id="logout" onclick="send_message()" value="Send" type="button"> --> 
			<input id="textID" name="message" value="Hello WebSocket!" type="text"><br>

		</form>
		<button id="logout">로그아웃</button>
	</div>

	<div id="output"></div>
	
	<p id="out" style="color:red"></p>





</body>
</html>