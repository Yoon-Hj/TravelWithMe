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
	 .card {
	  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	  padding-top: 16px;
	  padding-bottom: 16px;
	  padding-left: 60px;
	  text-align: left;
	  background-color: #f1f1f1;
	  width: 80%;
	  margin-left: 150px;
  	}
  	
  	.areaBtn{
  		border: 2px solid #B5C3C8; 
  		width: 80px;
  	}
  	
	.tab {
	  float: left;
	  border: 1px solid #ccc;
	  background-color: inherit;
	  width: 30%;
	  height: 300px;
	}
	
	.tab button {
	  display: block;
	  background-color: ##B5C3C8;
	  color: black;
	  padding: 22px 16px;
	  width: 100%;
	  border: none;
	  outline: none;
	  text-align: left;
	  cursor: pointer;
	  transition: 0.3s;
	  font-size: 17px;
	}
	
	.tab button.active {
	  background-color: #ccc;
	}
		
/* 	#searchDiv{
		border : solid 1px;
		height : 205px;
		width : 800px;
		grid-template-columns:auto auto auto;
	} */
</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<h1 style="font-family: '함초롬돋움'; clear: both; margin-left: 30px;">ATTRACTION INFO</h1><hr>
	<input type="hidden" id="apiType" value="${apiType }">

<div class="container">

	<div class="card" style="font-family: '함초롬돋움';">
	
	<div class="tab">
	 	 <button class="tablinks" id="keywordFormBtn" onclick="open(event, 'keywordForm')">키워드 검색</button>
		 <button class="tablinks" id="festivalFormBtn" onclick="open(event, 'festivalForm')">축제 검색</button>
	  	 <button class="tablinks" id="areaFormBtn" onclick="open(event, 'areaForm')">지역 검색</button>
	</div>
	
	
<!-- 
		<div style="width : 180px;height : 200px;float:left;display : inline;">
			<table style="text-align:center;">
				<tr>
					<td style="width:180px ; height:66px;">
						<input type="button" id="keywordFormBtn" value="키워드 검색" style="width : 180px;height:66px; background-color: #B5C3C8; border: 0px; color:white; font-size: 17px; font-weight: bold;">
					</td>
				</tr>
				<tr>
					<td style="height:66px">
					<input type="button" id="festivalFormBtn" value="축제 검색" style="width : 180px;height:66px; background-color: transparent; border: 0px; font-size: 17px; font-weight: bold;">
					</td> 
				</tr>
				<tr>
					<td style="height:66px">
					<input type="button" id="areaFormBtn" value="지역 검색" style="width : 180px;height:66px; background-color: transparent; border: 0px; font-size: 17px; font-weight: bold;">
					</td>
				</tr>
			</table>
		</div>
-->
		
		<div id="keywordForm" style="display : inline;" class="tabcontent">
			    	<input type="text" class="form-control" id="keyword" style="width: 300px;" placeholder="Search"
			    	value="<c:if test="${keyword != null}">${keyword}</c:if>">
			    	<button id="searchKeyword" class="btn" type="button" style="background-color: #B5C3C8;">검색</button>
			<input type="hidden" id="storeKeyword" value="<c:if test="${keyword != null}">${keyword}</c:if>">
		</div>
		
		<div id="festivalForm" class="tabcontent" style="width : 616px; height : 196px; float:left;display : inline; display:none;">
			<div class="input-group mb-3" style="margin:auto;">
			    	<form action="attractionInfo.do">
					<input type="date" name="eventStartDate" id="sDate" value="${eventStartDate }" required>
					<input type="date" name="eventEndDate" id="eDate" value="${eventEndDate }">
					<select name="area" id="area">
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
					<button id="searchKeyword" class="btn btn-success" type="submit">검색</button>
					<input type="hidden" name="type" value="2">
					<input type="hidden" id="storeArea" value="${area}">
					<input type="hidden" id="storeSdate" value="${eventStartDate }">
					<input type="hidden" id="storeEdate" value="${eventEndDate }">
					</form>
			</div>
		</div>
		
		
		
		<div id="areaForm" class="tabcontent" style="width : 616px; height : 196px; float:left;display : inline; display:none;">
			<div style="margin:auto; width : 200px;">
			    	<button class="areaBtn" value="1">서울</button>
						<button class="areaBtn" value="31" >경기도</button>
						<button class="areaBtn" value="32">강원도</button>
						<button class="areaBtn" value="33">충청북도</button>
						<button class="areaBtn" value="34">충청남도</button><BR>
						<button class="areaBtn" value="37">전라북도</button>
						<button class="areaBtn" value="38">전라남도</button>
						<button class="areaBtn" value="35">경상북도</button>
						<button class="areaBtn" value="36">경상남도</button>
						<button class="areaBtn" value="39">제주도</button>
			</div>
		</div>
		
	</div>
	
	
	
	
	<BR><BR>
	
	
	
	
	
	<table>
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
								<image src="${i.firstimage }" style="width:160px; height:160px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:when>
							<c:otherwise>
							<image src="imgs/noImage.jpg" style="width:160px; height:160px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td style="width : 160px; height : 100px;"><p>${i.title }</p></td>
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
								<image src="${i.firstimage }" style="width:160px; height:160px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:when>
							<c:otherwise>
							<image src="imgs/noImage.jpg" style="width:160px; height:160px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td style="width : 160px; height : 100px;"><p>${i.title }</p></td>
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
								<image src="${i.firstimage }" style="width:160px; height:160px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:when>
							<c:otherwise>
							<image src="imgs/noImage.jpg" style="width:160px; height:160px; cursor:pointer;"
								onclick="viewDetail('${i.contentid}', '${i.contenttypeid}', '${i.title }')"/>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td style="width : 160px; height : 100px;"><p>${i.title }</p></td>
					</tr>
				</table>
			</td>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</tr>
	</table>
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
					<button class="PageNavi" value="${i}">${i }</button>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${endpage < lastpage }">
			<button class="PageNavi" value="${endpage + 1}">다음</button>
			<button class="PageNavi" value="${lastpage}">마지막</button>
		</c:if>
	
	</c:if>
</div>


</body>
</html>