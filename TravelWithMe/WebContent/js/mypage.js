$(document).ready(function(){
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	$('#moreBoards').on('click', function(){
		alert("게시판 더보기 페이지로 이동해");
	});
	
	$('#moreRegister').on('click', function(){
		$( '#allRegis > tbody').empty();
		$.ajax({
			url : "moreRegister.do",
			type : "post",
			success : function(data) {
				var rlist = data;
				var table = "";
				for(var i in rlist){
					var type = rlist[i].bkind;
					if(type == "A")
						type = "[Travel with Me]";
					else
						type = "[Travel with Guide]";
					table += "<tr>";
					table += "<td>" + "<input type='hidden' value='" + rlist[i].bnum + "/" + rlist[i].bkind + "'/>" + "</td>";
					table += "<td>" + "<p class='regiDetail'>" + type + rlist[i].btitle + "</p>" + "</td>";
					table += "</tr>";
				}
				$(".regisRows:last").append(table);
				regiBtn();
			},
			error : function(){}
		});
	});
	
	function regiBtn(){
		$('.regiDetail').each( function() {
			$(this).css('cursor', 'pointer');
			$(this).hover(function(){
				$(this).css('text-decoration','underline');
			}, function(){
				$(this).css('text-decoration','none');
			});
			$(this).on('click', function(){
				var row = $(this).closest("tr").find("input:eq(0)").val().split("/");
				var bnum = row[0];
				var bkind = row[1];
				readBoard(bnum, bkind);
			});
		});
	}

	
	
	
	
	
	$('.regisRow').each( function() {
		$(this).css('cursor', 'pointer');
		$(this).hover(function(){
			$(this).css('text-decoration','underline');
		}, function(){
			$(this).css('text-decoration','none');
		});
		$(this).on('click', function(){
			var bnum = $(this).closest("tr").find("input:eq(0)").val();
			var bkind = $(this).closest("tr").find("input:eq(1)").val();
			readBoard(bnum, bkind);
		});
		
	});
	
	$('.boardsRow').each( function() {
		$(this).css('cursor', 'pointer');
		$(this).hover(function(){
			$(this).css('text-decoration','underline');
		}, function(){
			$(this).css('text-decoration','none');
		});
		$(this).on('click', function(){
			var bnum = $(this).closest("tr").find("input:eq(0)").val();
			var bkind = $(this).closest("tr").find("input:eq(1)").val();
			readBoard(bnum, bkind);
		});
	});
	
	
	
	
	function readBoard(bnum, bkind){
		location.href = "readBoard.do?bnum=" + bnum + "&bkind=" + bkind;
	};
	

	
	
	$('#reviseForm').on('click', function(){
		$('.modal-body').hide();
		$('#modiPwForm').hide();
		$('.btn').hide();
		$('#checkPass').show();
		$('#checkPw').show();
		$('#passType').val("f");
	});
	
	$('#withdrawal').on('click', function(){
		$('.modal-body').hide();
		$('#modiPwForm').hide();
		$('.btn').hide();
		$('#checkPass').show();
		$('#checkPw').show();
		$('#passType').val("l");
	});

	$('.modal').on('hidden.bs.modal', function(){
		var name = $('#storeName').val();
		var contact = $('#storeContact').val();
		$('#name').val(name);
		$('#contact').val(contact);
		$('#pw').val("");
		$('#modiPw').val("");
		$('#modiPwCheck').val("");
		$('#pwChk').html('');
		$('.btn').show();
	});
	
	
	
	$('#modiPassForm').on('click', function(){
		$('.modal-body').hide();
		$('.btn').hide();
		$('#checkPass').show();
		$('#checkPw').show();
		$('#passType').val("m");
	});
	
	
	
	$('#checkPass').on('click', function(){
		var pw = $('#pw').val();
		var type = $('#passType').val();
		$.ajax({
			url : "checkPassword.do",
			type : "post",
			data : {
				mpw : pw
			},
			success : function(data){
				if(data == "pass"){
					$('#checkPw').hide();
					$('.btn').hide();
					if(type == "f"){
						$('#modiInfo').show();
						$('.modal-body').show();
					}else if(type == "m"){
						$('#modiPwForm').show();
						$('#modiPwBtn').show();
					}else if(type == "l"){
						if(confirm("정말 탈퇴하시겠습니까?") == true)
							location.href="withdrawalUser.do";
						else
							$(".modal").modal('hide');
					}
				}else{
					alert("비밀번호가 틀렸습니다.");
					$('#pw').val("");
				}
			},
			error : function(){}
		});
		$('#pw').val("");
	});
	
	
	$('#modiPw').on({
		keyup : function(){
			var pass = $('#modiPw').val();
			var chkPass = $('#modiPwCheck').val();
			checkPw(pass, chkPass);
		},
		blur : function(){
			var pass = $('#modiPw').val();
			var chkPass = $('#modiPwCheck').val();
			checkPw(pass, chkPass);
		}
	});
	
	
	$('#modiPwCheck').on({
		keyup : function(){
			var pass = $('#modiPw').val();
			var chkPass = $('#modiPwCheck').val();
			checkPw(pass, chkPass);
		},
		blur : function(){
			var pass = $('#modiPw').val();
			var chkPass = $('#modiPwCheck').val();
			checkPw(pass, chkPass);
		}
	});
	
	
	function checkPw(pass, chkPass){
		if(pass.length > 16){
			alert("비밀번호는 16자리까지 입력 가능합니다.");
			$('#modiPw').val("");
		}
		if(chkPass.length > 16){
			alert("비밀번호는 16자리까지 입력 가능합니다.");
			$('#modiPwCheck').val("");
		}
		if(chkPass.length != 0){
			if(pass != chkPass){
				$('#pwChk').html('비밀번호가 일치하지 않습니다.');
				$('#pwChk').css('color', 'red');
			}else{
				$('#pwChk').html('비밀번호가 일치합니다.');
				$('#pwChk').css('color', 'green');
			}
		}else
			$('#pwChk').html('');
		if(pass.length == 0)
			$('#pwChk').html('');
	}
	
	
	$('#modiPwBtn').on('click', function(){
		var pass = $('#modiPw').val();
		var chkPass = $('#modiPwCheck').val();
		
		if($('#pwChk').html() == "비밀번호가 일치합니다."){
			if(pass.length < 4){
				alert("비밀번호는 4자리 이상이어야 합니다.");
			}else{
				$.ajax({
					url : 'modifyPw.do',
					type : "post",
					data : {
						mpw : pass
					},
					success : function(){},
					error : function(){}
				});
				alert("수정이 완료되었습니다.");
				history.go(0);
			}
		}else
			alert("다시 확인해주세요.");
	});
	
	
	
	$('#modiInfo').on('click', function(){
		var name = $('#name').val();
		var contact = $('#contact').val();
		
		if(name.length == 0 || contact.length == 0){
			alert("빈칸을 채워주세요.");
		}else{
			$.ajax({
				url : "modiMemInfo.do",
				type : "post",
				data : {
					mname : name,
					mcontact : contact
				},
				success : function(){},
				error : function(){}
			});
			alert("수정이 완료되었습니다.");
			history.go(0);
		}
	});
	
	
	
	
	
	
	
});






