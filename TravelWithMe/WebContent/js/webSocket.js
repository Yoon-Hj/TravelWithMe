$(document).ready(function(){



var wsUri = "ws://localhost:80/TravelWithMe/websocket/echo.do";

function init() {
	//output = document.getElementById("output");
	//output = $('#output');
}
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
	$.ajax({
		url : "login.do",
		data : {
			mid : $('#loginId').val(),
			mpw : $('#loginPw').val()
		},
		type : "post",
		success : function(data) {
			if(data == '2'){
				alert("존재하지 않는 ID입니다.");
			}else if(data == '3'){
				alert("ID 또는 비밀번호를 확인해주세요.");
			}else{
				alert(data);
				history.go(0);
			}
		}
	});
});


function onOpen(evt) {
	//writeToScreen("Connected to Endpoint!");
	doSend(textID.value);
//	$.ajax({
//		url : "login_test.do",
//		type : "post",
//		success : function() {
//			alert("ㅇㅇ 잘 되는군");
//		}
//	});
	//history.go(0);
}

function onMessage(evt) {
	out(evt.data);
}

function onError(evt) {
	alert("에러임");
	//writeToScreen('ERROR: ' + evt.data);
}

function doSend(message) {
	//writeToScreen("Message Sent: " + message);
	alert(message);
	websocket.send(message);
	//websocket.close();
}

//function writeToScreen(message) {
//	var pre = document.createElement("p");
//	pre.style.wordWrap = "break-word";
//	pre.innerHTML = message;
//
//	output.appendChild(pre);
//}


$('#logout').on('click', function(){
//	alert("세션 닫느다");
//	websocket.close();
//	location.href="logout.do";
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


function out(message){
	//var out = document.getElementById("out");
	$('#out').html(message);
}

window.addEventListener("load", init, false);
});