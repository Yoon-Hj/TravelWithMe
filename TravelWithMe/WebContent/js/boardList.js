$(document).ready(function(){
	//accom guide 동시사용
	var type=$("#hiddenType").val();
	//accom guide 동시사용 타입 설정
	if(type=='') {
		$("select[name=type]").val(1);		
	}else{		
		$("select[name=type]").val(type);
	}
	//accom 여행취향 설정
	var likecode=$("#hiddenlikecode").val();
	$("select[name=like]").val(likecode);
	

	//accomBoardList JS
	$('[data-toggle="tooltip"]').tooltip();   
  
	//이미지 분기
	$('.iarea').find("input").each(function(){
		var ar = $(this).val();
		ar = ar.split(' ')[0];
		
		var iloc = $(this).parent("p").parent("div").siblings("a").find("img");
		if(ar=="제주도"){
			iloc.attr("src", "imgs/jeju.PNG");
		}
		else if(ar=="서울특별시"){
			iloc.attr("src", "imgs/seoul.jpg");
		}
		else if(ar=="경기도"){
			iloc.attr("src", "imgs/gyeonggi.jpg");
		}
		else if(ar=="전라북도"){
			iloc.attr("src", "imgs/jeonbuk.PNG");
		}
		else if(ar=="전라남도"){
			iloc.attr("src", "imgs/jeonnam.jpg");
		}
		else if(ar=="경상북도"){
			iloc.attr("src", "imgs/gyeongbuk.jpg");
		}
		else if(ar=="경상남도"){
			iloc.attr("src", "imgs/gyeongnam.jpg");
		}
		else if(ar=="충청북도"){
			iloc.attr("src", "imgs/chungbuk.PNG");
		}
		else if(ar=="충청남도"){
			iloc.attr("src", "imgs/chungnam.PNG");
		}
		else if(ar=="강원도"){
			iloc.attr("src", "imgs/gangwon.PNG");
		}
	});
});