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
		alert(bnum + " " + bkind + " readBoard.do 요청을 보내자.");
	};
	
	
	
	

});






