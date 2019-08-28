$(document).ready(function(){
	
	// 페이지 로딩시 타입 저장 / 버튼색 지정
	var apitype = $('#apiType').val();
	if(apitype == "0" || apitype == "1"){
		$('#keywordFormBtn').css('background-color', '#B5C3C8');
		$('#keywordFormBtn').css('color', 'white');
		
		$('#keywordForm').show();
		$('#festivalForm').hide();
		$('#areaForm').hide();
	}else if(apitype == "2"){
		$('#festivalFormBtn').css('background-color', '#B5C3C8');
		$('#festivalFormBtn').css('color', 'white');
		$('#keywordFormBtn').css('background-color', 'white');
		$('#keywordFormBtn').css('color', 'black');
		
		$('#festivalForm').show();
		$('#keywordForm').hide();
		$('#areaForm').hide();
	}else if(apitype == "3"){
		$('#areaFormBtn').css('background-color', '#B5C3C8');
		$('#areaFormBtn').css('color', 'white');
		$('#keywordFormBtn').css('background-color', 'white');
		$('#keywordFormBtn').css('color', 'black');
		
		$('#areaForm').show();
		$('#keywordForm').hide();
		$('#festivalForm').hide();
	}
	
	// 검색창 변경 버튼
	$('#keywordFormBtn').on('click', function(){
		$('#keywordFormBtn').css('background-color', '#B5C3C8');
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
		$('#festivalFormBtn').css('background-color', '#B5C3C8');
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
		$('#areaFormBtn').css('background-color', '#B5C3C8');
		$('#areaFormBtn').css('color', 'white');
		
		$('#areaForm').show();
		$('#keywordForm').hide();
		$('#festivalForm').hide();
	});
	
	
	
	
	
	
	//페이지 네비게이터
	$(".PageNavi").on('click', function(){
		var page = $(this).val();
		var type = $('#apiType').val();
		
		if(type == "1"){
			var keyword = $("#storeKeyword").val();
			location.href="attractionInfo.do?type=1&page=" + page + "&keyword=" + keyword;
		}else if(type == "2"){
			var eventStartDate = $('#storeSdate').val();
			var eventEndDate = $('#storeEdate').val();
			var area = $('#storeArea').val();
			
			location.href="attractionInfo.do?type=2&page=" + page + "&area=" + area + 
			"&eventStartDate=" + eventStartDate + "&eventEndDate=" + eventEndDate;
		}else if(type == "3"){
			var area = $('#storeArea').val();
			location.href="attractionInfo.do?type=3&page=" + page + "&area=" + area;
		}
		
		
	});
	
	$(".areaBtn").on('click', function(){
		var area = $(this).val();
		location.href="attractionInfo.do?type=3&area=" + area;
	});
	
	// 지역검색 선택한 지역 비활성화
	$('.areaBtn').each(function(){
		var area = $('#storeArea').val();
		if($(this).val() == area)
			$(this).attr('disabled', 'disabled');
	});
	
	
	
	
	$('#searchKeyword').on('click', function(){
		var keyword = $('#keyword').val();
		if(keyword.length != 0)
			location.href='attractionInfo.do?keyword=' + keyword + "&type=1";
		else
			alert("검색어를 입력해주세요.");
	});
	
	
	
});

// 괄호 안에 넣지 마시오..
function viewDetail(contentid, contenttypeid, title){
	location.href="viewDetail.do?contentid=" + contentid + "&contenttypeid=" + contenttypeid + "&title=" + title;
}




