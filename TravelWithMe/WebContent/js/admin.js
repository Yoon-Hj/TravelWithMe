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
		
		var table = "";
		$.ajax({
			url : "getThemas.do",
			type : "post",
			data : {},
			success : function(data){
				for(var i in data){
					var cnt = Number(i) + 1;
					table += "<tr><td>";
					table += cnt + ". " + data[i].likename;
					table += "</td></tr>";
				}
				$("#themaTbody:last").append(table);
			},
			error : function(){}
		});
		
	});
	
	
	
	
	
	
	
	
	
	
});


