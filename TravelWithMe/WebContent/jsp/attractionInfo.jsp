<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js">
</script>
<script src="js/attraction.js?v=<%=System.currentTimeMillis() %>"></script>

<style type="text/css">
	h1{
		margin:10%;
	}
	div{
		border : solid 1px;
	}
	#searchDiv{
		height : 200px;
		width : 800px;
		grid-template-columns:auto auto auto;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1>ATTRACTION INFO</h1><hr>
<input type="hidden" id="apiType" value="${apiType }">



<center>
<div id="searchDiv">
	<div style="width : 180px;height : 200px;float:left;display : inline;">
		<table style="text-align:center;">
			<tr>
				<td style="width:180px ; height:66px;">
					<input type="button" id="keywordFormBtn" value="키워드 검색" style="width : 180px;height:66px; background-color: #58ACFA; border: 0px; color:white; font-size: 15px; font-weight: bold;">
				</td>
			</tr>
			<tr>
				<td style="height:66px">
				<input type="button" id="festivalFormBtn" value="축제 검색" style="background-color: transparent; border: 0px; font-size: 15px; font-weight: bold;">
				</td>
			</tr>
			<tr>
				<td style="height:66px">
				<input type="button" id="areaFormBtn" value="지역 검색" style="background-color: transparent; border: 0px; font-size: 15px; font-weight: bold;">
				</td>
			</tr>
		</table>
	</div>
	<div id="keywordForm" style="width : 616px; height : 196px; float:left;display : inline; position : relative">
		<div class="input-group mb-3" style="position:absolute;margin:auto; width : 200px; top:50%; left:50%;">
		    	<input type="text" class="form-control" id="keyword" placeholder="Search"
		    	value="<c:if test="${keyword != null}">${keyword}</c:if>">
		    	<div class="input-group-append">
		    	  <button id="searchKeyword" class="btn btn-success" type="button">Go</button>  
		    	</div>
		</div>
		<input type="hidden" id="storeKeyword" value="<c:if test="${keyword != null}">${keyword}</c:if>">
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


<h1>시작페이지 : ${startpage }</h1>
<h1>끝페이지 : ${endpage }</h1>
<h1>마지막 페이지 : ${lastpage }</h1>
<h1>현재 페이지 : ${pageNo }</h1>
</center>


<HR>




<hr>
<h3>축제 검색</h3>
<form action="festivalSearch.do">
<input type="date" name="eventStartDate" required>
<input type="date" name="eventEndDate">
<select name="area">
	<option value="">선택</option>
	<option value="1">서울</option>
	<option value="2">인천</option>
	<option value="3">대전</option>
	<option value="4">대구</option>
	<option value="5">광주</option>
	<option value="6">부산</option>
	<option value="7">울산</option>
	<option value="31">경기도</option>
	<option value="32">강원도</option>
	<option value="33">충청북도</option>
	<option value="34">충청남도</option>
	<option value="35">경상북도</option>
	<option value="36">경상남도</option>
	<option value="37">전라북도</option>
	<option value="38">전라남도</option>
	<option value="39">제주도</option>
</select>
<input type="submit" value="검색">
</form>

<hr>
<h3>지역 검색</h3>

<button class="areaBtn" value="1">서울</button>
<button class="areaBtn" value="31">경기도</button>
<button class="areaBtn" value="32">강원도</button>
<button class="areaBtn" value="33">충청북도</button>
<button class="areaBtn" value="34">충청남도</button><BR>
<button class="areaBtn" value="37">전라북도</button>
<button class="areaBtn" value="38">전라남도</button>
<button class="areaBtn" value="35">경상북도</button>
<button class="areaBtn" value="36">경상남도</button>
<button class="areaBtn" value="39">제주도</button>

</body>
</html>