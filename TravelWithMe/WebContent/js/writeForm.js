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
		var valueEndDate = Number(startDate)-1;
		var FinishDateMaxDate = Number(startDate)+2;
		var maxDate =  minDate.split('-')[0]+"-"+ minDate.split('-')[1]+"-"+FinishDateMaxDate;
		var endDate =  minDate.split('-')[0]+"-"+ minDate.split('-')[1]+"-"+valueEndDate;
		$("#gfinishdate").attr('max',maxDate);
		$("#genddate").attr('value',endDate);
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
	$("#gdeparttime").focusout(function(){
		if($("#gstartdate").val()==""){
			$("#gtimeLabel").remove();
			alert("시작날짜를 먼저 선택해주세요");		
		}
		else{
			var timeForOneDay = $(':radio[name="gtime"]:checked').val();
			var test = $("#gdeparttime").val();
			if(timeForOneDay=='오전') {
				if(test>'12:00') {
					alert('선택할 수 없는 시간대입니다. 다시 확인하세요.');
					$("#gdeparttime").val("");
				}
			}
			else if(timeForOneDay=='오후') {
				if(test<'12:00') {
					alert('선택할 수 없는 시간대입니다. 다시 확인하세요.');
					$("#gdeparttime").val("");
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
				$("#gthema").after("<a class='sharpThema' style='cursor: pointer;'>&nbsp;#"+$("#gthema").val()+"</a>");
				$("#gthema").val("");				
			}
		}			
	
	});
	
	//가이드 테마 삭제하기
	$(document).on('click','.sharpThema',function(){
		var a = $(this).text();
		  if (confirm("'"+a+"' 테마를 삭제하시겠습니까?") == true){   
		      $(this).remove();
		  }else{   
		      return;
		  }
			
	});
	
	//사진 첨부버튼 누르기
	$("#photoUpload").click(function(){
		$("#photo").trigger("click");
	});
	
	//사진미리보기
	$("#photo").on("change",function(e){
		sel_files=[];
		$(".imgs_wrap").empty();
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var index = 0;
		filesArr.forEach(function(f){
			if(index<=9){
				sel_files.push(f);				
				var reader = new FileReader();
				reader.onload=function(e){
					var html = "<a onclick='deleteImageAction("+index+")' id='img_id_"+index+"'><img style='width:100px;height:100px;margin-top:5px;' src='"+e.target.result+"' class='selProductFile' title='Click to remove'>&nbsp;</a>";
					$(".imgs_wrap").append(html);
										
				}
				reader.readAsDataURL(f);
			}
			index++;
		});
		if(index > 9)
			alert("사진은 최대 10장만 업로드 가능합니다. 초과된 사진은 자동으로 삭제합니다.");
	});
	
	//정책 1번클릭시 2번,3번 풀리기
	$("#pcode1").click(function(){
		$("#pcode2").prop("checked",false);
		$("#pcode3").prop("checked",false);
	});
	$("#pcode2").click(function(){
		$("#pcode1").prop("checked",false);
	});
	$("#pcode3").click(function(){
		$("#pcode1").prop("checked",false);
	});

	
	//basic에서 detail로 넘어갈 때 제한사항
	$("#basicTodetail").click(function(){
		var flag = false;
		
		//정책 제한하기
		var x = $("input:checkbox[name=pcode]:checked").length;
		if(x==0) flag=false;
		else{
			$('input:checkbox[name=pcode]:checked').each(function(){
				var t = $(this).val();
				if(t==2){
					if($("#pvalue2").val()=="") flag=false;
				}
				if(t==3){
					if($("#pvalue3").val()=="") flag=false;
				}
				
			});			
		}
		
		if($("#gtitle").val()!="" && $("#gstartdate").val()!="" && $("#gfinishdate").val()!=""
			&& $("#genddate").val()!="" && $("#gdepartplace").val()!="" && $("#gdeparttime").val()!=""
			&& $("#garea1").val()!="" && $("#garea2").val()!="" && $("#gnop").val()!="")
		{
			flag=true;
		}
		
		if(!flag){
			alert("필수작성 사항을 기입해주세요");			
		}else{
			openDetailInfo();
			flag=false;
		}
	
	});


});

//사진 담을 배열
var sel_files=[];

//사진삭제하기
function deleteImageAction(index){
	sel_files.splice(index,1);
	var img_id = "#img_id_"+index;
	$(img_id).remove();
}


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