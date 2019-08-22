<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
$(document).ready(function(){
	$('#findid').on('click',function(){
	
	var name = $('#findName1').val();
	var mail = $('#findMail1').val();
	
	if(name == "" || mail == ""){
		alert("이름, 대표 연락처를 다시 확인해주세요.");
	}
	
	else{
	$.ajax({
		url : "findID.do",
		data : {
			name : name,
			mail : mail
		},
		
		type : "get",
		success : function(data) {
						
			if (data == "") {
				alert("입력하신 내용과 일치하는 정보가 없습니다.");
				} 
			
			else{
			
				alert("회원님의 아이디는 "+ data +"입니다.");
				
			}
			}
		});
	}
});
});

	
$(document).ready(function(){
	$('#findPw').on('click',function(){
			var id = $('#Id').val();
	        var name = $('#findName2').val();
	        var mail = $('#findMail2').val();
	        
	        if(name == "" || mail == "" || id==""){
	    		alert("아이디, 이름, 대표 연락처를 다시 확인해주세요.");
	    	}
	        
	        else{
	        	$.ajax({
	        		url : "findPw.do",
	        		data : {
	        			id : id,
	        			name : name,
	        			mail : mail
	        		},
	        		type : "get",
	        		success : function(data){
	        			
	        			if(data == ""){
	        				alert("입력하신 내용과 일치하는 정보가 없습니다.");
	        				
	        			}
	        			else{
	        				$('#findPwForm').modal({show: true});
	        			}
	        			
	        		}
	        		
	        		
	        	});
	        	
	        }
	});
	
	
});			
				
			
$(document).ready(function(){
	$('#pwdb').on('click',function(){
		
		
		var pw = $('#pwd').val();
		var pwc =$('#pwdc').val();
		var id = $('#Id').val();
		
		  if(pw == "" || pwc == ""){
	    		alert("비밀번호를 다시 확인해주세요.");
	    	}
		  
		  else if(pw == pwc){
			  $.ajax({
				  url : "repwd.do",
				  data:{
					  pw : pw,
					  id : id
					  
				  },
				  type : "get",
				 complete : function(){
					 location.href = "index.do";
				 } 
				 
			  });
		 }
		  
		  else{alert("비밀번호가 일치하지 않습니다.")}
		  });
		
});
			
			
			
</script>

<body>
	<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<div style="margin-top: 150px; margin-left: 350px; margin-bottom: 155px;">
	
	<h1 class="title" style="font-family: '배달의민족 도현';">FIND ID</h1>
	
	<div>
		<input type="text" style="width: 400px" class="form-control" id="findName1" name="findName1"
						placeholder="Enter Name" maxlength="12" required>
	</div>
	
	<div style="margin-top: 5px;">
	<input type="text" style="width: 400px" class="form-control" id="findMail1" name="findMail1"
						placeholder="Enter Contact(대표연락처)" required>
	</div>
	
	<input class="btn" type="button" id="findid" name="findid" value="FIND ID" 
			style="margin-top: 5px; margin-left: 310px; background-color: #B5C3C8; color:white; font-family: '배달의민족 주아'">
	
	<h1 class="title" style="margin-top: 50px; font-family: '배달의민족 도현';">FIND PW</h1>
	<div>
		<input type="text" style="width: 400px" class="form-control" id="Id" name="Id"
						placeholder="Enter Id" maxlength="12">
	</div>
	
	<div>
		<input type="text" style="width: 400px; margin-top: 5px;" class="form-control" id="findName2" name="findName2"
						placeholder="Enter Name" maxlength="12">
	</div>
	
	<div>
	<input type="text" style="width: 400px; margin-top: 5px;" class="form-control" id="findMail2" name="findMail2"
						placeholder="Enter Contact(대표연락처)">
	</div>
	
	<input class="btn" type="button" id="findPw" name="findPw" value="FIND PW" 
			style="margin-top: 5px; margin-left: 310px; background-color: #B5C3C8; color:white; font-family: '배달의민족 주아'">
	</div>
</div>

	<!-- 비밀번호 재설정 폼 -->
	<div class="modal fade" id="findPwForm">
			<div class="modal-dialog modal-dialog-centered" style="width: 80%;">
		      <div class="modal-content">
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: 배달의민족 도현">비밀번호 재설정</h3>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>

		        <!-- Modal body -->
		        <div class="modal-body" style="text-align: center;">
		         	<label for="pw" style="margin-left:18px; margin-right: 73px; font-family: '함초롬돋움'">비밀번호</label>
					 <input type="password" name="pw" id="pwd" style="width: 200px;" required><br>
					<label for="pwc" style="margin-right: 55px; font-family: '함초롬돋움'">비밀번호 확인</label>
					 <input type="password" name="pwc" id="pwdc" style="width: 200px;" required><br>
					 <input type="button" name="pwdb" id="pwdb" value="확인" class="btn" 
					 		style="background-color: #B5C3C8; color:white; font-family: '배달의민족 주아'; margin-left: 300px; margin-top: 7px;">
	        	</div>
	        	
	       </div>
	     </div>
	  </div>
	  
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>