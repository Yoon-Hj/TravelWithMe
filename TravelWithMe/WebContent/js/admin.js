$(function(){
	
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
		$( 'tbody').empty();
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
				$('.delThema').click(function(){
					if(confirm("삭제하시겠습니까?") == true){
//						$.ajax({
//							
//						});
						alert($(this).val());
					}
				})
			},
			error : function(){}
		});
		
	});
	
	
	
	
	
	
	
});


