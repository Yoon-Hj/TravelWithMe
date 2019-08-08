<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var sessionid = <%=(String)session.getAttribute("id")%>
</script>
	
	<c:choose>
		<c:when test="<%=(String)session.getAttribute("id")%>">
			<input type="button" value="LOGIN">
			<input type="button" value="JOIN">
		</c:when>
		
		<c:when test="<%=(String)session.getAttribute("id")%> == admin">
			<input type="button" value="LOGOUT">
			<input type="button" value="ADMIN PAGE">
		</c:when>
		
		<c:otherwise>
			<%=(String)session.getAttribute("id")%>님
			<input type="button" value="LOGOUT">
			<input type="button" value="MY PAGE">
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>