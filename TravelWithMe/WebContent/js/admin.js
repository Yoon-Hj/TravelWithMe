$(document).ready(function(){
	
	
	
	
	
	$('#manageGrade').on('click', function(){
		$('.gradeDiv').show();
		$('.themaDiv').hide();
		
		$.ajax({
			url : "getGuidegrades.do",
			type : "post",
			success : function(data){
				$('#goldMin').val(data[0].minpoint);
				$('#silverMax').val(data[1].maxpoint);
				$('#silverMin').val(data[1].minpoint);
				$('#bronzeMax').val(data[2].maxpoint);
				$('#bronzeMin').val(data[2].minpoint);
			},
			error : function(){}
		});
	});
	
	$('#modiGrade').on('click', function(){
		var gmin = Number($('#goldMin').val());
		var smax = Number($('#silverMax').val());
		var smin = Number($('#silverMin').val());
		var bmax = Number($('#bronzeMax').val());
		
		if(gmin > 9000){
			alert("Gold등급의 최소값은 9000까지 가능합니다.");
		}else if(gmin <= smax){
			alert("Silver등급의 최대값은 Gold등급의 최소값보다 작아야 합니다.");
		}else if(smax <= smin){
			alert("Silver등급의 최대값은 최소값보다 커야 합니다.");
		}else if(smin <= bmax){
			alert("Bronze등급의 최대값은 Siver등급의 최소값보다 작아야 합니다.");
		}else if(bmax <= 1){
			alert("Bronze등급의 최대값은 1보다 커야합니다.");
		}else{
			if(gmin - smax != 1){
				smax = gmin -1;
			}else if(smin - bmax != 1){
				bmax = smin - 1;
			}
			$.ajax({
				url : "modifyGuideRating.do",
				type : "post",
				data : {
					gmin : gmin,
					smax : smax,
					smin : smin,
					bmax : bmax
				},
				success : function(){},
				error : function(){}
			});
			alert("수정이 완료되었습니다.");
			$('#manageGrade').trigger('click');
		}
			
		
	});
	
	
	
	
	
	$('#manageThema').on('click', function(){
		$('.themaDiv').show();
		$('.gradeDiv').hide();
		$( '#themaTbody').empty();
		var table = "";
		
		$.ajax({
			url : "getThemas.do",
			type : "post",
			data : {},
			success : function(data){
				for(var i in data){
					var cnt = Number(i) + 1;
					table += "<tr><td class='themaRow'>";
					table += cnt + ". " + data[i].likename;
					table += "</td><td class='themaRow'>";
					table += "<button class='delThema' value='" + data[i].likecode + "'>&times;</button></td></tr>";
				}
				$("#themaTbody:last").append(table);
				$('.themaRow').css('width', '100px');
				$('.themaRow').css('height', '50px');
				
				$(".delThema").on("click", function(){
					if(confirm("삭제하시겠습니까?") == true){
						$.ajax({
							url : "deleteThema.do",
							type : "post",
							data : {
								likecode : $(this).val()
							},
							success : function(){},
							error : function(){}
						});
						alert("삭제되었습니다.");
						$('#manageThema').trigger('click');
					}
				});
			},
			error : function(){}
		});
		
	});
	
	
	$('#addLike').on('click', function(){
		var like = $('#addlikes').val();
		
		if(like == "")
			alert("추가할 취향 / 테마를 입력해주세요.");
		else{
			$.ajax({
				url : "addThema.do",
				type : "post",
				data : {
					likename : like
				},
				success : function() {},
				erreor : function(){}
			})
			alert(like + "이 추가되었습니다.");
		}
		$('#manageThema').trigger('click');
		$('#addlikes').val("");
	});
	
	
	
});


