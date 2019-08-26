$(document).ready(function(){
	
	$('#writetip').tooltip();   
		  
	var type=$("#hiddenType").val();
	//검색타입
	if(type=='') {
		$(".custom-select").val(1);		
	}else{		
		$(".custom-select").val(type);
	}


	
	
	
});