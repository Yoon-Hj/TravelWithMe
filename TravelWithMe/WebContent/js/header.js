$(document).ready(function(){
	// 웹소켓 부분
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

	function onOpen(evt) {
		websocket.send(user);
	}

	function onMessage(evt) {
		$('.moreNews').html(evt.data);
	}

	function onError(evt) {
		//alert("에러임");
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 알림부분
	$('.moreNews').on('click', function(){
		$('.starRev').hide();
		$('.modal-body').show();
		$( '#allNews > tbody').empty();
		$.ajax({
			url : "moreNotice.do",
			type : "post",
			success : function(data) {
				var nlist = data;
				var table = "";
				for(var i in nlist){
					var code = nlist[i].nkcode.split("-");
					var type = code[0];
					var type2 = "";
					var evalStatus = nlist[i].evalstatus;
					if(type == "PM" || type == "PP" || type == "PR"){
						type = "[포인트 변동???]";
						type2 = 0;
					}else if(type == "RG" || type == "RC"){
						if(nlist[i].bkind == "A"){
							type = "[Travel with Me]";
						}else{
							type = "[Travel with Guide]";
						}
						type2 = 0;
					}else{
						type = "[참석여부 및 별점평가]";
						if(code[1] == "1"){	// 평가 코드 1번
							if(evalStatus == "0")
								type2 = 1;
							else
								type2 = 3;
						}
						else{				// 평가 코드 2번
							if(evalStatus == "0")
								type2 = 2;
							else
								type2 = 3;
						}
					}
					table += "<tr>";
					table += "<td>" + "<input type='hidden'  value='" + nlist[i].bnum + "/" + type2 + "/" + nlist[i].btitle + "'>" + "</td>"
					table += "<td>" + "<input type='hidden' value='" + nlist[i].nid + "/" + nlist[i].noticestatus + "'/>" + "</td>";
					table += "<td><p class='noticeDetail' style='font-color:red'>" + type + nlist[i].btitle + "<br>";
					table += nlist[i].nkreason + "</p></td>";
					table += "";
					table += "</tr>";
					
				}
				$(".newsRow:last").append(table);
				noticeColor();
			},
			error : function(){
				alert("?? 에러임; ");
			}
		});
	});
	
	function evGuide(title, bnum){
		$('#guideTitle').html("'" + title + "'" + " 어땠나요?");
		$('#guideBnum').val(bnum);
		$('.modal-body').hide();
		$('.starRev').show();
	};
	
	function noticeColor(){		// 알림 읽음 여부에 따라 글씨 색 조정
		$('.noticeDetail').each( function() {
			var row = $(this).closest("tr").find("input:eq(1)").val().split("/");
			if(row[1] == "1")
				$(this).css('color', 'gray');
			$(this).css('cursor', 'pointer');
			$(this).hover(function(){
				$(this).css('text-decoration','underline');
			}, function(){
				$(this).css('text-decoration','none');
			});
		 });
	};
	
	
	
	$('.contentsRow').each( function() {
		$(this).css('cursor', 'pointer');
		$(this).hover(function(){
			$(this).css('text-decoration','underline');
		}, function(){
			$(this).css('text-decoration','none');
		});
	});
	
	
	
	
	
	
	
	
	
	
	
	
	$(document).on('click', '.noticeDetail', function(){
		var row = $(this).closest("tr").find("input:eq(0)").val().split("/");
		var bnum = row[0];
		var type = row[1];
		var title = row[2];
		var rowColor = $(this).closest("tr").find("input:eq(1)").val().split("/");
		if(rowColor[1] == "0"){
			$(this).css('color', 'gray');
			$(this).css('cursor', 'pointer');
			$.ajax({
				url : "readNotice.do",
				type : "post",
				data : {
					nid : rowColor[0]
				},
				success : function() {},
				error : function(){}
			});
		}
		if(type == "0"){
			alert("게시글 화면으로 이동해.");
			evGuide(title, bnum);
		}else if(type == "1"){
			alert("별점평가 화면을 띄워");
			evGuide(title, bnum);
		}else if(type == "2"){
			alert("참석여부 화면을 띄워");
		}else if(type == "3"){
			alert("평가가 이미 완료된 항목임.");
		}
	});
	

	
	
	

	
	
	
	// 별 누를때마다 점수 바뀌기
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  var point = $(this).html();
		  var gPoint = $('#gPoint');
		  gPoint.val(point);
		  alert(gPoint.val());
		  return false;
	});
	// 평가 완료후 컨트롤러로 보내기.
	$('#evGuide').on('click', function(){
		$.ajax({
			url : "evGuide.do",
			type : "post",
			data : {
				bnum : $('#guideBnum').val(),
				gPoint : $('#gPoint').val()
			},
			success : function() {},
			error : function(){}
		});
		alert("별점 평가가 완료되었습니다.");
	});
	
	
	
	
	
	
	
	
	

});






