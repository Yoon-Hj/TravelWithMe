$(document).ready(function(){
	$('#moreNews').on('click', function(){
		alert("알림 더보기 임.");
	});
	$('#moreBoards').on('click', function(){
		alert("게시판 더보기 임.");
	});
	$('#moreRegister').on('click', function(){
		alert("신청목록 더보기 임.");
	});
	$('.cancelRegister').on('click', function(){
		var rid = $(this).val();
		alert("신청취소 임. " + rid);
	});
	

	
	
	


});




function moreNews(){
	alert("알림 더보기 연결 됨.");
};

function openNewsModal() {
	  document.getElementById("newsModal").style.height = "100%";
};
	
function closeNewsModal() {
  document.getElementById("newsModal").style.height = "0%";
};