function check(){
	//var user = <%=(String)session.getAttribute("user")%>;
		if(user == null){
		alert("session이 만료됨");
	}
	
}