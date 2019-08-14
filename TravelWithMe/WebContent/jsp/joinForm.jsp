<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js">
</script>
<script>

$(document).ready(function(){

$("#mid").blur(function() {
	
	var mid = $('#mid').val();
	$.ajax({
		url : 'checkId.do?id='+ mid,
		type : 'get',
		success : function(data) {
			if (data == 1) {
				// 1 : 아이디가 중복되는 문구
				$("#id_check").text("중복된 아이디입니다.");
				$("#id_check").css("color", "red");
				
			} 
		
		else if(data == 0){
			$("#id_check").text("사용가능한 아이디입니다.");
			$("#id_check").css("color", "green");
		;
		}
		
		else {
				
				if(idJ.test(mid)){
					// 0 : 아이디 길이 / 문자열 검사
					$("#id_check").text("");
			
		
				} else if(mid == ""){
					
					$('#id_check').text('아이디를 입력해주세요 :)');
					$('#id_check').css('color', 'red');
								
					
				} else {
					
					$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
					$('#id_check').css('color', 'red');
					
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
			$('#pwd_check').text('비밀번호가 일치하지 않습니다.)');
			$('#pwd_check').css('color', 'red');
		
		}
		else if(mpw == mpw_check){
			$('#pwd_check').text('비밀번호가 일치합니다.)');
			$('#pwd_check').css('color', 'green');
		
		};
	});
	
	
	
	
});



//Get the modal
//var modal = document.getElementById("myModal");
var modal = $('#myModal');
function validate() {
	

	
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	
	if($("#mid").val() == ""){
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
	
    //이름의 유효성 검사
    if(!getCheck.test($("#mid").val())){
      alert("ID형식에 맞춰서 입력하세요");
      $("#mid").val("");
      $("#mid").focus();
      return false;
    }

    //비밀번호
    if(!getCheck.test($("#mpw").val())) {
    alert("형식에 맞춰서 PW를 입력하세요");
    $("#mpw").val("");
    $("#mpw").focus();
    return false;
    }

    //아이디랑 비밀번호랑 같은지
    if ($("#mid").val()==($("#mpw").val())) {
    alert("비밀번호가 ID와 동일합니다.");
    $("#mid").val("");
    $("#mid").focus();
  }

    //비밀번호 똑같은지
    if($("#mpw").val() != ($("#mpw_check").val())){ 
    alert("비밀번호가 일치하지 않습니다.");
    $("#mpw").val("");
    $("#mpw_check").val("");
    $("#mpw").focus();
    return false;
   }
	
	//modalBlock();
	$('#myModal').css("display", "block");
	
   
	return true;
	
}


function test(){
	
	$('#myModal').css("display", "none");
}


</script>

 
      

</head>
<style>
.all {
	width: 800px;
	position: absolute;
	top: 15%;
	left: 25%;
	margin-left:;
}

.title {
	width: 400px;
	position: absolute;
	top: 0%;
	left: 25%;
	margin-left:;
}
</style>

<body>
	<h1 class="title">SIGN UP</h1>


	<form name="join"action="joinMember.do" method="post">

		<div class="all">
			<div>
				<input type="text" class="form-control" id="mid" name="mid"
					placeholder="ID" maxlength="12">
				<div class="check_font" id="id_check"></div>
			</div>

		

			<div>
				<input type="password" class="form-control" id="mpw"
					name="mpw" placeholder="비밀번호" maxlength="12">
				<div class="check_font" id="pwd_check1"></div>
			</div>

			<div>
				<input type="password" class="form-control" id="mpw_check"
					name="mpw_check" placeholder="비밀번호 확인">
				<div class="check_font" id="pwd_check"></div>
			</div>

        
			<div>
				<input type="text" class="form-control" id="mname"
					name="mname" placeholder="성명">
				<div class="check_font" id="name_check"></div>
			</div>

			<table>
				<tr>
					<td width=15%>대표 연락처</td>
					
					<td width=1%><input type="radio" name="contact" checked="checked" value="phone" >휴대폰 
					</td>
					
					<td width=10%>
					<input type="radio" name="contact" value="email" >email
						</td>
						
						<td width=17%> <input type="radio" name="contact" value="kakao" /> 카카오 아이디</td>

					<td><br> <br> <br></td>
                 </tr>
                
                <tr>
					<td>
						<div style="width: 200px;">
							<input type="text" name="mcontact" id="mcontact">
						</div>
					</td>
				</tr>

				<tr>
					<td width=55%>※동행 및 가이드 매칭 참여시에 사용될 연락처이니 신중</td>
				</tr>

				<tr>
					<td>생년월일</td>
					<td><input type="date" id="mbirth" name="mbirth2"></td>
				</tr>

				<tr>
					<td>성별</td>
					<td>
					<input type="radio" id="mgender" name="mgender" checked="checked"
						value="male" /> 남자 
						<input type="radio" name="mgender" value="female" />
						여자</td>
						
				</tr>

               	<tr>
               	<td><input type="button" value="다음으로" onclick="validate()" id="nextChoice" >
               	</td>
               	</tr>
			</table>	
		

<!-- The Modal -->
<div id="myModal" class="modal" style="display:none">

  <!-- Modal content -->
  <div class="modal-content">
    <!-- <span class="close" id ="close"></span> -->
    <button type="button" id="close" onclick="test()">&times;</button>
<table>
<tr>
<td>  <h1>당신의 여행 취향은?</h1> </td>
</tr>

<tr>
<td>
  <h2>(최대 3개)</h2>
</td>
</tr>

<tr><td><h2>(선택사항) 선택을 원하지 않으실 경우, 바로 회원가입을 눌러주세요.</h2></td></tr>
                     
 
<tr>
<td>
						<div name="likecheck">
<input type="checkbox" name="likecode" onClick="count_ck(this);" value="shop" />쇼핑 
<input type="checkbox" name="likecode" onClick="count_ck(this);" value="taste" />맛집
<input type="checkbox" name="likecode" onClick="count_ck(this);" value="alcohol" />주류
<input type="checkbox" name="likecode" onClick="count_ck(this);" value="picture" />사진
<input type="checkbox" name="likecode" onClick="count_ck(this);" value="history" />역사(유적지 및 박물관)
<input type="checkbox" name="likecode" onClick="count_ck(this);" value="festival" />축제
<input type="checkbox" name="likecode" onClick="count_ck(this);" value="experience" />체험
						</div>
</td>
</tr>

                <tr>
                <td><input type="submit" value="회원가입"></td>
                </tr>
                
</table>
</div>
</div>
	</form>



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