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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	var apitype = $('#apiType').val();
	
	if(apitype == "0" || apitype == "1"){
		$('#keywordFormBtn').css('background-color', '#58ACFA');
		$('#keywordFormBtn').css('color', 'white');
	}else if(apitype == "2"){
		$('#festivalForm').css('background-color', '#58ACFA');
		$('#festivalForm').css('color', 'white');
	}else if(apitype == "3"){
		$('#areaForm').css('background-color', '#58ACFA');
		$('#areaForm').css('color', 'white');
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	$('#keywordFormBtn').on('click', function(){
		$('#keywordFormBtn').css('background-color', '#58ACFA');
		$('#keywordFormBtn').css('color', 'white');
		$('#festivalFormBtn').css('background-color', 'white');
		$('#festivalFormBtn').css('color', 'black');
		$('#areaFormBtn').css('background-color', 'white');
		$('#areaFormBtn').css('color', 'black');

		$('#keywordForm').show();
		$('#festivalForm').hide();
		$('#areaForm').hide();
	});
	
	$('#festivalFormBtn').on('click', function(){
		$('#keywordFormBtn').css('background-color', 'white');
		$('#keywordFormBtn').css('color', 'black');
		$('#festivalFormBtn').css('background-color', '#58ACFA');
		$('#festivalFormBtn').css('color', 'white');
		$('#areaFormBtn').css('background-color', 'white');
		$('#areaFormBtn').css('color', 'black');
		
		$('#festivalForm').show();
		$('#keywordForm').hide();
		$('#areaForm').hide();
	});
	
	$('#areaFormBtn').on('click', function(){
		$('#keywordFormBtn').css('background-color', 'white');
		$('#keywordFormBtn').css('color', 'black');
		$('#festivalFormBtn').css('background-color', 'white');
		$('#festivalFormBtn').css('color', 'black');
		$('#areaFormBtn').css('background-color', '#58ACFA');
		$('#areaFormBtn').css('color', 'white');
		
		$('#areaForm').show();
		$('#keywordForm').hide();
		$('#festivalForm').hide();
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
	
	
	
	
	
	
	
	
	
	$('#searchKeyword').on('click', function(){
		var keyword = $('#keyword').val();
		if(keyword.length != 0)
			location.href='attTest.do?keyword=' + keyword + "&type=1";
		else
			alert("검색어를 입력해주세요.");
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	function viewDetail(contentid, contenttypeid, title){
		location.href="viewDetail.do?contentid=" + contentid + "&contenttypeid=" + contenttypeid + "&title=" + title;
	}
	
	
});





