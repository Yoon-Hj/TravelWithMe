$(function(){
	
	//오늘날짜 이전의 값은 선택불가
	var today = new Date();
	var todayDate = "";
	todayDate += today.getFullYear()+"-0";
	todayDate += (today.getMonth()+1)+"-";
	todayDate += today.getDate();
	$("#gstartdate").attr('min',todayDate);
	$("#gfinishdate").attr('min',todayDate);

	//화면 로딩
	$("#basicInfo").show();
	$("#detailInfo").hide();
	$("#preview").hide();
	$("#basicBtn").css({'background-color':'rgb(181, 195, 200)','color':'white','opacity':'1'});
	
	
	//gfinishdate선택하면 이전 날짜 선택못하게 막기
	$("#gstartdate").focusout(function(){
		var minDate = $("#gstartdate").val();
		$("#gfinishdate").attr('min',minDate);
		var startDate = minDate.split('-')[2];
		startDate = Number(startDate)+2;
		var maxDate =  minDate.split('-')[0]+"-"+ minDate.split('-')[1]+"-"+startDate;
		$("#gfinishdate").attr('max',maxDate);
	});
	
	$("#gfinishdate").click(function(){
		if($("#gstartdate").val()==""){
			$("#gtimeLabel").remove();
			alert("시작날짜를 먼저 선택해주세요");		
		}
	});
	
	//gtime라디오 버튼 생성하고 삭제하기
	$("#gfinishdate").focusout(function(){
		if($("#gstartdate").val()!=""){
			if($("#gfinishdate").val()==$("#gstartdate").val()){
				$("#gtimeLabel").remove();
				var input = "";
				input += "<label id='gtimeLabel'>";
				input += "&nbsp;<input type='radio' name='gtime' value='오전'>&nbsp;오전";
				input += "&nbsp;<input type='radio' name='gtime' value='오후'>&nbsp;오후";
				input += "&nbsp;<input type='radio' name='gtime' value='종일' checked='checked'>&nbsp;종일";
				input += "</label>";
				$("#gfinishdate").after(input);			
			}else{
				$("#gtimeLabel").remove();
			}			
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
		var plusBtn = $(this);
		plusDetailSche(plusBtn);
		
	});
	
	//세부일정 빼기버튼
	$(document).on('click','.dayminus',function(){
		var minusBtn = $(this);
		minusDetailSche(minusBtn);
		
	});
	
	//출발시간 제한
	$("#departtime").focusout(function(){
		if($("#gstartdate").val()==""){
			$("#gtimeLabel").remove();
			alert("시작날짜를 먼저 선택해주세요");		
		}
		else{
			var timeForOneDay = $(':radio[name="gtime"]:checked').val();
			var test = $("#departtime").val();
			if(timeForOneDay=='오전') {
				if(test>'12:00') {
					alert('선택할 수 없는 시간대입니다. 다시 확인하세요.');
					$("#departtime").val("");
				}
			}
			else if(timeForOneDay=='오후') {
				if(test<'12:00') {
					alert('선택할 수 없는 시간대입니다. 다시 확인하세요.');
					$("#departtime").val("");
				}
			}
		}

	});
	
	//테마
	$("#gthema").keydown(function(key) {
	
		if (key.keyCode == 13) {
			var length = $(".sharpThema").length;
			if(length > 2) {
				alert("테마는 최대 3개까지 작성가능합니다");
				$("#gthema").val("");	
			}else{
				$("#gthema").after("<a class='sharpThema'>&nbsp;#"+$("#gthema").val()+"</a>");
				$("#gthema").val("");				
			}
		}			
	
	});
	
	$(document).on('click','.sharpThema',function(){
		alert('삭제어떻게하지?');
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
	var classDay = plusBtn.attr('class').split(" ")[1];
	var p;
	
	if(classDay=='day1'){
		
		plusSche +="<tr class='day1'>";
		plusSche += "<td><input type='time' id='timeMinMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
		plusSche += "<td><input type='text' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
		plusSche += "<td><button class='dayminus day1' style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>-</button></td>";
		plusSche +="</tr>";

		p = $('.day1').filter('tr:first').find("td:eq(0)").attr('rowspan');
		p=Number(p);
		$('.day1').filter('tr:first').find("td:eq(0)").attr('rowspan',p+1);
		$('.day1').filter('tr:last').after(plusSche);
		
	}else if(classDay=='day2'){
		
		plusSche +="<tr class='day2'>";
		plusSche += "<td><input type='time' id='timeMinMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
		plusSche += "<td><input type='text' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
		plusSche += "<td><button class='dayminus day2' style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>-</button></td>";
		plusSche +="</tr>";

		p = $('.day2').filter('tr:first').find("td:eq(0)").attr('rowspan');
		p=Number(p);
		$('.day2').filter('tr:first').find("td:eq(0)").attr('rowspan',p+1);
		$('.day2').filter('tr:last').after(plusSche);
		
	}else if(classDay=='day3'){
		
		plusSche +="<tr class='day3'>";
		plusSche += "<td><input type='time' id='timeMinMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
		plusSche += "<td><input type='text' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
		plusSche += "<td><button class='dayminus day3' style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>-</button></td>";
		plusSche +="</tr>";

		p = $('.day3').filter('tr:first').find("td:eq(0)").attr('rowspan');
		p=Number(p);
		$('.day3').filter('tr:first').find("td:eq(0)").attr('rowspan',p+1);
		$('.day3').filter('tr:last').after(plusSche);
	}
	

	
}

function minusDetailSche(minusBtn){
	var classDay = minusBtn.attr('class').split(" ")[1];
	var m;
	if(classDay=='day1'){

		m = $('.day1').filter('tr:first').find("td:eq(0)").attr('rowspan');
		m=Number(m);
		$('.day1').filter('tr:first').find("td:eq(0)").attr('rowspan',m-1);
		minusBtn.closest("tr").remove();
		
	}else if(classDay=='day2'){

		m = $('.day2').filter('tr:first').find("td:eq(0)").attr('rowspan');
		m=Number(m);
		$('.day2').filter('tr:first').find("td:eq(0)").attr('rowspan',m-1);
		minusBtn.closest("tr").remove();
		
	}else if(classDay=='day3'){

		m = $('.day3').filter('tr:first').find("td:eq(0)").attr('rowspan');
		m=Number(m);
		$('.day3').filter('tr:first').find("td:eq(0)").attr('rowspan',m-1);
		minusBtn.closest("tr").remove();
	}
	
	
}

function setDetailDay(){
	
	$("#day > tbody").empty();
	
	var sdate = $("#gstartdate").val().split('-');
	var fdate = $("#gfinishdate").val().split('-');
	var day = fdate[2]-sdate[2];
	var dayHTML = "";
	var dayHTMLinput = "<td><input type='time' id='timeMinMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
	dayHTMLinput += "<td><input type='text' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
	var dayHTMLinputPlusBtn1 = "<td><button class='dayplus day1' style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>+</button></td>";
	var dayHTMLinputPlusBtn2 = "<td><button class='dayplus day2'style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>+</button></td>";
	var dayHTMLinputPlusBtn3 = "<td><button class='dayplus day3' style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>+</button></td>";
	if(day==0){
		dayHTML+="<tr class='day1'>";
		dayHTML+="<td rowspan='1' class='InfoTd day1' style='vertical-align:top;'>DAY1</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+=dayHTMLinputPlusBtn1;
		dayHTML+="</tr>";
	}else if(day==1){
		dayHTML+="<tr class='day1'>";
		dayHTML+="<td rowspan='1' class='InfoTd day1' style='vertical-align:top;'>DAY1</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+=dayHTMLinputPlusBtn1;
		dayHTML+="</tr>";
		dayHTML+="<tr class='day2'>";
		dayHTML+="<td rowspan='1' class='InfoTd day2' style='vertical-align:top;'>DAY2</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+=dayHTMLinputPlusBtn2;
		dayHTML+="</tr>";
	}else if(day==2){
		dayHTML+="<tr class='day1'>";
		dayHTML+="<td rowspan='1' class='InfoTd day1' style='vertical-align:top;'>DAY1</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+=dayHTMLinputPlusBtn1;
		dayHTML+="</tr>";
		dayHTML+="<tr class='day2'>";
		dayHTML+="<td rowspan='1' class='InfoTd day2' style='vertical-align:top;'>DAY2</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+=dayHTMLinputPlusBtn2;
		dayHTML+="</tr>";
		dayHTML+="<tr class='day3'>";
		dayHTML+="<td rowspan='1' class='InfoTd day3' style='vertical-align:top;'>DAY3</td>";
		dayHTML+=dayHTMLinput;
		dayHTML+=dayHTMLinputPlusBtn3;
		dayHTML+="</tr>";
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