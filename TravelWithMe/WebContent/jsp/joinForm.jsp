<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang='en'>
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
<title>Travel With Me</title>
</head>
<script>

	$(document).ready(function(){
	
	$("#mid").blur(function() {
		
		var mid = $('#mid').val();
		var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		
		$.ajax({
			url : 'checkId.do?id='+ mid,
			type : 'get',
			success : function(data) {
				if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("중복된 아이디입니다.");
					$("#id_check").css("color", "red");
					$("#id_check").css("font-size", "13px");
					
				} 
			
			else if(data == 0 && mid != "" && getCheck.test($("#mid").val())){
				$("#id_check").text("사용가능한 아이디입니다.");
				$("#id_check").css("color", "green");
				$("#id_check").css("font-size", "13px");
			
			}
				
			else if(!getCheck.test($("#mid").val())){
				$("#id_check").text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
				$("#id_check").css("color", "red");
				$("#id_check").css("font-size", "13px");
			
			}
			
			else {
					if(mid == ""){
						$('#id_check').text('아이디를 입력해주세요.');
						$('#id_check').css('color', 'red');
						$("#id_check").css("font-size", "13px");			
					} 
				}
			}
		});
	
	});
		
	});


	$(document).ready(function(){
		$("#mpw_check").blur(function() {
			var mid = $('#mid').val();
			
			var mpw = $('#mpw').val();
			var mpw_check = $('#mpw_check').val();
			
			if(mpw != mpw_check){
				$('#pwd_check').text('비밀번호가 일치하지 않습니다.');
				$('#pwd_check').css('color', 'red');
				$('#pwd_check').css("font-size", "13px");
			}
			else if(mpw == mpw_check){
				$('#pwd_check').text('비밀번호가 일치합니다.');
				$('#pwd_check').css('color', 'green');
				$('#pwd_check').css("font-size", "13px");
			};
		});
		
	});

	var modal = $('#likeModal');
	
	function validate() {
		
	
		var mid = $('#mid').val();
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	  
		$.ajax({
			url : 'checkId.do?id='+ mid,
			type : 'get',
			success : function(data) {
				if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					alert("아이디 중복을 확인하세요.");
			        $("#mid").focus();
			        
			      }
				return false;
				} 
		
		});
		
		if(mid == ""){
	        alert("아이디를 입력하세요.");
	        $("#mid").focus();
	        return false;
	      }
		
		if($("#mpw").val() == ""){
	        alert("비밀번호를 입력하세요.");
	        $("#mpw").focus();
	        return false;
	      }
		
		if($("#mpw_check").val() == ""){
	        alert("비밀번호 확인을 입력하세요.");
	        $("#mpw_check").focus();
	        return false;
	      }
		
		 //비밀번호 똑같은지
	    if($("#mpw").val() != ($("#mpw_check").val())){ 
	    alert("비밀번호가 일치하지 않습니다.");
	    $("#mpw").val("");
	    $("#mpw_check").val("");
	    $("#mpw").focus();
	    return false;
	   }
		
		if($("#mname").val() == ""){
	        alert("이름을 입력하세요.");
	        $("#mname").focus();
	        return false;
	      }
		
		
		if($("#mcontact").val() == ""){
	        alert("대표 연락처를 입력하세요.");
	        $("#mcontact").focus();
	        return false;
	      }
		if($("#mbirth").val() == ""){
	        alert("날짜를 입력하세요.");
	        $("#mbirth").focus();
	        return false;
	      }
		if($("#mgender").val() == ""){
	        alert("성별을 입력하세요.");
	        $("#mgender").focus();
	        return false;
	      }
		
	    //id의 유효성 검사
	    if(!getCheck.test($("#mid").val())){
	      alert("ID형식에 맞춰서 입력하세요");
	      $("#mid").val("");
	      $("#mid").focus();
	      return false;
	    }
	
	    //비밀번호
	    if(!getCheck.test(mid)) {
	    alert("형식에 맞춰서 PW를 입력하세요");
	    $("#mpw").val("");
	    $("#mpw").focus();
	    return false;
	    }
	
	    //아이디랑 비밀번호랑 같은지
	    if (mid==($("#mpw").val())) {
	    alert("비밀번호가 ID와 동일합니다.");
	    $("#mid").val("");
	    $("#mid").focus();
	  }
	
		
		//modalBlock();
		$('#likeModal').css("display", "block");
		return true;
	}

	
	function test(){
		$('#likeModal').css("display", "none");
	}


</script>
</head>
<style>
	.form-control {
		margin-bottom: 10px;
	}
</style>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 style="font-family: '함초롬돋움'; clear: both; margin-left: 370px;">Sign Up</h1>
	<hr>
	
	<div class="container" style="margin-bottom: 90px;">

			<form name="join" action="joinMember.do" method="post">
			
			<div class="form-group" style="margin-left: 280px; margin-top: 30px;">
				
				<label><b>아이디</b></label>
				<input type="text" class="form-control" id="mid" name="mid"
						placeholder="Enter ID" maxlength="12" style="width: 600px;">
				<div class="check_font" id="id_check"></div>

				<label><b>비밀번호</b></label>
					<input type="password" class="form-control" id="mpw" name="mpw"
						placeholder="Enter Password" style="width: 600px;">
				<div class="check_font" id="pwd_check1"></div>

				<label><b>비밀번호 확인</b></label>
				<input type="password" class="form-control" id="mpw_check"
						name="mpw_check" placeholder="Enter Password again" style="width: 600px;">
				<div class="check_font" id="pwd_check"></div>
				
				<label><b>성명</b></label>
				<input type="text" class="form-control" id="mname" name="mname"
						placeholder="Enter Name" style="width: 600px;">
				<div class="check_font" id="name_check"></div>
					
				<label><b>대표 연락처</b></label><br>
				<input type="radio" name="contact" checked="checked" value="phone" /> 휴대폰 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="contact" value="email" /> email &nbsp;&nbsp;&nbsp;
				<input type="radio" name="contact" value="kakao" /> 카카오 아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="mcontact" id="mcontact" style="width: 300px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; margin-bottom: 5px;"> 
				<p style="color: #828282;">※ 동행 및 가이드 신청시에 사용될 연락처이니 신중하게	기입바랍니다.</p>
				
				<label><b>생년월일</b></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="date" id="mbirth" name="mbirth2" style="width: 300px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; margin-bottom: 10px;">
				
				<br>
				
				<label><b>성별</b></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" id="mgender" name="mgender" checked="checked" value="male" /> 남자
				<input type="radio" name="mgender" value="female" /> 여자
				
				<br><br>
				
				<input type="button" class="btn btn-primary btn-block" style="width: 600px; color:black; border: none; background-color: #D3D3D6; font-family: '배달의민족 주아';" value="다음으로" onclick="validate()" id="nextChoice">

			</div>
	</div>
	
	<div class="modal" id="likeModal"  style="display:none">
    	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: '배달의민족 도현'">당신의 여행취향은? (최대 3개)</h3>
					<!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center; font-family: '나눔고딕';">
		         <a style="font-size:14px; font-family: '함초롬돋움'; float: left;">(선택) 선택을 원하지 않으실 경우, 바로 회원가입을 눌러주세요.</a><br>
						<c:forEach var="codelike" items="${codeList}">
							<input type="checkbox" name="likecode" onClick="count_ck(this)" value="${codelike.likecode}" /> ${codelike.likename} &nbsp;
						</c:forEach>
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <input type="submit" class="btn" data-dismiss="modal" style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아'" value="회원가입">
		        </div>
		        
      		</div>
    	</div>
 	 </div>
		
	</form>
		
	<jsp:include page="footer.jsp"></jsp:include>
		
<script>
	function count_ck(obj){
		var chkbox = document.getElementsByName("likecode");
		var chkCnt = 0;
		for(var i=0;i<chkbox.length; i++){
			if(chkbox[i].checked){
				chkCnt++;
			}
		}
	
		if(chkCnt>3){
			alert("3개까지 선택 가능합니다.");
			obj.checked = false;
			return false;
		}
	}
</script>

</body>
</html>