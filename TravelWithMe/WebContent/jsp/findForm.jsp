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
$('#findid').on('click',function(){
	
	var name = $('#findName1').val();
	var mail = $('#findMail1').val();
	
	if(name == "" || mail == ""){
		alert("빈칸을 입력해주세요.");
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
			
				alert("회원님의 ID는"+ data +"입니다.");
				
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
	    		alert("빈칸을 입력해주세요.");
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
	        			alert($("#findIdForm").html());
	        			}
	        			
	        		}
	        		
	        		
	        	});
	        	
	        }
	});
	
	
});			
				
			
			
			
			
			
</script>

<body>
<h1 class="title">FIND ID</h1>


<div>
	<input type="text" class="form-control" id="findName1" name="findName1"
					placeholder="NAME" maxlength="12" required>
</div>

<div>
<input type="text" class="form-control" id="findMail1" name="findMail1"
					placeholder="EMAIL" maxlength="12" required>
</div>



<input class="btn btn-success" type="button" id="findid" name="findid" value="FIND ID">



<h1 class="title">FIND PW</h1>



<div>
	<input type="text" class="form-control" id="Id" name="Id"
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

<input class="btn btn-success" type="button" id="findPw" name="findPw" value="FIND PW">

<div class="modal fade" id="findIdForm">
		<div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h3 class="modal-title" style="font-family: 배달의민족 도현">LOGIN</h3>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body" style="text-align: center">
	         	 <label for="id" style="margin-right: 45px"><b>회원님의 ID는 아래와 같습니다.</b></label>
				<div>

</div>
				 <br>
				   
	        </div>
	       </div>
	     </div>
	  </div>

</body>
</html>