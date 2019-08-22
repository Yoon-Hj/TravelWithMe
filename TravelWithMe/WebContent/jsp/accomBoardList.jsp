<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

	<script type="text/javascript">
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		
			//이미지 분기
			$('.iarea').find("input").each(function(){
				var ar = $(this).val();
				ar = ar.split(' ')[0];
				
				var iloc = $(this).parent("p").parent("div").siblings("a").find("img");
				if(ar=="제주도"){
					iloc.attr("src", "imgs/jeju.PNG");
				}
				else if(ar=="서울특별시"){
					iloc.attr("src", "imgs/seoul.jpg");
				}
				else if(ar=="경기도"){
					iloc.attr("src", "imgs/gyeonggi.jpg");
				}
				else if(ar=="전라북도"){
					iloc.attr("src", "imgs/jeonbuk.PNG");
				}
				else if(ar=="전라남도"){
					iloc.attr("src", "imgs/jeonnam.jpg");
				}
				else if(ar=="경상북도"){
					iloc.attr("src", "imgs/gyeongbuk.jpg");
				}
				else if(ar=="경상남도"){
					iloc.attr("src", "imgs/gyeongnam.jpg");
				}
				else if(ar=="충청북도"){
					iloc.attr("src", "imgs/chungbuk.PNG");
				}
				else if(ar=="충청남도"){
					iloc.attr("src", "imgs/chungnam.PNG");
				}
				else if(ar=="강원도"){
					iloc.attr("src", "imgs/gangwon.PNG");
				}
			});
						
		});
	</script>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 style="font-family: 함초롬돋움; clear: both; margin-left: 30px;">Travel With Me</h1>
	<hr>
	
	<div class="container">
	
		<a href="accomWriteForm.do" data-toggle="tooltip" data-placement="bottom" title="글 작성하기" 
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
					<select name="like" class="custom-select" style="width: 130px">
						<c:forEach var="like" items="${likeList}" varStatus="status">
							<option value="${like.likecode}" >${like.likename}</option>	
						</c:forEach>
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
			<c:forEach var="b" items="${recommList}" varStatus="status">
			  <div class="column">
				<a href="readBoard.do?bnum=${b.bnum}&bkind=A"><img style="width:100%; height: 100%;"></a>
				<div class="content">
					<p class="iarea"><fmt:formatDate value="${b.astartdate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${b.afinishdate}" pattern="yyyy-MM-dd"/>
					<br><input type="hidden" value="${b.aarea}">[${b.aarea}] ${b.btitle}<br>${b.mid} &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp; ${b.breadcount}</p>
				</div>
			  </div>
			</c:forEach>
			</div>
			
		</div>
		
		<!-- 전체 리스트 조회 -->
		<div style="margin-top: 60px">
		<h4 style="font-family: 함초롬돋움; margin-bottom: 15px;">전체여행</h4>
		
			<div class="row">
			<c:forEach var="a" items="${boardList}" varStatus="status">
			  <div class="column" style="margin-bottom: 12px;">
				<a href="readBoard.do?bnum=${a.bnum}&bkind=A"><img style="width:100%; height: 100%;"></a>
				<div class="content">
					<p class="iarea"><fmt:formatDate value="${a.astartdate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${a.afinishdate}" pattern="yyyy-MM-dd"/>
					<br><input type="hidden" value="${a.aarea}">[${a.aarea}] ${a.btitle}<br>${a.mid} &nbsp;&nbsp; <i class='far fa-eye'></i>&nbsp; ${a.breadcount}</p>
				</div>
			  </div>
			</c:forEach>
			</div>
			
		</div>
	</div>

	<div class="pagination" style="margin-top: 25px; margin-left: 400px; text-align: center;">
		<c:if test="${ start != 1}">
			<a href="accomBoardList.do?page=1">&laquo;</a>
			<a href="accomBoardList.do?page=${start-1}">&#8249;</a> 
		</c:if>
		
		<c:forEach var="i" begin="${ start }" end="${ end }" varStatus="status">
			<c:choose>
				<c:when test="${ current == status.index }">
					<a class="active">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="accomBoardList.do?page=${i}<c:if test="${ keyword != null }">&keyword=${keyword}&type=${type}</c:if>" style="font-size: 17px">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			
		<c:if test="${ end != last }">
			<a href="accomBoardList.do?page=${end+1}">&#8250;</a> 
			<a href="accomBoardList.do?page=${last}">&raquo;</a>
		</c:if>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>