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
		if($("#gfinishdate").val() < $("#gstartdate").val()) alert("종료 날짜를 정확히 입력하세요");
		if($("#gstartdate").val()!=""){
			if($("#gfinishdate").val()==$("#gstartdate").val()){
				$("#gtimeLabel").remove();
				var input = "";
				input += "<label id='gtimeLabel'>";
				input += "&nbsp;<input type='radio' id='gtime' name='gtime' value='오전'>&nbsp;오전";
				input += "&nbsp;<input type='radio' id='gtime' name='gtime' value='오후'>&nbsp;오후";
				input += "&nbsp;<input type='radio' id='gtime' name='gtime' value='종일' checked='checked'>&nbsp;종일";
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
	$(document).on('focusout','.timeMinMax',function(){
		var thisClass = $(this);
		setTimeMinMax(thisClass);
		
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
	
	//테마 엔터키
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
	//테마 포커스 아웃
	$("#gthema").focusout(function(key) {
		
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
	
	//세부일정 투어내용 글자수 제한
	$(document).on('focusout','.placeMax',function(){
		if($(this).val().length>10){
			alert("투어내용은 글자 수 10글자 제한입니다. 다시 작성해주세요.");
			$(this).val("");
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
		$(".slideshow-container").empty();
		$("#photoTd").empty();
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var index = 0;
		filesArr.forEach(function(f){
			if(index<10){
				sel_files.push(f);				
				var reader = new FileReader();
				reader.onload=function(e){	
					var slideHTML = "<div class='mySlides'>";
					slideHTML+="<a><img src='";
					slideHTML+=e.target.result;
					slideHTML+="' style='width: 300px; height: 250px; margin-left: 80px;'></a></div>";
					$(".slideshow-container").append(slideHTML);			
					
					var html = "<a onclick='deleteImageAction("+index+")' id='img_id_"+index+"'><img style='width:100px;height:100px;margin-top:5px;' src='"+e.target.result+"' class='selProductFile' title='Click to remove'>&nbsp;</a>";
					$(".imgs_wrap").append(html);			
				}
				reader.readAsDataURL(f);
			}
			index++;
		});
		if(index > 10)
			alert("사진은 최대 10장만 업로드 가능합니다. 초과된 사진은 자동으로 삭제합니다.");
		if(index!=0){
			var prevnextBtn = "<a id='prev' style='color:white' onclick='plusSlides(-1)'>&#10094;</a>";
			prevnextBtn += "<a id='next' style='color:white' onclick='plusSlides(1)'>&#10095;</a>";
			$(".slideshow-container").append(prevnextBtn);
			
			var photoTd = "<td id='photoTd'>&nbsp;</td>";
			$("#photoTR").prepend(photoTd);
		}
		
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
	
	$("#day > tbody").find(":input[type=text]").each(function(){
		if($(this).val().length>10) alert("글자 수 10자로 제한합니다.");
	});
	
	//모집인원 마이너스값 못넣게 하기
	$("#gnop").focusout(function(){
		if($("#gnop").val()<0){
			alert("1명보다 적은 모집인원은 선택할 수 없습니다. 다시 선택하세요");
			$("#gnop").val("1");
		}
	});

	
	//basic에서 detail로 넘어갈 때 제한사항
	$("#basicTodetail").click(function(){
//		var flag = false;
//		var policyflag = false;
//		
//		//정책 제한하기
//		var x = $("input:checkbox[name=pcode]:checked").length;
//		if(x==0) flag=false;
//		else{
//			$('input:checkbox[name=pcode]:checked').each(function(){
//				var t = $(this).val();
//				if(t==1) policyflag = true;
//				else if(t==2){
//					if($("#pvalue2").val()=="") flag=false;
//					if($("#pvalue2").val() < 0) {
//						policyflag = false;
//						alert("2번정책이 올바른 조건이 아닙니다. 다시 확인하세요.");
//						$("#pvalue2").val("");
//					}else{
//						policyflag=true;
//					}
//				}
//				else if(t==3){
//					if($("#pvalue3").val()=="") flag=false;
//					if($("#pvalue3").val()<0 || $("#pvalue3").val()>100 ){
//						policyflag = false;
//						alert("3번정책이 올바른 조건이 아닙니다. 다시 확인하세요.");
//						$("#pvalue3").val("");
//					}else{
//						policyflag=true;
//					}
//				}
//				
//			});			
//		}
//		
//		if($("#gstartdate").val()<todayDate || $("#gfinishdate").val() < $("#gstartdate").val() 
//				|| $("#genddate").val() > $("#gstartdate").val()) {
//				
//				alert("올바른 날짜가 아닙니다. 다시 한번 확인하세요");
//				$("#gstartdate").val("");
//				$("#gfinishdate").val("");
//				$("#genddate").val("");
//			}
//		
//		if($("#btitle").val()!="" && $("#gstartdate").val()!="" && $("#gfinishdate").val()!=""
//			&& $("#genddate").val()!="" && $("#gdepartplace").val()!="" && $("#gdeparttime").val()!=""
//			&& $("#garea1").val()!="" && $("#garea2").val()!="" && $("#gnop").val()!="" )
//		{
//			flag=true;
//		}
//		
//		if(!flag || !policyflag){
//			alert("필수작성 사항을 기입해주세요");			
//		}else if(flag && policyflag){
//			openDetailInfo();
//			flag=false;
//			policyflag = false;
//		}
		openDetailInfo();
	});
	
	//상세정보에서 기본정보로 넘어갈 때
	$("#detailToBasic").click(function(){
		  if (confirm("현재 페이지 이동을 하면 현재 페이지에 작성한 세부일정이 삭제됩니다. 그래도 이동하시겠습니까?") == true){   
			  openBasicInfo();
		  }else{   
			  return;
		  }			    
	});
		
	//상세정보에서 미리보기로 넘어갈 때
	$("#detailToPreview").click(function(){
//		var flag = true;
//		
//		
//		$("#day > tbody").find(":input[type=text]").each(function(){
//			if($(this).val()=="") flag = false;
//		});
//		$("#day > tbody").find(":input[type=time]").each(function(){
//			if($(this).val()=="") flag = false;
//		});
//		
//		if(!flag){
//			alert("필수작성 사항을 기입해주세요");
//		}else{
//			openPreview();
//		}
		openPreview();
	});
	
	$("#previewToDetail").click(function(){
		openDetailInfo();
	});
	
	$("#submit").click(function(){
		//gtime담기
		var gtime = $("#gtime").val();
		
		//정책담기
		var pcodeArray = new Array();
		var pvalueArray = new Array();
		$('input:checkbox[name=pcode]:checked').each(function(){
			var t = $(this).val();
			pcodeArray.push(t);
			if(t==2){
				pvalueArray.push($("#pvalue2").val());
			}
			if(t==3){
				pvalueArray.push($("#pvalue3").val());
			}
		});
	
		//스케쥴 담기 한번 더 해야하는지 아니면 배열 남아있는지 확인해봐!
		//setGuideScheduleArray()

		var form = $('#uploadForm')[0];
	    var formData = new FormData(form);
		
	    formData.append("btitle" , $("#btitle").val());
	    formData.append("JSPgstartdate" , $("#gstartdate").val());
	    formData.append("JSPgfinishdate" , $("#gfinishdate").val());
	    formData.append("gtime" , gtime);
	    formData.append("JSPgenddate" , $("#genddate").val());
	    formData.append("gdepartplace" , $("#gdepartplace").val());
	    formData.append("gdeparttime" , $("#gdeparttime").val());
	    formData.append("garea1" , $("#garea1").val());
	    formData.append("garea2" , $("#garea2").val());
	    formData.append("gnop" , $("#gnop").val());
	    formData.append("pcode" , pcodeArray);
	    formData.append("pvalue" , pvalueArray);
	    formData.append("gthema" , $(".sharpThema").text());
	    //생각 필요...뒤지것다
	    formData.append("DAY1time" , DAY1time);
	    formData.append("DAY2time" , DAY2time);
	    formData.append("DAY3time" , DAY3time);
	    formData.append("DAY1place" , DAY1place);
	    formData.append("DAY2place" , DAY2place);
	    formData.append("DAY3place" , DAY3place);
	    formData.append("bcontent" , $("#bcontent").val());

	    
		$.ajax({
			url : "showGuidePreview.do",
			traditional : true,
            processData: false,
            contentType: false,
			type : "POST",
			data : formData,
			success : function(data){
				alert("성공");
			},
			error: function(){
				alert("다시 시도해주세요");
			}
			
		});
	});
	


});
//사진 담기용 배열
var sel_files = [];

//최소시간 최대시간 설정
function setTimeMinMax(thisClass){
	var timeForOneDay = $(':radio[name="gtime"]:checked').val();
	var test = thisClass.val();
	if(timeForOneDay=='오전') {
		if(test>'12:00') {
			alert('선택할 수 없는 시간대입니다. 다시 확인하세요.');
			thisClass.val("");
		}
	}
	else if(timeForOneDay=='오후') {
		if(test<'12:00') {
			alert('선택할 수 없는 시간대입니다. 다시 확인하세요.');
			thisClass.val("");
		}
	}
}



//스케쥴 + 버튼 누르기
var pluscnt1 = 0;
var pluscnt2 = 0;
var pluscnt3 = 0;
function plusDetailSche(plusBtn){
		
		var plusSche = "";	
		var classDay = plusBtn.attr('class').split(" ")[1];
		var p;
		
		if(classDay=='day1'){
			pluscnt1++;
			if(pluscnt1<8){
				
				plusSche +="<tr class='day1'>";
				plusSche += "<td><input type='time' class='timeMinMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
				plusSche += "<td><input type='text' class='placeMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
				plusSche += "<td><button class='dayminus day1' style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>-</button></td>";
				plusSche +="</tr>";
				
				p = $('.day1').filter('tr:first').find("td:eq(0)").attr('rowspan');
				p=Number(p);
				$('.day1').filter('tr:first').find("td:eq(0)").attr('rowspan',p+1);
				$('.day1').filter('tr:last').after(plusSche);
			}else{
				alert("하루 일정은 8개의 일정만 설정가능합니다.");
			}
			
		}else if(classDay=='day2'){
			pluscnt2++;
			if(pluscnt2<8){
				plusSche +="<tr class='day2'>";
				plusSche += "<td><input type='time' class='timeMinMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
				plusSche += "<td><input type='text' class='placeMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
				plusSche += "<td><button class='dayminus day2' style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>-</button></td>";
				plusSche +="</tr>";
				
				p = $('.day2').filter('tr:first').find("td:eq(0)").attr('rowspan');
				p=Number(p);
				$('.day2').filter('tr:first').find("td:eq(0)").attr('rowspan',p+1);
				$('.day2').filter('tr:last').after(plusSche);
			}else{
				alert("하루 일정은 8개의 일정만 설정가능합니다.");
			}
			
		}else if(classDay=='day3'){
			pluscnt3++;
			if(pluscnt3<8){
				plusSche +="<tr class='day3'>";
				plusSche += "<td><input type='time' class='timeMinMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
				plusSche += "<td><input type='text' class='placeMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
				plusSche += "<td><button class='dayminus day3' style='cursor: pointer; width: 30px; border: none; background-color: rgb(181, 195, 200);'>-</button></td>";
				plusSche +="</tr>";
				
				p = $('.day3').filter('tr:first').find("td:eq(0)").attr('rowspan');
				p=Number(p);
				$('.day3').filter('tr:first').find("td:eq(0)").attr('rowspan',p+1);
				$('.day3').filter('tr:last').after(plusSche);
			}else{
				alert("하루 일정은 8개의 일정만 설정가능합니다.");
			}
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
	var dayHTMLinput = "<td><input type='time' class='timeMinMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
	dayHTMLinput += "<td><input type='text' class='placeMax' style='width:200px; border: 1px solid #ccc; border-radius: 4px; padding: 5px; color: #787878; '></td>";
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
	pluscnt1 = 0;
	pluscnt2 = 0;
	pluscnt3 = 0;
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
	
	//제목
	$("#previewTable").find("tr:eq(1)").find("td:eq(1)").text($("#btitle").val());
	//사진
	showSlides(slideIndex);
	//날짜
	if($("#gstartdate").val()==$("#gfinishdate").val()){
		$("#previewTable").find("tr:eq(3)").find("td:eq(1)").html($("#gstartdate").val()+"&nbsp;&nbsp;~&nbsp;&nbsp;"+$("#gfinishdate").val()+"&nbsp;&nbsp;"+$("#gtime").val());				
	}else{
		$("#previewTable").find("tr:eq(3)").find("td:eq(1)").html($("#gstartdate").val()+"&nbsp;&nbsp;~&nbsp;&nbsp;"+$("#gfinishdate").val());				
	}
	//모집마감날짜
	$("#previewTable").find("tr:eq(4)").find("td:eq(1)").text($("#genddate").val());
	//출발장소 및 시간
	$("#previewTable").find("tr:eq(5)").find("td:eq(1)").html($("#gdepartplace").val()+"&nbsp;&nbsp;"+$("#gdeparttime").val());
	//지역
	$("#previewTable").find("tr:eq(6)").find("td:eq(1)").html($("#garea1").val()+"&nbsp;&nbsp;"+$("#garea2").val());
	//인원
	$("#previewTable").find("tr:eq(7)").find("td:eq(1)").text($("#gnop").val()+"명");
	//테마
	$("#previewTable").find("tr:eq(8)").find("td:eq(1)").text($(".sharpThema").text());
	//투어소개
	$("#previewTable").find("tr:eq(9)").find("td:eq(1)").text($("#bcontent").val());
	//세부일정
	setGuideScheduleArray()
	drawCanvas();
	
	
	
	if(DAY1time.length!=0){
		
	}
	if(DAY2time.length!=0){
		
	}
	if(DAY3time.length!=0){
		
	}
	
	//주요 정책
	

	

	
	
	
}

//세부일정 내역 담기
var DAY1time = new Array();
var DAY1place = new Array();
var DAY2time = new Array();
var DAY2place = new Array();
var DAY3time = new Array();
var DAY3place = new Array();
function setGuideScheduleArray(){
	$("#day > tbody").find(".day1").find(":input[type=time]").each(function(){
		DAY1time.push($(this).val());
	});
	$("#day > tbody").find(".day1").find(":input[type=text]").each(function(){
		DAY1place.push($(this).val());
	});
	
	$("#day > tbody").find(".day2").find(":input[type=time]").each(function(){
		DAY2time.push($(this).val());
	});
	$("#day > tbody").find(".day2").find(":input[type=text]").each(function(){
		DAY2place.push($(this).val());
	});
	
	$("#day > tbody").find(".day3").find(":input[type=time]").each(function(){
		DAY3time.push($(this).val());
	});
	$("#day > tbody").find(".day3").find(":input[type=text]").each(function(){
		DAY3place.push($(this).val());
	});
	
}

//사진슬라이드 js
var slideIndex = 1;
function plusSlides(n) {
  showSlides(slideIndex += n);
}
function showSlides(n) {
  var i;
  var slides = $(".mySlides");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
	  $(".slideshow-container").find("div:eq("+i+")").css("display", "none");  
  }

  $(".slideshow-container").find("div:eq("+Number(slideIndex-1)+")").css("display", "block");  
}

//canvas
function drawCanvas(){
	var canvas = $("#canvas")[0];
	if(canvas==null || canvas.getContext==null) return;
	var ctx = canvas.getContext("2d");
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	var x = 50;
	var y = 35;
	
	for(var n=0; n<DAY1time.length; n++){
		
		ctx.beginPath();
		ctx.arc(x,y,10,0,2*Math.PI);
		
		ctx.font="bold 13px 한초롬돋움";
		ctx.fillText(DAY1time[n],x-15,y-15);
		if(DAY1place[n].length<=5){
			ctx.fillText(DAY1place[n],x-25,y+30);	
		}else if(DAY1place[n].length>5){
			ctx.fillText(DAY1place[n],x-50,y+30);		
		}
		
		if(n==DAY1time.length-1){
			ctx.stroke();
			break;
		}
		if(x<530&&y==35){
			ctx.moveTo(x+10,y);
			ctx.lineTo(x+150,y);
			x+=160;
		}else if(x==530&&y==35){
			ctx.moveTo(x+10,y);
			ctx.lineTo(x+75,y);
			ctx.moveTo(x+75,y);
			ctx.lineTo(x+75,y+80);
			ctx.moveTo(x+75,y+80);
			ctx.lineTo(x+10,y+80);
			y+=80;
		}
		else if(x>50&&y==115){
			ctx.moveTo(x-10,y);
			ctx.lineTo(x-150,y);
			x-=160;
		}
		ctx.stroke();
	}
}