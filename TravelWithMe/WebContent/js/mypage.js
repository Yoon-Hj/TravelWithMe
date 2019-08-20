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
		$('#checkPw').show();
	});
	
	$('#withdrawal').on('click', function(){
//		if(confirm("정말 탈퇴하시겠습니까?") == true)
//		location.href="withdrawalUser.do";
	});

	$('.modal').on('hidden.bs.modal', function(){
		$('#pw').val("");
	});
	
	$('#checkPass').on('click', function(){
		var pw = $('#pw').val();
		$.ajax({
			url : "checkPassword.do",
			type : "post",
			data : {
				mpw : pw
			},
			success : function(){
				
			},
			error : function(){}
		});
		alert("다녀왔다.");
	});
	
	
});






