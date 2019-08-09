/**
 * 
 */



$(document).ready(function(){
	$(".areaBtn").on('click', function(){
		var areacode = $(this).val();
		location.href="apiAreaSearch.do?areacode=" + areacode;
	});
	
	$(".PageNavi1").on('click', function(){
		var page = $(this).val();
		var keyword = $("#keyword").val();
		location.href="apiKeywordSearch.do?page=" + page + "&keyword=" + keyword;
	});
	
	$(".PageNavi2").on('click', function(){
		var page = $(this).val();
		var sDate = $("#sDate").val();
		var eDate = $("#eDate").val();
		var area = $("#area option:selected").val();
		location.href="festivalSearch.do?page=" + page + "&area=" + area
		+ "&eventStartDate=" + sDate + "&eventEndDate=" + eDate;
	});

	$(".PageNavi3").on('click', function(){
		var page = $(this).val();
		var selArea = $("#selArea").val();
		location.href="apiAreaSearch.do?page=" + page + "&areacode=" + selArea;
	});
	
	
	
	
	
});

function viewDetail(contentid, contenttypeid, title){
	location.href="viewDetail.do?contentid=" + contentid + "&contenttypeid=" + contenttypeid + "&title=" + title;
}




