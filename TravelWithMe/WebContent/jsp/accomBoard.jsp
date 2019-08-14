<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/font.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Travel With Me</title>
<style type="text/css">

 .card {
	  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	  padding-top: 16px;
	  padding-bottom: 16px;
	  padding-left: 60px;
	  text-align: left;
	  background-color: #f1f1f1;
  }
  
  * {
 	 box-sizing: border-box;
  }
  
  .column {
	  float: left;
	  width: 25%;
	  padding-left: 5px;
	  padding-right: 5px;
	  padding-bottom: 0px;
	  position: relative;
	  margin: 0 auto;
  }
  
  .row::after {
	  content: "";
	  clear: both;
	  display: table;
  }
  
  .column img {vertical-align: middle;}
  
  .column .content {
	  position: absolute;
	  bottom: 0;
	  background: rgb(0, 0, 0); /* Fallback color */
	  background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
	  color: #f1f1f1;
	  width: 96.5%;
	  height: 30%;
	  text-align: center;
	  font-size: 12px;
	  font-family: 함초롬돋움;
  }
  
  .pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	  transition: background-color .3s;
   }

   .pagination a.active {
	  background-color: #E8D4D4;
	  color: white;
   }

	.pagination a:hover:not(.active) {background-color: #ddd;}
 
</style>
</head>
<body>

	<script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>

	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 style="font-family: 함초롬돋움; margin-left: 30px">Travel With Me</h1>
	<hr>
	
	<div class="container">
		<a href="#" data-toggle="tooltip" data-placement="bottom" title="글 작성하기" 
			style="text-decoration: none; color: #787878; font-family: 함초롬돋움;">
			원하는 동행글이 없으신가요? 직접 동행글을 작성해보세요.</a>
		<br><br>

		<div class="card" style="font-family: 함초롬돋움;">
			 <form action="accomSearch.do">
			 <table style="border: none;">
			 <tr>
			 	<td>
				 	<select name="type" class="custom-select" style="width: 130px">
				 	<option value="1" selected="selected">제목</option>
						<option value="2">내용</option>
						<option value="3">제목+내용</option>
						<option value="4">작성자(아이디)</option>
						<option value="5">지역</option>
					</select>
				</td>
				<td><input type="text" class="form-control" name="keyword" style="width: 600px"></td>
			 </tr>
			 <tr>
			 	<td style="text-align: center">여행날짜</td>
			 	<td width="700px">
			 		<input type="date" name="sdate" max="2030-12-31" min="2019-01-01" 
			 				style="width: 250px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">&nbsp; ~ &nbsp;
					<input type="date" name="fdate" max="2030-12-31" min="2019-01-01"
							style="width: 250px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">
				</td>
				<td colspan="3" width=130px; style="margint-left: 20px; margin-top: 150px"><button type="submit" class="btn" style="background-color: #B5C3C8; color: white; width: 140px; height: 40px;">SEARCH&nbsp;&nbsp;<i class="fa fa-search"></i></button></td>
			</tr>
			<tr>
				<td style="text-align: center">여행취향</td>
				<td>
					<!-- likelist 순회 -->
					<select name="like" class="custom-select" style="width: 130px">
					<option value="1" >취향명</option>	
					</select>
				</td>
			</tr>
			</table>
			</form>
		</div>
		
		<!-- 추천 4개 조회 -->
		<div style="margin-top: 50px">
		<h4 style="font-family: 함초롬돋움; margin-bottom: 15px;">추천여행</h4>
			<div class="row">
			
			  <div class="column">
				<a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
				<div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp; 10</p></div>
			  </div>
		
			  <div class="column">
			    <a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
			    <div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
			  
			  <div class="column">
			    <a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
			    <div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
			  
			  <div class="column">
			    <a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
			    <div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
			  
			</div>
		</div>

		<!-- 전체 리스트 조회 -->
		<div style="margin-top: 60px">
		<h4 style="font-family: 함초롬돋움; margin-bottom: 15px;">전체여행</h4>
			<div class="row">
			
			  <div class="column">
				<a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
				<div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
		
			  <div class="column">
			    <a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
			    <div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
			  
			  <div class="column">
			    <a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
			    <div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
			  
			  <div class="column">
			    <a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
			    <div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
			  
			</div>
			
			<div class="row" style="margin-top: 15px;">
			
			  <div class="column">
				<a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
				<div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
		
			  <div class="column">
			    <a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
			    <div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
			  
			  <div class="column">
			    <a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
			    <div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
			  
			  <div class="column">
			    <a href="#"><img src="../imgs/gangwon.PNG" style="width:100%"></a>
			    <div class="content"><p>2019.07.13 ~ 2019.07.15<br>[속초] 동행 구해요~<br>test1 &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp;10</p></div>
			  </div>
			  
			</div>
		</div>
	</div>
	
	<div class="pagination" style="margin-top: 25px; margin-left: 400px">
		<c:if test="${ startPage != 1}">
			<!-- 
			<input type="button" value="처음으로" class="btn" onclick="location.href='boardList.do?page=1'">
			<input type="button" value="이전" class="btn" onclick="location.href='boardList.do?page=${startPage-1}'"> -->
			<a href="accomBoard.do?page=1'">&laquo;</a>
		</c:if>
		
		<c:forEach var="i" begin="${ startPage }" end="${ endPage }" varStatus="status">
			<c:choose>
				<c:when test="${ currentPage == status.index }">
					<a class="active">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="accomBoard.do?page=${i}<c:if test="${ keyword != null }">&keyword=${keyword}&type=${type}</c:if>" style="font-size: 17px">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${ endPage != lastPage }">
			<a href="accomBoard.do?page=${lastPage}'">&raquo;</a>
			<!-- 
			<input type="button" value="다음" class="btn" onclick="location.href='boardList.do?page=${endPage+1}'">
			<input type="button" value="마지막으로" class="btn" onclick="location.href='boardList.do?page=${lastPage}'"> -->
		</c:if>
	</div>
			
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>