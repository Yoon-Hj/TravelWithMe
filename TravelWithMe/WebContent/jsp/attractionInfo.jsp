<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Travel With Me</title>
<script src="js/attraction.js?v=<%=System.currentTimeMillis() %>"></script>

<style type="text/css">
 	h1{
		margin:10%;
	}
	
	#searchDiv{
		border : solid 2px #828282;
		height : 205px;
		width : 800px;
		grid-template-columns:auto auto auto;
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

	<jsp:include page="header.jsp"></jsp:include>
	<h1 style="font-family: '함초롬돋움'; clear: both; margin-left: 30px; margin-top: 10px;">ATTRACTION INFO</h1><hr>
	<input type="hidden" id="apiType" value="${apiType }">

<div class="containcer">

<div id="searchDiv" style="margin-left: 240px;">

	<div style="width : 180px;height : 200px;float:left;display : inline;">
		<table style="text-align:center; border: 1px solid #828282; font-family: '함초롬돋움;'">
			<tr>
				<td style="width:180px ; height:66px;">
					<input type="button" id="keywordFormBtn" value="키워드 검색" style="width : 180px;height:66px; background-color: #58ACFA; border: 0px; color:white; font-size: 15px; font-weight: bold;">
				</td>
			</tr>
			<tr>
				<td style="height:66px">
				<input type="button" id="festivalFormBtn" value="축제 검색" style="width : 180px;height:66px; background-color: transparent; border: 0px; font-size: 15px; font-weight: bold;">
				</td>
			</tr>
			<tr>
				<td style="height:66px">
				<input type="button" id="areaFormBtn" value="지역 검색" style="width : 180px;height:66px; background-color: transparent; border: 0px; font-size: 15px; font-weight: bold;">
				</td>
			</tr>
		</table>
	</div>
	
	<div id="keywordForm" style="width : 616px; height : 196px; display : inline;">
		<div class="input-group mb-3" style="margin: auto; width : 200px;">
		<div class="tabcontent" id="keywordForm">
		    <input type="text" id="keyword" style="width: 300px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;" placeholder="Search"
			    	value="<c:if test="${keyword != null}">${keyword}</c:if>">
			<button id="searchKeyword" class="btn" type="button" style="background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아';">검색</button>
		</div>		
		</div>
			<input type="hidden" id="storeKeyword" value="<c:if test="${keyword != null}">${keyword}</c:if>">
	</div>
	
	<div id="festivalForm" style="width : 616px; height : 196px; float:left;display : inline; display:none;">
		<div class="input-group mb-3" style="margin:auto;"> 
		<div class="tabcontent" id="festivalForm">
		    	<form action="attractionInfo.do">
				<input type="date" name="eventStartDate" id="sDate" value="${eventStartDate }" required style="width: 200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;"> ~
				<input type="date" name="eventEndDate" id="eDate" value="${eventEndDate }" style="width: 200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">
				<select name="area" id="area" style="width: 150px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;">
					<option value="" <c:if test="${area == ''}">selected</c:if>>선택</option>
					<option value="1" <c:if test="${area == 1}">selected</c:if>>서울</option>
					<option value="2" <c:if test="${area == 2}">selected</c:if>>인천</option>
					<option value="3" <c:if test="${area == 3}">selected</c:if>>대전</option>
					<option value="4" <c:if test="${area == 4}">selected</c:if>>대구</option>
					<option value="5" <c:if test="${area == 5}">selected</c:if>>광주</option>
					<option value="6" <c:if test="${area == 6}">selected</c:if>>부산</option>
					<option value="7" <c:if test="${area == 7}">selected</c:if>>울산</option>
					<option value="31" <c:if test="${area == 31}">selected</c:if>>경기도</option>
					<option value="32" <c:if test="${area == 32}">selected</c:if>>강원도</option>
					<option value="33" <c:if test="${area == 33}">selected</c:if>>충청북도</option>
					<option value="34" <c:if test="${area == 34}">selected</c:if>>충청남도</option>
					<option value="35" <c:if test="${area == 35}">selected</c:if>>경상북도</option>
					<option value="36" <c:if test="${area == 36}">selected</c:if>>경상남도</option>
					<option value="37" <c:if test="${area == 37}">selected</c:if>>전라북도</option>
					<option value="38" <c:if test="${area == 38}">selected</c:if>>전라남도</option>
					<option value="39" <c:if test="${area == 39}">selected</c:if>>제주도</option>
				</select>
				<br>
				<button id="searchKeyword" class="btn" type="submit" style="background-color: #B5C3C8; border: 0px; font-size: 17px; color:white; font-family: '배달의민족 주아';">검색</button>
				<input type="hidden" name="type" value="2">
				<input type="hidden" id="storeArea" value="${area}">
				<input type="hidden" id="storeSdate" value="${eventStartDate }">
				<input type="hidden" id="storeEdate" value="${eventEndDate }">
				</form>
		</div>
		</div>
	</div>

	
	<div id="areaForm" style="width : 616px; height : 196px; float:left;display : inline; display:none;">
		<div class="input-group mb-3" style="width : 200px; font-family: 'D2Coding'">
		<div class="tabcontent" id="areaForm">
		    	<button class="areaBtn btn" value="1" style="border: 2px solid #B5C3C8; width: 100px; margin-left: 20px;">서울</button>
					<button class="areaBtn btn" value="31" style="border: 2px solid #B5C3C8; width: 100px; margin-left: 20px;">경기도</button>
					<button class="areaBtn btn" value="32" style="border: 2px solid #B5C3C8; width: 100px; margin-left: 20px;">강원도</button>
					<button class="areaBtn btn" value="33" style="border: 2px solid #B5C3C8; width: 100px; margin-left: 20px;">충청북도</button>
					<button class="areaBtn btn" value="34" style="border: 2px solid #B5C3C8; width: 100px; margin-left: 20px;">충청남도</button><br>
					<button class="areaBtn btn" value="37" style="border: 2px solid #B5C3C8; width: 100px; margin-left: 20px;">전라북도</button>
					<button class="areaBtn btn" value="38" style="border: 2px solid #B5C3C8; width: 100px; margin-left: 20px;">전라남도</button>
					<button class="areaBtn btn" value="35" style="border: 2px solid #B5C3C8; width: 100px; margin-left: 20px;">경상북도</button>
					<button class="areaBtn btn" value="36" style="border: 2px solid #B5C3C8; width: 100px; margin-left: 20px;">경상남도</button>
					<button class="areaBtn btn" value="39" style="border: 2px solid #B5C3C8; width: 100px; margin-left: 20px;">제주도</button>
		</div>
	</div>
	</div>

	
	
</div>




<BR><BR>




<div style="margin-left: 235px;">
	<table style="font-family: '함초롬돋움';">
	<tr>
	<c:forEach var="i" items="${ilist }" varStatus="s">
		<c:choose>
			<c:when test="${s.count % 4 == 0 }">
			<td>
				<table>
					<tr>
						<td style="width : 200px; text-align:center;">
						<c:choose>
							<c:when test="${i.firstimage != null }">
								<image src="${i.firstimage }" style="width:200px; height:100px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:when>
							<c:otherwise>
							<image src="imgs/noImage.gif" style="width:200px; height:100px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td style="width : 200px; height : 90px; text-align: center;">${i.title }</td>
					</tr>
				</table>
				</tr>		
			</td>
			</c:when>
			<c:when test="${s.count  == 5 }">
			<tr>		
			<td>
				<table>
					<tr>
						<td style="width : 200px; text-align:center;">
						<c:choose>
							<c:when test="${i.firstimage != null}">
								<image src="${i.firstimage }" style="width:200px; height:100px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:when>
							<c:otherwise>
							<image src="imgs/noImage.gif" style="width:200px; height:100px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td style="width : 200px; height : 90px; text-align: center;">${i.title }</td>
					</tr>
				</table>
			</td>
			</c:when>
			<c:otherwise>
			<td>
				<table>
					<tr>
						<td style="width : 200px; text-align:center;">
						<c:choose>
							<c:when test="${i.firstimage != null }">
								<image src="${i.firstimage }" style="width:200px; height:100px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:when>
							<c:otherwise>
							<image src="imgs/noImage.gif" style="width:200px; height:100px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td style="width : 200px; height : 90px; text-align: center;">${i.title }</td>
					</tr>
				</table>
			</td>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</tr>
	</table>
</div>

<!-- 페이징 -->
<div class="pagination" style="margin-top: 25px; margin-left: 400px; text-align: center;  margin-bottom: 30px;">
	<c:if test="${apiType != '0' }">
	
		<c:if test="${startpage != 1 }">
			<button class="PageNavi" value="1">처음</button>
			<button class="PageNavi" value="${startpage - 1}">이전</button>
		</c:if>
		
		<c:forEach var="i" begin="${startpage }" end="${endpage }">
			<c:choose>
				<c:when test="${pageNo == i }">
					<a style="color:red">${i }</a>
				</c:when>
				<c:otherwise>
					<button class="PageNavi" value="${i}">${i}</button>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${endpage < lastpage }">
			<button class="PageNavi" value="${endpage + 1}">다음</button>
			<button class="PageNavi" value="${lastpage}">마지막</button>
		</c:if>
	
	</c:if>
</div>

</div>

</body>
</html>