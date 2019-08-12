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
});


function onOpen(evt) {
	//writeToScreen("Connected to Endpoint!");
	doSend(textID.value);
	$.ajax({
		url : "login_test.do",
		type : "post",
		success : function() {
			alert("ㅇㅇ 잘 되는군");
		}
	});
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
	alert("세션 닫느다");
	websocket.close();
	location.href="logout.do";
	
});


function out(message){
	//var out = document.getElementById("out");
	$('#out').html(message);
}

window.addEventListener("load", init, false);
});