<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<script language="javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js">
</script>
<script>
$(document).ready(function(){
$("#findid").on('click',function() {
	
	var name = $('#findName1').val();
	var mail = $('#findMail1').val();
	
	if(name == "" || mail == ""){
		alert("빈칸을 입력해주세요.");
	}
	eles{
	$.ajax({
		url : 'findId.do',
		data : {
			name : name,
			mail : mail
		},
		
		type : 'post',
		success : function(data) {
			if (data == null) {
				alert("입력하신 내용과 일치하는 정보가 없습니다.");
				
				} 
			
			else{
				$("#id_check").text("중복된 아이디입니다.");
				$("#id_check").css("color", "red");
			}
			}
		});
	}
});

	
			
				
			
			
			
			
			
</script>

<body>
<h1 class="title">FIND ID</h1>


<div>
	<input type="text" class="form-control" id="findName1" name="findName1"
					placeholder="NAME" maxlength="12">
</div>

<div>
<input type="text" class="form-control" id="findMail1" name="findMail1"
					placeholder="email" maxlength="12">
</div>

<input class="btn btn-success" type="button" id="findid" value="FIND ID">



<h1 class="title">FIND PW</h1>

<form name="join"action="findPW.do" method="post">

<div>
	<input type="text" class="form-control" id="findId" name="findId"
					placeholder="ID" maxlength="12">
</div>

<div>
	<input type="text" class="form-control" id="findName2" name="findName2"
					placeholder="NAME" maxlength="12">
</div>

<div>
<input type="text" class="form-control" id="findMail2" name="findMail2"
					placeholder="email" maxlength="12">
</div>

<input class="btn btn-success" type="submit" value="FIND PW">

</form>

</body>
</html>