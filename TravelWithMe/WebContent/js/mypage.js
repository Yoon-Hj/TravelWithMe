$(document).ready(function(){
	$('#moreNews').on('click', function(){
		$('.starRev').hide();
		$('.modal-body').show();
		$( '#allNews > tbody').empty();
		$.ajax({
			url : "moreNotice.do",
			type : "post",
			success : function(data) {
				var nlist = data;
				var table = "";
				for(var i in nlist){
					var code = nlist[i].nkcode.split("-");
					var type = code[0];
					var type2 = "";
					if(type == "PM" || type == "PP" || type == "PR"){
						type = "[포인트 ?????]";
						type2 = 0;
					}else if(type == "RG" || type == "RC"){
						if(nlist[i].bkind == "A"){
							type = "[Travel with Me]";
						}else{
							type = "[Travel with Guide]";
						}
						type2 = 0;
					}else{
						type = "[참석여부 및 별점평가]";
						if(code[1] == "1")
							type2 = 1;
						else
							type2 = 2;
					}
					table += "<tr>";
					table += "<td>" + "<input type='hidden'  value='" + nlist[i].bnum + "/" + type2 + "/" + nlist[i].btitle + "'>" + "</td>"
					table += "<td style='width:400px'><p class='noticeDetail'>" + type + nlist[i].btitle + "<br>";
					table += nlist[i].nkreason + "</p></td>";
					table += "";
					table += "</tr>";
					
				}
				$("tbody:last").append(table);
			},
			error : function(){
				alert("?? 에러임; ");
			}
		});
	});
//	data-toggle="modal" data-target="#moreNewsForm"
	
	function evGuide(title, bnum){
		$('#guideTitle').html("'" + title + "'" + " 어땠나요?");
		$('#guideBnum').val(bnum);
		$('.modal-body').hide();
		$('.starRev').show();
	};
//	function evGuide(){
//		$('.test').show();
//	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	$(document).on('click', '.noticeDetail', function(){
		var delrow = $(this).closest("tr").find("input:eq(0)").val().split("/");
		var bnum = delrow[0];
		var type = delrow[1];
		var title = delrow[2];
		
		if(type == "0"){
			alert("게시글 화면으로 이동해.");
			evGuide(title, bnum);
		}else if(type == "1"){
			alert("별점평가 화면을 띄워");
			evGuide(title, bnum);
		}else if(type == "2"){
			alert("참석여부 화면을 띄워");
		}
	});
	
	$('#moreBoards').on('click', function(){
		alert("게시판 더보기 임.");
	});
	$('#moreRegister').on('click', function(){
		alert("신청목록 더보기 임.");
	});
	$('.cancelRegister').on('click', function(){
		var rid = $(this).val();
		alert("신청취소 임. " + rid);
	});
	

	
	
	

	
	
	
	// 별 누를때마다 점수 바뀌기
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  var point = $(this).html();
		  var gPoint = $('#gPoint');
		  gPoint.val(point);
		  alert(gPoint.val());
		  return false;
		});
	// 평가 완료후 컨트롤러로 보내기.
	$('#evGuide').on('click', function(){
		$.ajax({
			url : "evGuide.do",
			type : "post",
			data : {
				bnum : $('#guideBnum').val(),
				gPoint : $('#gPoint').val()
			},
			success : function() {},
			error : function(){}
		});
		alert("별점 평가가 완료되었습니다.");
	});
	
	
	
	
	
	
	
	
	

});






