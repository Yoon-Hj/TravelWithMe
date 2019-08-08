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
<title>Travel With Me</title>
</head>
<body>

	<div style="float: right; font-size: 35px; font-family: 배달의민족 주아; margin-right: 30px">
		<c:choose>
			<c:when test="${user==null}">
	    		<button type="button" class="btn btn-light" data-toggle="modal" data-target="#loginForm">LOGIN</button>
	    		<button type="button" class="btn btn-light">JOIN</button>
	    	</c:when>
	    	<c:when test="${user==admin}">
	    		<button type="button" class="btn btn-light">LOGOUT</button>
	    		<button type="button" class="btn btn-light">ADMIN PAGE</button>
	    	</c:when>
	    	<c:otherwise>
	    		<p>${user}님</p>
	   			<button type="button" class="btn btn-light">LOGOUT</button>
	    		<button type="button" class="btn btn-light">MY PAGE</button>
	    	</c:otherwise>	
	    </c:choose>
	</div>
	
  <!-- The Modal -->
  <div class="modal" id="loginForm">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">LOGIN</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <input type="text">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">로그인</button>
        </div>
        
      </div>
    </div>
  </div>
  
</body>
</html>