<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js">


$("#user_id").blur(function() {
	// id = "id_reg" / name = "userId"
	var user_id = $('#user_id').val();
	$.ajax({
		url : 'checkId.do?id='+ user_id,
		type : 'get',
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);							
			
			if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("중복된 아이디입니다.");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				} 
			
			else if(data == 0){
				$("#id_check").text("사용가능한 아이디입니다.");
				$("#id_check").css("color", "green");
				$("#reg_submit").attr("disabled", true);
			}
			
			else {
					
					if(idJ.test(user_id)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#id_check").text("");
						$("#reg_submit").attr("disabled", false);
			
					} else if(user_id == ""){
						
						$('#id_check').text('아이디를 입력해주세요 :)');
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);				
						
					} else {
						
						$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);
					}
					
				}
			}, error : function() {
					console.log("실패");
			}
		});
	});
	</script>



</head>
<style>
.all { width: 800px; position: absolute; top:15%; left: 25%; margin-left: ;}
.title { width: 400px; position: absolute; top:0%; left: 25%; margin-left: ; }
</style>

<body>
<h1 class="title">SIGN UP</h1>


<form action="testnext.do">
	
		<div class="all">
   <div>
		<input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID" required>
       <div class="check_font" id="id_check"></div>
       </div>
		
		
	    <div>
		<input type="text" class="form-control" id="user_pwd" name="user_pwd" placeholder="비밀번호" required>
       <div class="check_font" id="pwd_check1"></div>
       </div>
		
		 <div>
		<input type="text" class="form-control" id="user_pwdcheck" name="user_pwdcheck" placeholder="비밀번호 확인" required>
       <div class="check_font" id="pwd_check2"></div>
       </div>
       
		 <div>
		<input type="text" class="form-control" id="user_name" name="user_name" placeholder="성명" required>
       <div class="check_font" id="name_check"></div>
       </div>
       
        	<table>
        	<tr>
        	<td>대표 연락처</td>
        <td>
          <input type="radio" name="contact" checked="checked" value="phobe" /> 휴대폰
          <input type="radio" name="contact" value="email" /> 이메일
          <input type="radio" name="contact" value="cacao" /> 카카오 아이디
        </td>
        </tr>
        <tr>
        <td>※동행 및 가이드 매칭 참여시에 사용될 연락처이니 신중</td>
        </tr>
        <tr>
        <td>생년월일</td>
        <td><input type="date" name="date"></td>
        </tr>
        
        <tr>
        <td>성</td>
        <td>
         <input type="radio" name="sex" checked="checked" value="male" /> 남
          <input type="radio" name="sex" value="female" /> 여
        </td>
        </tr>
        
        <tr>
			<td colspan="2">
			<input type="submit" value="다음으로">
			</td>
		</tr>
        	</table>
        	</div>
     </form>


</body>
</html>