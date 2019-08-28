$(document).ready(function(){
	// 웹소켓 부분
	var wsUri = "ws://70.12.109.65:80/TravelWithMe/websocket/echo.do";
//	var wsUri = "ws://localhost/TravelWithMe/websocket/echo.do";
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
		$('#noticeCnt').html(evt.data);
	}

	function onError(evt) {
		//alert("에러임");
	}
	
	$('.userId').each(function(){
		$(this).hover(function(){
			var thiId = $(this)
			var mid = $(this).html();
			$.ajax({
				url : "getUserPoint.do",
				type : "post",
				data : {
					mid : mid
				},
				success : function(data){
					var mpoint = data.MPOINT;
					var gpoint = data.MGUIDEPOINT;
					var cnt = data.CNT;
					var grade = data.GRADE;
					var img = "";
					if(grade == 'Gold'){
						img = "<img class='gradeImg' src='imgs/hover_gold2.jpg'/>";
					}else if(grade == 'Silver'){
						img = "<img class='gradeImg' src='imgs/hover_silver2.jpg'/>";
					}else if(grade == 'Bronze'){
						img = "<img class='gradeImg' src='imgs/hover_bronze2.jpg'/>";
					}
					$(thiId).tooltip(
							{title: "<a>신뢰지수 &nbsp" + mpoint + " / 100점</a><BR>" + 
									"<a>가이드 등급 &nbsp" + img + "</a><BR>" +
//									"<img class='gradeImg' src='imgs/hover_gold.jpg'/>" + 
									"<a>가이드 횟수 &nbsp" + cnt + "회</a><BR>" 
								, 
								html: true, placement: "bottom"
					});
				},
				error : function(){}
			});
		});
	});
	
//	$('.userId').hover(function(){
//		
//	});
	
	
	
	   
	
	
	
	
	
	
	
	

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
					$('#loginId').val("");
					$('#loginPw').val("");
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
		$('#chk').val("t");
		$('.notice').hide();
		$('#ok').show();
		$('.starRev').hide();
		$('.attendanceModal').hide();
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
					table += "<td>" + "<input type='hidden'  value='" + nlist[i].bnum + "/" + type2 + "/"
					+ nlist[i].btitle + "/" + nlist[i].bkind +  "'>" + "</td>"
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
	
	function evGuide(title, bnum, nid){
		$('#checkEval').val("t");
		$('#guideTitle').html("'" + title + "'" + "<br>" + " 어땠나요?");
		$('#guideBnum').val(bnum);
		$('#g_noticeId').val(nid);
		$('.modal-body').hide();
		$('.attendanceModal').hide();
		$('.starRev').show();
		$('.notice').hide();
		$('#evGuide').show();
		if($('#chk').val() == "t")
			$('#back').show();
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
	
	
	

	function checkAttendanceModal(bnum, nid){
		$('.modal-body').hide();
		$('#evGuide').hide();
		$('.starRev').hide();
		$('.notice').hide();
		$('.attendanceModal').show();
		$('#checkAttend').show();
		if($('#chk').val() == "t")
			$('#back').show();
		$('#noticeId').val(nid);
		$( '#registers > tbody').empty();
		
		$.ajax({
			url : "getRegisterList.do",
			type : "post",
			data : {
				bnum : bnum
			},
			success : function(data) {
				var table = "";
				for(var i in data){
					var rid = data[i].rid;
					var mid = data[i].mid;
					var mname = data[i].mname;
					
					if(i % 2 == 0){
						table += "<tr><td class='aRow'>";
						table += "<input type='checkbox' id='attendance' value='" + rid + "'> " + mid + " (" + mname + ")"; 
						table += "</td>"; 
					}else{
						table += "<td class='aRow'>";
						table += "<input type='checkbox' id='attendance' value='" + rid + "'> " + mid + " (" + mname + ")";
						table += "</td></tr>";
					}
				}
				$(".registersRow:last").append(table);
				$('.aRow').each(function(){
					$(this).css('width', '200px');
				});
			},
			error : function(){}
		});
	};
	
	
	
	$('#back').on('click', function(){
		$('.notice').hide();
		$('#ok').show();
		$('#back').show();
		$('.starRev').hide();
		$('.attendanceModal').hide();
		$('.modal-body').show();
	});
	
	
	
	
	
	
	
	$(document).on('click', '.noticeDetail', function(){
		var row = $(this).closest("tr").find("input:eq(0)").val().split("/");
		var bnum = row[0];
		var type = row[1];
		var title = row[2];
		var bkind = row[3];
		var val = $(this).closest("tr").find("input:eq(1)").val().split("/");
		var nid = val[0];
		rowColor = val[1];
		if(rowColor == "0"){
			$(this).css('color', 'gray');
			readNotice(nid);
		}
		if(type == "0"){
			readBoard_header(bnum, bkind);
		}else if(type == "1"){
			evGuide(title, bnum, nid);
		}else if(type == "2"){
			checkAttendanceModal(bnum, nid);
		}else if(type == "3"){
			if(confirm("이미 평가/체크 완료된 항목입니다.\n게시글로 이동하시겠습니까?"))
				readBoard_header(bnum, bkind);
		}
	});
	

	
	
	

	
	
	
	// 별 누를때마다 점수 바뀌기
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  var point = $(this).html();
		  var gPoint = $('#gPoint');
		  gPoint.val(point);
		  return false;
	});
	
	// 평가 완료후 컨트롤러로 보내기.
	$('#evGuide').on('click', function(){
		var check = $('#checkEval').val();
		if(check == "t"){
			$.ajax({
				url : "evGuide.do",
				type : "post",
				data : {
					bnum : $('#guideBnum').val(),
					gPoint : $('#gPoint').val(),
					nid : $('#g_noticeId').val()
				},
				success : function() {},
				error : function(){}
			});
			alert("별점 평가가 완료되었습니다.");
			$('#checkEval').val("f");
			history.go(0);
		}
	});
	
	
	
	$('.close').on('click', function(){
		$('#checkEval').val("f");
		$('#pw').val("");
	});
	

	
	
	
	
	$('.newsRows').each( function() {
		$(this).css('cursor', 'pointer');
		$(this).closest("tr").find("td:eq(0)").css('height', '80px');
		var noticeStatus = $(this).closest("tr").find("input:eq(0)").val();
		if(noticeStatus == "1")
			$(this).css('color', 'gray');
		
		
		var bnum = $(this).closest("tr").find("input:eq(1)").val();
		var bkind = $(this).closest("tr").find("input:eq(2)").val();
		var codes = $(this).closest("tr").find("input:eq(3)").val().split("-");
		var code = codes[0];
		var evalStatus = $(this).closest("tr").find("input:eq(4)").val();
		var nid = $(this).closest("tr").find("input:eq(5)").val();
		var title = $(this).closest("tr").find("input:eq(6)").val();
		var type = "";
		var open = "";
		
		if(code == "PM" || code == "PP" || code == "PR"){
			type = "[포인트 변동???]";
			open = 0;
		}else if(code == "RG" || code == "RC"){
			if(bkind == "A"){
				type = "[Travel with Me]";
			}else{
				type = "[Travel with Guide]";
			}
			open = 0;
		}else{
			type = "[참석여부 및 별점평가]";
			if(codes[1] == "1")
				if(evalStatus == "0")
					open = 1;
				else
					open = 3;
			else
				if(evalStatus == "0")
					open = 2;
				else
					open = 3;
		}
		
		$(this).html(function(index, html){
			return type + html;
		});
		
		
		
		$(this).hover(function(){
			$(this).css('text-decoration','underline');
		}, function(){
			$(this).css('text-decoration','none');
		});
		
		
		$(this).on('click', function(){
			if(noticeStatus == "0"){
				$(this).css('color', 'gray');
				readNotice(nid);
			}
			
			if(open == "0"){
				readBoard_header(bnum, bkind);
			}else if(open == "1"){
				$(this).attr('data-target', '#moreNewsForm');
				$(this).attr('data-toggle', 'modal');
				$('#chk').val("f");
				evGuide(title, bnum, nid);
			}else if(open == "2"){
				$(this).attr('data-target', '#moreNewsForm');
				$(this).attr('data-toggle', 'modal');
				$('#chk').val("f");
				checkAttendanceModal(bnum, nid);
			}else if(open == "3"){
				if(confirm("이미 평가/체크 완료된 항목입니다.\n게시글로 이동하시겠습니까?"))
					readBoard_header(bnum, bkind);
			}
			
		});
	});
	
	

	
	
	$('#checkAttend').on('click', function(){
		var nid = $('#noticeId').val();
		
		var array = new Array();
		var cnt = 0;
		$('input:checkbox[id="attendance"]:not(:checked)').each(function(){
			var a = $(this).val();
			array[cnt] = a;
			cnt++;
		});
		
		$.ajax({
			url : "checkAttendance.do",
			type : "post",
			traditional : true,
			data : {
				attendance : array,
				nid : nid
			},
			success : function(){},
			error : function(){}
		});
		alert("참석여부 체크가 완료되었습니다.");
		history.go(0);
	});
	
	
	
	
	
	
	
	
	
	
	
	
	function readNotice(nid){
		$.ajax({
			url : "readNotice.do",
			type : "post",
			data : {
				nid : nid
			},
			success : function() {},
			error : function(){}
		});
	};
	
	
	
	
	
	function readBoard_header(bnum, bkind){
		location.href = "readBoard.do?bnum=" + bnum + "&bkind=" + bkind;
	}
	
	//메인검색
	$("#mainSearch").click(function(){
		var keyword = $(this).siblings("input").val();
		if(keyword == "") alert("검색어를 입력해주세요");
		else{
			location.href='mainSearch.do?keyword='+keyword;			
		}
	});
	
	$("#AwriteBtn").click(function(){
		if(sessionChk()) location.href='accomWriteForm.do';
	});

	$("#GwriteBtn").click(function(){
		if(sessionChk()) location.href='guideWriteForm.do';
	});

	$("#AwriteBtnInIndex").click(function(){
		if(sessionChk()) location.href='accomWriteForm.do';
	});
	
	$("#GwriteBtnInIndex").click(function(){
		if(sessionChk()) location.href='guideWriteForm.do';
	});
	
	$("#Awritetip").click(function(){
		if(sessionChk()) location.href='accomWriteForm.do';
	});
	
	$("#Gwritetip").click(function(){
		if(sessionChk()) location.href='guideWriteForm.do';
	});
});

function sessionChk(){
	var user = $("#user").val();
	if(user == ""){
		alert("로그인 후 사용가능한 서비스입니다.");
		return false;
	}else{
		return true;
	}
		
}






