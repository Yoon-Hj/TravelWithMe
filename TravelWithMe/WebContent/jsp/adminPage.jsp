<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="fonts/font.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="js/admin.js?v=<%=System.currentTimeMillis() %>"></script>
  
<style type="text/css">
body {
  font-family: "Lato", sans-serif;
}
.adminDiv{
	border : solid 1px;
	grid-template-columns:auto auto auto;
	height : 800px;
}

.sidenav {
  width: 230px;
  z-index: 1;
  top: 20px;
  left: 10px;
  background: #eee;
  overflow-x: hidden;
  padding: 8px 0;
  float:left;
  display : inline;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #2196F3;
  display: block;
}

.sidenav a:hover {
  color: #064579;
}

.main {
  margin-left: 140px; /* Same width as the sidebar + left position in px */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}



.gradeTable th{
	border-bottom : 1px solid black;
	width : 200px;
	height : 50px;
}
.gradeTable td{
	border : 1px solid black;
	width : 200px;
	height : 170px;
}

</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<input type="hidden" id="type" value="${type }">

<div class="adminDiv">
	<div class="sidenav">
	  <a href="#grade" id="manageGrade">가이드 등급 관리</a>
	  <a href="#thema" id="manageThema">여행취향 / 테마 관리</a>
	</div>


	<div class="gradeDiv" style="display:none;">
	  <h2>가이드 등급 관리</h2><BR>
	  <center>
	  	<table class="gradeTable" style="text-align:center;">
	  		<thead>
	  		<tr>
	  			<th>등급</th>
	  			<th colspan="2">점수</th>
	  		</tr>
	  		</thead>
	  		<tr>
	  			<td>
	  			<img src="imgs/gold2.jpg" style="width:70px;height:70px;"/><BR>
	  			<h4>Gold</h4></td>
	  			<td><h4>9999</h4></td>
	  			<td><input type="text" id="goldMin"></td>
	  		</tr>
	  		<tr>
	  			<td>
	  			<img src="imgs/silver2.jpg" style="width:70px;height:70px;"/><BR>
	  			<h4>Silver</h4></td>
	  			<td><input type="text" id="silverMax"></td>
	  			<td><input type="text" id="silverMin"></td>
	  		</tr>
	  		<tr>
	  			<td>
	  			<img src="imgs/bronze2.jpg" style="width:70px;height:70px;"/><BR>
	  			<h4>Bronze</h4></td>
	  			<td><input type="text" id="bronzeMax"></td>
	  			<td><h4>0</h4></td>
	  		</tr>
	  		<tbody id="gradeTbody"></tbody>
	  	</table>
	  </center><BR>
	  <div style="float:right; width : 200px">
	  	<input type="button" id="modiGrade" value="변경" style="background-color: transparent; border: 0px; font-size: 15px; font-weight: bold;">
	  </div>
	</div>  
	
	
	
	<div class="themaDiv" style="display:none;">
	  <h2>여행취향 / 테마 관리</h2><BR>
	  	  <div style="float:right; right:20%;">
		  </div>
	  <center>
	  	<input type="text" id="addlikes">
		<input type="button" id="addLike" value="추가" style="background-color: transparent; border: 0px; font-size: 20px; font-weight: bold;">
	  	<table>
	  		<tbody id="themaTbody"></tbody>
	  	</table>
	  </center>
	</div>  
</div>

</body>
</html>