$(function(){
	
	//오늘날짜 이전의 값은 선택불가
	var today = new Date();
	var todayDate = "";
	todayDate += today.getFullYear()+"-0";
	todayDate += (today.getMonth()+1)+"-";
	todayDate += today.getDate();
	$("#gstartdate").attr('min',todayDate);

	
	$("#basicInfo").show();
	$("#detailInfo").hide();
	$("#preview").hide();
	
	$("#basicBtn").css({'background-color':'rgb(181, 195, 200)','color':'white','opacity':'1'});
	
	
	//gfinishdate선택하면 이전 날짜 선택못하게 막기
	$("#gstartdate").focusout(function(){
		var minDate = $("#gstartdate").val();
		$("#gfinishdate").attr('min',minDate);
	});
	
	//gtime라디오 버튼 생성하고 삭제하기
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
	
	//세부일정에서 시간대 작성할 때 제한사항(오전,오후)
	$(document).on('focusout','#timeMinMax',function(){
		setTimeMinMax();
		
	});
	
	//세부일정 추가버튼
	$(document).on('click','.dayplus',function(){
		var plusBtn = $(this)
		plusDetailSche(plusBtn);
		
	});
	
	//세부일정 빼기버튼
	$(document).on('click','.dayminus',function(){
		var minusBtn = $(this)
		minusDetailSche(minusBtn);
		
	});
	
});

function setTimeMinMax(){
	var timeForOneDay = $(':radio[name="gtime"]:checked').val();
	var test = $("#timeMinMax").val();
	if(timeForOneDay=='오전') {
		if(test>'12:00') {
			alert('선택할 수 없는 시간대입니다. 다시 확인하세요.');
			$("#timeMinMax").val("");
		}
	}
	else if(timeForOneDay=='오후') {
		if(test<'12:00') {
			alert('선택할 수 없는 시간대입니다. 다시 확인하세요.');
			$("#timeMinMax").val("");
		}
	}
}

function plusDetailSche(plusBtn){
	var plusSche = "";
	plusSche +="<tr>";
	plusSche += "<td><input type='time' id='timeMinMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
	plusSche += "<td><input type='text' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
	plusSche += "<td><button class='dayminus' style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>-</button></td>";
	plusSche +="</tr>";
	
	var p = plusBtn.parent("td").parent("tr").find("td:eq(0)").attr("rowspan");
	p = Number(p);
	plusBtn.parent("td").parent("tr").find("td:eq(0)").attr("rowspan",p+1);
	plusBtn.parent("td").parent("tr").after(plusSche);
	
	
}

function minusDetailSche(minusBtn){
	var m = minusBtn.parent("td").parent("tr").siblings("tr:eq(0)").find("td:eq(0)").attr("rowspan");
	m = Number(m);
	alert(m);
	minusBtn.parent("td").parent("tr").siblings("tr:eq(0)").find("td:eq(0)").attr("rowspan",m-1);
	minusBtn.parent("td").parent("tr").remove();
	
}

function setDetailDay(){
	
	$("#day > tbody").empty();
	
	var sdate = $("#gstartdate").val().split('-');
	var fdate = $("#gfinishdate").val().split('-');
	var day = fdate[2]-sdate[2];
	var dayHTML = "";
	var dayHTMLinput = "<td><input type='time' id='timeMinMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
	dayHTMLinput += "<td><input type='text' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
	dayHTMLinput += "<td><button class='dayplus' style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>+</button></td>";
	if(day==0){
		dayHTML+="<table><tr>";
		dayHTML+="<td rowspan='1' class='InfoTd' style='vertical-align:top;'>DAY1</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+="</tr></table>";
	}else if(day==1){
		dayHTML+="<table><tr>";
		dayHTML+="<td rowspan='1' class='InfoTd' style='vertical-align:top;'>DAY1</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+="</tr></table>";
		dayHTML+="<table><tr>";
		dayHTML+="<td rowspan='1' class='InfoTd' style='vertical-align:top;'>DAY2</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+="</tr></table>";
	}else if(day==2){
		dayHTML+="<table><tr>";
		dayHTML+="<td rowspan='1' class='InfoTd' style='vertical-align:top;'>DAY1</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+="</tr></table>";
		dayHTML+="<table><tr>";
		dayHTML+="<td rowspan='1' class='InfoTd' style='vertical-align:top;'>DAY2</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+="</tr></table>";
		dayHTML+="<table><tr>";
		dayHTML+="<td rowspan='1' class='InfoTd' style='vertical-align:top;'>DAY3</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+="</tr></table>";
	}
	
	$("#day > tbody").html(dayHTML);

}

function openBasicInfo() {
	$("#basicInfo").show();
	$("#detailInfo").hide();
	$("#preview").hide();
	$('html').scrollTop(0);
	$("#basicBtn").css({'background-color':'rgb(181, 195, 200)','color':'white','opacity':'1'});
	$("#detailBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
	$("#previewBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
}

function openDetailInfo() {
	$("#basicInfo").hide();
	$("#detailInfo").show();
	$("#preview").hide();
	$('html').scrollTop(0);
	setDetailDay();
	$("#detailBtn").css({'background-color':'rgb(181, 195, 200)','color':'white','opacity':'1'});
	$("#basicBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
	$("#previewBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
}

function openPreview() {
	$("#basicInfo").hide();
	$("#detailInfo").hide();
	$("#preview").show();
	$('html').scrollTop(0);
	$("#previewBtn").css({'background-color':'rgb(181, 195, 200)','color':'white','opacity':'1'});
	$("#basicBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
	$("#detailBtn").css({'background-color':'white','color':'black','opacity':'0.6'});
}