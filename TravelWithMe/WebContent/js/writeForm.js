$(function(){
	$("#basicInfo").show();
	$("#detailInfo").hide();
	$("#preview").hide();
	
	$("#basicBtn").css({'background-color':'rgb(181, 195, 200)','color':'white','opacity':'1'});
	
	//gfinishdate선택하면 이전 날짜 선택못하게 막기
	$("#gstartdate").focusout(function(){
		var minDate = $("#gstartdate").val();
		$("#gfinishdate").attr('min',minDate);
	});
	
	//gtime라이도 버튼 생성하고 삭제하기
	$("#gfinishdate").focusout(function(){
		if($("#gfinishdate").val()==$("#gstartdate").val()){
			$("#gtimeLabel").remove();
			var input = "";
			input += "<label id='gtimeLabel'>";
			input += "&nbsp;<input type='radio' name='gtime' value='오전'>&nbsp;오전";
			input += "&nbsp;<input type='radio' name='gtime' value='오후'>&nbsp;오후";
			input += "&nbsp;<input type='radio' name='gtime' value='종일'>&nbsp;종일";
			input += "</label>";
			$("#gfinishdate").after(input);			
		}else{
			$("#gtimeLabel").remove();
		}
	});
	
	//genddate(모집마감날짜) 제어하기
	$("#genddate").focus(function(){
		var maxDate = $("#gstartdate").val();
		$("#genddate").attr('max',maxDate);
	});
});


function openBasicInfo() {
	$("#basicInfo").show();
	$("#detailInfo").hide();
	$("#preview").hide();
	$("#basicBtn").css({'background-color':'rgb(181, 195, 200)','color':'white','opacity':'1'});
	$("#detailBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
	$("#previewBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
}

function openDetailInfo() {
	$("#basicInfo").hide();
	$("#detailInfo").show();
	$("#preview").hide();
	$("#detailBtn").css({'background-color':'rgb(181, 195, 200)','color':'white','opacity':'1'});
	$("#basicBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
	$("#previewBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
}

function openPreview() {
	$("#basicInfo").hide();
	$("#detailInfo").hide();
	$("#preview").show();
	$("#previewBtn").css({'background-color':'rgb(181, 195, 200)','color':'white','opacity':'1'});
	$("#basicBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
	$("#detailBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
}