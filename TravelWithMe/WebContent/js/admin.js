$(document).ready(function(){
	
	
	
	
	
	$('#manageGrade').on('click', function(){
		$('.gradeDiv').show();
		$('.themaDiv').hide();
		
		$.ajax({
			url : "getGuidegrades.do",
			type : "post",
			success : function(data){
				
			},
			error : function(){}
		});
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


