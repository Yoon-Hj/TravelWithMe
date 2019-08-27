<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Travel With Me</title>
<style type="text/css">

 .card {
 	  width: 950px;
 	  margin-left: 100px;
	  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	  padding-top: 16px;
	  padding-bottom: 16px;
	  padding-left: 40px;
	  padding-right: 30px;
	  text-align: left;
	  background-color: #f1f1f1;
	  font-family: '나눔고딕';
  }
  
  .viewCard th{
  	  width: 20%;
  	  padding: 5px;
  }
  
  .viewCard td{
  	 color: #464646;
  }
  
  .btn {
	  border: 2px solid black;
	  background-color: white;
	  color: black;
	  padding: 14px;
	  font-size: 16px;
	  cursor: pointer;
  }
  
 .default:hover {
  	  background: #B5C3C8;
  }
  
  form.comment #cform {
	  padding: 5px;
	  font-size: 17px;
	  border: 1px solid #ccc;
	  border-right: none;
	  float: left;
	  width: 80%;
	  background: #f1f1f1;
	  border-radius: 0px;
	  height: 35px;
	  margin-bottom: 20px;
  }
  
  form.comment button[type=submit] {
	  float: left;
	  width: 100px;
	  height: 35px;
	  padding: 5px;
	  background: white;
	  color: black;
	  font-size: 13px;
	  border-left: none;
	  cursor: pointer;
	  border: 1px solid #ccc;
	  border-left: none;
	  margin-bottom: 20px;
  }
  
  table.commtable {
  	 border-collapse: collapse;
 	 border-spacing: 0;
 	 width: 93%;
  	 border: 1px solid #ddd;
  	 font-family: 'D2Coding';
  	 font-size: 15px;
  }
  
  table.commtable th, td{
  	 padding: 8px;
  	 text-align: left;
  }
  
  table.commtable button{
  	border:none; 
  	font-size: 13px; 
  	background: white; 
  	cursor: pointer;
  }
  
  table#mtable{
  	padding: 5px;
  	text-align: center;
  	margin-left: 40px;
  }
  
  table#mtable th, td{
  	padding: 5px;
  }
  
</style>
</head>
<body>

<script type="text/javascript">

	$(document).ready(function(){
		
		var b = ${accomBoard.bnum};
		var u = '${user}';
		var rlist;
		var pn;
		
		$.ajax({
				url : "getRList.do",
				data : {bnum : b},
				type : "get",
				success : function(data){
							
							rlist = data;
							var flag = false;
							
							//신청, 취소, 관리 버튼
							for(var r in rlist){
								if(u == rlist[r].mid){
									flag = true;
									break;
								}
							}
						 	if(${user == accomBoard.mid}){
								$('#rmbtn').show();
							}else if(flag){
								$('#rcbtn').show();
							}else{
								$('#rbtn').show();
							}
						 	
						 	//가능인원 계산
						 	var an = ${accomBoard.anop};
						 	if(an == 0) {
								$('.nop').text("무관");
							}

							else{
								var rn = 0;
								for(var r in rlist){
									rn += rlist[r].rnop;
								}
								pn = an - rn;
								$('.nop').text(pn+'명');

								if(pn==0){
									$('#rbtn').attr("disabled", "true");
								} 
							}
						 	//rid, rnop 숨겨놓기
						 	var ids = new Array;
						 	var nops = new Array;
						 	for(var r in rlist){
						 		ids.push(rlist[r].rid);
						 		nops.push(rlist[r].rnop);
						 	}
						 	$('#hid').val(ids);
					 		$('#hn').val(nops);
						 	
				}
		});
		
		var user = "<%=(String) session.getAttribute("user")%>";
		if(user == "null"){
			$('#clform').show();
		}else{
			$('#cform').show();
			$('#cbtn').show();
		}
		
		if(user == "null") {
			$('#rbtn').attr("disabled", "disabled");
		}
		
	    //신청인원이 0이 아닐 때, 수정 버튼 누르면 alert 표시
		$('#modiBtn').on('click', function(){
			if(true) 
				alert("신청인원이 존재하여 게시글 수정이 불가합니다.");
		});
	    
	    //답글폼열기
		$('.replyBtn').on('click', function(){
				if(user == "null"){
					alert("로그인이 필요한 서비스입니다.");
				}else{
					
					if($(this).parent('td').parent("tr").next("tr").attr('class')!="cwf"){
						$(this).closest("tr").after("<tr class='cwf'><td>&nbsp;&nbsp;</td><td colspan='2'><input type='text' class='recontent' style='width: 700px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878;'><button type='submit' class='writereBtn'>답글작성</button></td></tr>");
					}else if($(this).parent('td').parent("tr").next("tr").attr('class')=="cwf"){
						$(this).parent('td').parent("tr").next("").remove(); 
					}
				}
		});
		
		//신청취소버튼 - 취소
		$('#rcbtn').on('click', function(){
			var b = ${accomBoard.bnum}; 
			
			 if (confirm("신청을 정말 취소하시겠습니까?") == true){
				 $.ajax({
						url : "cancelRegister.do",
						data : {mid : user,
								bnum : b},
						type : "get",
						success : function(data){
							history.go(0);
							alert("신청취소가 성공적으로 완료되었습니다.")
						}
				  });
			 }else{
				 return;
			 }
		});
		
		//신청관리버튼 누르면 신청자들 정보 조회
		$('#rmbtn').on('click', function(){
			$('#mtable').empty();
			var b = ${accomBoard.bnum};
			var n = $('#hn').val();
			var hi = $('#hid').val();
			
			$.ajax({
				url : "getRegistInfo.do",
				data : {bnum : b},
				type : "get",
				success : function(data){
						if(data == ''){
							$('#mtable').append("<tr><td style='color: #CD1039;'><b>신청자가 존재하지 않습니다.</b><td><tr>");
						}else{
							var rinfo = data;
							var th = "<tr><th>아이디</th><th>이름</th><th>연락처</th><th>신청인원</th><th>거절하기</th></tr>";
							$('#mtable').append(th);
							for(var i=0; i < rinfo.length; i++){
								var hivar = "";
								hivar += hi[i+(3*i)];
								hivar += hi[i+(3*i)+1];
								hivar += hi[i+(3*i)+2];
								var tHTML="<tr><td>"+rinfo[i].MID+"<input type='hidden' value='"+hivar+"'></td><td>"+rinfo[i].MNAME+"</td><td>"+rinfo[i].MCONTACT+"</td><td style='text-align:center'>"+n[2*i]+"명</td><td>"+"<button class='btn rejectbtn' style='border: 2px solid #B5C3C8; width: 80px; font-family: 배달의민족 주아; font-size: 13px;'>거절하기</button></td></tr>";
								$('#mtable').append(tHTML);
						}
					}
				}
			});
		});
		
		//거절하기 버튼
		$(document).on('click', '.rejectbtn', function(){
			
			var b = ${accomBoard.bnum};
			var r = $(this).parent("td").parent("tr").find("td:eq(0)").find("input").val();
			var m = $(this).parent("td").parent("tr").find("td:eq(0)").text();
			var t = $(this).parent("td").parent("tr");
			
			if (confirm("정책에 기재된 사유가 아니면 불이익이 발생할 수 있습니다. 거절을 진행하시겠습니까?") == true){
				 $.ajax({
						url : "rejectRegister.do",
						data : {bnum : b,
								rid : r,
								id : m},
						type : "get",
						success : function(data){
									t.remove();
									if($("#mtable").find("tr:last").find("th:eq(0)").text()=='아이디'){
										$("#mtable").find("tr:last").remove();
										$('#mtable').append("<tr><td style='color: #CD1039;'><b>신청자가 존재하지 않습니다.</b><td><tr>");
									}
									alert("거절이 성공적으로 완료되었습니다.");
						}
				  });
			 }else{
				 return;
			 }			
		});
		
		//두번째 모달 나와줘
		$(document).on('click', '#agreeBtn', function(){
			$('#warningModal1').modal("hide");
			$('#warningModal2').modal("show");
			$('#registerNum').attr("max", pn);
		});
		
		$('#registerNum').focusout(function(){
			
		});
		
		function check(elem){
			var num = elem.value;
			var remain = pn;
			if(num > remain){
				elem.value = remain;
				num = elem.value;
			}
		}
		
/* 		//세번째 모달 나와줘
		$(document).on('click', '#regiBtn', function(){
			$('#warningModal2').modal("hide");
			$('#succModal').modal("show");
		}); */
		
		//신청완료버튼 누르면
		$(document).on('click', '#regiBtn', function(){
			
			var uid = "<%=(String) session.getAttribute("user")%>";
			var wid = $('#writeid').text();
			var b = $('#hiddenbnum').val();
			var rnum = $('#registerNum').val();
			if(rnum=='0'){
				alert("1명이상의 신청인원만 가능합니다.");
				$('#registerNum').val("");
			}else{
				  $.ajax({
						url : "tryRegister.do",
						data : {regId : uid,
								bnum : b,
								nop : rnum,
								mid : wid},
						type : "get",
						success : function(data){
							if(data==""){
								alert("모집 인원을 초과하여 신청이 불가합니다.");
								history.go(0);
							}else{
								$('#contact').html(data);
							}
						}
				  });
				  $('#warningModal2').modal("hide");
				  $('#succModal').modal("show");
			}
		});
		
		//댓글작성
		$('.writecoBtn').on('click', function(){
			var b = $('#hiddenbnum').val();
			$.ajax({
				url : "writeComment.do",
				data : {ccontent : $('.cocontent').val(),
					    bnum : b},
				type : "get",
				success : function(data){
					history.go(0);
				}
			});
		});
		
		//답글작성
		$(document).on('click', '.writereBtn', function(){
			var b = ${accomBoard.bnum};
			var c = $(this).parent("td").parent("tr").prev("tr").find("th").find("input").val();
			$.ajax({
				url : "writeRecomment.do",
				data : {ccontent : $('.recontent').val(),
					    bnum : b,
					    cgrid : c},
				type : "get",
				success : function(data){
					history.go(0);
				}
			});
		});
		
		//댓글삭제
		//댓글 삭제여부가 1이면, '해당 댓글은 삭제되었습니다.'(text) 로 대체
		$('.commDelBtn').on('click', function(){
			  if (confirm("해당 댓글을 삭제하시겠습니까?") == true){   
				var delrow = $(this).siblings("input:hidden").val();
				var tmp = $(this).parents("td");
				  $.ajax({
						url : "delComment.do",
						data : {cnum : delrow},
						type : "get",
						success : function(data){
							tmp.text("");
							tmp.append("<span style='color: #828282; font-size: 13px;'>해당 댓글은 삭제되었습니다.</span>");
						}
				  });
			  }else{   
			      return;
			  }
		});
		
		//중간에 모달 x누르면 그냥 새로고침
		$('.cc').on('click', function(){
			history.go(0);
		});
		
		$('.rfinish').on('click', function(){
			alert("신청이 성공적으로 완료되었습니다.");
			history.go(0);
		});
		
		//게시글 삭제 확인
		$('#delBtn').on('click', function(){
			 var b = ${accomBoard.bnum};
			 if (confirm("해당 게시글을 삭제하시겠습니까?") == true){
					location.href = 'deleteBoard.do?bnum='+b+'&bkind=A';
					alert("삭제가 성공적으로 완료되었습니다.");
			 }else{
				 return;
			 }			
		});
	});
	
</script>

	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 style="font-family: '함초롬돋움'; clear: both; margin-left: 30px;">Travel With Me</h1>
	<hr>
	
	<div class="container">

		<c:if test="${user==accomBoard.mid}">
			<div style="margin-bottom: 10px; margin-left: 860px; font-family: '배달의민족 주아';">
				<input type="button" class="btn default" value="게시글 수정" id="modiBtn" style="border: 2px solid #B5C3C8;">
				<input type="button" class="btn default" value="게시글 삭제" id="delBtn" style="border: 2px solid #B5C3C8;">
			</div>
		</c:if>
		
		<div class="card">
			<table class="viewCard"; style="border: none;">
				<tr>
					<th>작성자</th>
					<td id="writeid"><a class="userId">${accomBoard.mid}</a></td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${accomBoard.btitle}<input type="hidden" id="hiddenbnum" value="${accomBoard.bnum}"></td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>
					<fmt:formatDate value="${accomBoard.astartdate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${accomBoard.afinishdate}" pattern="yyyy-MM-dd"/>
					<c:if test="${accomBoard.astartdate == accomBoard.afinishdate}">
						&nbsp;${accomBoard.atime}
					</c:if>
					</td>
				</tr>
				<tr>
					<th>출발장소 및 시간</th>
					<td>${accomBoard.adepartplace} ${accomBoard.adeparttime}시</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>${accomBoard.aarea}</td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td>
						<c:choose>
							<c:when test="${accomBoard.anop==0}">무관</c:when>
							<c:otherwise>${accomBoard.anop}명</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>취향</th>
					<td>1. 여행테마 - ${accomBoard.likename} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. 선호 이동수단 - ${accomBoard.atransport}</td>
				</tr>
				<tr>
					<th>필수여행지</th>
					<td>${accomBoard.acourse}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${accomBoard.bcontent}</td>
				</tr>
				<tr>
					<th>주요정책</th>
					<td>
						<c:choose>
							<c:when test="${fn:length(policy) != 0}">
							<c:forEach var="p" items="${policy}" varStatus="status">
							<c:if test="${p.pcode==1}">공지된 출발장소 및 시간에 모인 인원과 동행을 진행하며, 특별한 제제사항은 없습니다.</c:if>
							<c:if test="${p.pcode==2}">여행 시작일 기준 <b style="color:#CD1039">${p.pvalue}일 전까지 연락이 되지 않는 분</b>은 작성자 임의로 신청거절을 진행할 수 있습니다.<br></c:if>
							<c:if test="${p.pcode==3}"><b style="color:#CD1039">신뢰지수 ${p.pvalue}점 이하</b>의 회원은 작성자 임의로 신청거절을 진행할 수 있습니다.<br></c:if>
							</c:forEach>
							</c:when>
							<c:otherwise>공지된 출발장소 및 시간에 모인 인원과 동행을 진행하며, 특별한 제제사항은 없습니다.</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</div>
		
		<div style="display: flex; margin-top: 10px; margin-left: 110px; font-family: '배달의민족 주아'">
			<p><input type="button" class="btn default" value="목록으로" style="border: 2px solid #B5C3C8;" onclick="location.href='accomBoardList.do?page=${page}<c:if test="${keyword != null }">&keyword=${keyword}&type=${type}</c:if><c:if test='${sdate!=null}'>&sdate=${sdate}</c:if><c:if test='${fdate!=null}'>&fdate=${fdate}</c:if><c:if test='${likecode!=null}'>&like=${likecode }</c:if>'"></p>
			<p style="float: right; margin-left: 610px;">현재 신청 가능 인원 수 <span class="nop" style="color: #F56E6E; font-size: 20px;"></span> &nbsp;&nbsp;
					<input type="button" id="rmbtn" class="btn default" value="신청관리" data-toggle="modal" data-target="#manageModal" style="border: 2px solid #B5C3C8; width: 80px; display:none;">
					<input type="button" id="rcbtn" class="btn default" value="신청취소" style="border: 2px solid #B5C3C8; width: 80px; display:none;">
					<input type="button" id="rbtn" class="btn default" value="신청" data-toggle="modal" data-target="#warningModal1" style="border: 2px solid #B5C3C8; width: 80px; display:none;">
					<input type="hidden" id="hid"><input type="hidden" id="hn">			
			</p>
		</div>

		<div style="margin-top: 20px; margin-left: 110px; margin-bottom: 20px;">
			<form class="comment">
					<input type="text" id="cform" class="cocontent" class="form-control" placeholder="댓글을 입력하세요." style="width: 830px; display: none;">
					<button type="submit" id="cbtn" class="writecoBtn" style="display: none;">댓글작성</button>
			</form>
			<input type="text" id="clform" class="form-control" placeholder="댓글을 작성하려면 로그인 해주세요." style="width: 930px; height:35px; display: none;">
		</div>
		
		<div style="margin-top:20px; margin-bottom: 20px; margin-left: 110px; width: 90%;">
			<table class="commtable">
			<c:forEach var="comment" items="${commentList}" varStatus="status">
					<tr>
						<c:choose>
						<c:when test="${comment.cnum==comment.cgrid}">
							<th width="100px;" style="text-align: center; font-weight: bold;"><input type="hidden" value="${comment.cgrid}"><a class='userId'>${comment.mid}</a></th>
							<td colspan="2">
								<c:if test="${comment.cdel==0}">${comment.ccontent} 
									<input type="hidden" value="${comment.cnum}">
									<c:if test="${user==comment.mid}"><button class="commDelBtn">×</button></c:if>
								<button style="border:none; font-size: 13px; background: white; cursor: pointer;" class="replyBtn">답글</button>
							</c:if>
							<c:if test="${comment.cdel==1}"><span style="color: #828282; font-size: 13px;">해당 댓글은 삭제되었습니다.</span></c:if>
							</td>
						</c:when>
						<c:otherwise>
							<td>&nbsp;&nbsp;</td>
							<td width="90px;" style="text-align: left; font-weight: bold;"><i class="material-icons" style="font-size: 15px;">&#xe5da;&nbsp;</i><a class='userId'>${comment.mid}</a></td>
							<td width="700px;" style="text-align: left;">
								<c:if test="${comment.cdel==0}">${comment.ccontent}
									<input type="hidden" value="${comment.cnum}">
									<c:if test="${user==comment.mid}"><button class="commDelBtn">×</button></c:if>
								</c:if>
								<c:if test="${comment.cdel==1}"><span style="color: #828282; font-size: 13px;">해당 댓글은 삭제되었습니다.</span></c:if>
							</td>
						</c:otherwise>
						</c:choose>
					</tr>
			</c:forEach>
			</table>
		</div>
		
	</div>
	
	<!-- 신청모달1 -->
	<div class="modal fade" id="warningModal1">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: '배달의민족 도현'">신청시 주의해야할 주요정책</h3>
					<button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '함초롬돋움';">
		    		<c:choose>
						<c:when test="${fn:length(policy) != 0}">
						<c:forEach var="p" items="${policy}" varStatus="status">
						<c:if test="${p.pcode==1}">공지된 출발장소 및 시간에 모인 인원과 동행을 진행하며, 특별한 제제사항은 없습니다.</c:if>
						<c:if test="${p.pcode==2}">여행 시작일 기준 <b style="color:#CD1039">${p.pvalue}일 전까지 연락이 되지 않는 분</b>은 작성자 임의로 신청거절을 진행할 수 있습니다.<br></c:if>
						<c:if test="${p.pcode==3}"><b style="color:#CD1039">신뢰지수 ${p.pvalue}점 이하</b>의 회원은 작성자 임의로 신청거절을 진행할 수 있습니다.<br></c:if>
						</c:forEach>
						</c:when>
						<c:otherwise>공지된 출발장소 및 시간에 모인 인원과 동행을 진행하며, 특별한 제제사항은 없습니다.</c:otherwise>
					</c:choose>
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn" data-dismiss="modal" style="background-color: #FF7A85; color:white; font-family: '배달의민족 주아'">취소</button>
		          <button type="button" class="btn" id="agreeBtn" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아';">동의</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>
 	 		        
	<!-- 신청모달2 -->
	<div class="modal fade" id="warningModal2">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: '배달의민족 도현'">신청 가능 인원 수 : <span class="nop" style="color: #F56E6E; font-size: 25px;"></span></h3>
					<button type="button" class="close cc">×</button>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '함초롬돋움';">
		          신청 인원 수 &nbsp;
					<input type="number" id="registerNum" name="registernum" value="1" min="1" onkeyup="check(this)">명      
					<br>
					<br>
					※ NoShow는 서로의 소중한 시간을 낭비하는 행위입니다.<br>
					서로를 존중하는 성숙한 여행인이 됩시다.
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn" id="regiBtn" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아';">신청완료</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>

	<!-- 신청완료모달 -->
	<div class="modal fade" id="succModal">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: '배달의민족 도현'">신청이 완료되었습니다</h3>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '함초롬돋움';">
		          작성자 연락처 : <span id="contact" style="color: #F56E6E; font-size: 15px;"></span><br><br>
		          
					※ 작성자의 NoShow는 사이트 내 관리자 이메일로 문의바랍니다.<br>
					즐겁게 여행을 마무리할 수 있도록 서로 배려하는 여행인이 됩시다.
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn rfinish" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아';">확인</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>
 	 
 	 <!-- 신청현황 모달 -->
	<div class="modal fade" id="manageModal">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: '배달의민족 도현'">신청현황</h3>
					<button type="button" class="close cc" data-dismiss="modal">×</button>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '나눔고딕';">
					<table id="mtable" style="text-align:center; padding: 5px;">

					</table>
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn cc" data-dismiss="modal" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아'">확인</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>
	
	<jsp:include page="footer.jsp"></jsp:include>
 	 
</body>
</html>