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
				
			},
			error : function(){}
		});
	});
	$('.cancelRegister').on('click', function(){
		var rid = $(this).val();
		alert("신청취소 임. " + rid);
	});
	

	
	
	
	
	
	
	
	

});






