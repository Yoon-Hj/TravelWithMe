<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$("#user_id").blur(function() {
	// id = "id_reg" / name = "userId"
	var user_id = $('#user_id').val();
	$.ajax({
		url : '${pageContext.request.contextPath}/user/checkId?id='+ user_id,
		type : 'get',
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);							
			
			if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				} else {
					
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
<body>
<h1>SIGN UP</h1>


<form action="join.do">
	
		<!-- 아이디 -->
       <div class="form-group">
	<label for="user_id">아이디</label>
		<input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID" required>
       <div class="check_font" id="id_check"></div>
       </div>
		
		<div>
			<input type="password" name="pwd" size="20">
		</div>
		
		<div>
			
			<input type="password" name="pwd_check" size="20">
        </div>	
        	
		<div>
		    <input type="text" name="name" size="20">
		</div>

</form>


</body>
</html>