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
















function t(){
	alert("그니까 이게 되긴 하는거임");
	$.ajax({
		url : "moreNotice.do",
		type : "post",
//		dataType : "json",
		success : function(data) {
			alert("뭔가를 받아오긴 하니.");
			alert(data);
//			alert(data.qqq);
			alert(data.w);
			alert(data.w[0]);
			alert(data.w[0].a);
//			alert(data.result[0].NKREASON);
//			alert(data.result);
			
//			for(var i in data.result){
//				alert(data.result[i].nkcode);
//			}
//			alert(data.one);
//			alert(data.result);
//			alert(data.result.one);
		},
		error : function(){
			alert("ASdjadf");
		}
	});
}



