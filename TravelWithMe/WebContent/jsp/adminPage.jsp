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
</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="adminDiv">
	<div class="sidenav">
	  <a href="#grade" id="manageGrade">가이드 등급 관리</a>
	  <a href="#thema" id="manageThema">여행취향 / 테마 관리</a>
	</div>


	<div class="gradeDiv" style="display:none;">
	  <h2>가이드 등급 관리</h2><BR>
	  <center>
	  	<table style="text-align:center">
	  		<tr>
	  			<th>등급</th>
	  			<th>점수</th>
	  		</tr>
	  		<tbody id="gradeTbody"></tbody>
	  	</table>
	  </center>
	</div>  
	<div class="themaDiv" style="display:none;">
	  <h2>여행취향 / 테마 관리</h2><BR>
	  <center>
	  	<table>
	  		<tbody id="themaTbody"></tbody>
	  	</table>
	  </center>
	</div>  
</div>



</body>
</html>