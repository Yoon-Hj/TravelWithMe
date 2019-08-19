$(document).ready(function(){
//	var wsUri = "ws://70.12.109.53:80/TravelWithMe/websocket/echo.do";
	var wsUri = "ws://localhost/TravelWithMe/websocket/echo.do";
	var websocket = null;
	
	var user = $('#user').val();
	if(user != ""){
		websocket = new WebSocket(wsUri);
		websocket.onopen = function(evt) {
			onOpen(evt)
		};
		websocket.onmessage = function(evt) {
			onMessage(evt)
		};
		websocket.onerror = function(evt) {
			onError(evt)
		};
	}

	$('#login').on('click', function(){
		var id = $('#loginId').val();
		var pw = $('#loginPw').val();
		
		if(id == "" || pw == ""){
			alert("빈칸을 입력해주세요.");
		}else{
			$.ajax({
				url : "login.do",
				data : {
					mid : id,
					mpw : pw
				},
				type : "post",
				success : function(data) {
					if(data == '2'){
						alert("존재하지 않는 ID입니다.");
					}else if(data == '3'){
						alert("ID 또는 비밀번호를 확인해주세요.");
					}else{
						history.go(0);
					}
				}
			});
		}
	});
	

	function onOpen(evt) {
		websocket.send(user);
	}

	function onMessage(evt) {
		$('#myNotice').html(evt.data);
	}

	function onError(evt) {
		//alert("에러임");
	}


	$('#logout').on('click', function(){
		$.ajax({
			url : "logout.do",
			type : "post",
			success : function() {
			}
		});
		alert("로그아웃 한다");
		websocket.close();
		history.go(0);
	});
	
	$('#joinForm').on('click', function(){
		location.href="joinForm.do";
	});
	

	$('#myPage').on('click', function(){
		location.href="myPage.do";
	});
	
	$('#find').on('click', function(){
		location.href="findForm.do";
	});
	
	
	
	
	
});