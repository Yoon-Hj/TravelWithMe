<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel With Me</title>
<style type="text/css">

3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
.css-bar {
    display: inline-block;
    
    background: #000;
}
.css-bar, .css-bar:before, .css-bar:after {
    width: 18px;
    height: 3px;
}
.css-bar:before, .css-bar:after {
    display: block;
    content: "";
    position: absolute;
    top: 50%;
    left: 0;
    background: #000;
}
.css-bar:before { margin-top: -8px; }
.css-bar:after { margin-top: 4px; }

</style>
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
		<label>&#8801;</label>	
	</div>
	
	

	

	
</body>
</html>