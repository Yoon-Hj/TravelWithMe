<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel With Me</title>
</head>
<body>	

	<div style="float: right;">
		<c:choose>
			<c:when test="${user==null}">
				<input type="button" value="LOGIN">
				<input type="button" value="JOIN">
			</c:when>
			<c:when test="${user==admin}">
				<input type="button" value="LOGOUT">
				<input type="button" value="ADMIN PAGE">		
			</c:when>
			<c:otherwise>
				${user}님
				<input type="button" value="LOGOUT">
				<input type="button" value="MY PAGE">
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>