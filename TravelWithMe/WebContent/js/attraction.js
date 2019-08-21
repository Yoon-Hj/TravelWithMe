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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	$(".PageNavi").on('click', function(){
		var page = $(this).val();
		var type = $('#apiType').val();
		
		if(type == "1"){
			var keyword = $("#storeKeyword").val();
			location.href='attTest.do?keyword=' + keyword + "&page=" + page + "&type=1";
		}else if(type == "2"){
			
		}else if(type == "3"){
			
		}
		
		
	});
	
	
	var apitype = $('#apiType').val();
	
	if(apitype == "0" || apitype == "1"){
		
	}
	
	
	
	
	
	
	$('#searchKeyword').on('click', function(){
		var keyword = $('#keyword').val();
		if(keyword.length != 0)
			location.href='attTest.do?keyword=' + keyword + "&type=1";
		else
			alert("검색어를 입력해주세요.");
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});

function viewDetail(contentid, contenttypeid, title){
	location.href="viewDetail.do?contentid=" + contentid + "&contenttypeid=" + contenttypeid + "&title=" + title;
}




