$(document).ready(function(){
	showSlides(slideIndex);

	setGuideScheduleArray();
	$("#canvasDiv").empty();
	if(DAY1Array.length!=0){
		var guideScheCanvasDiv1 = "<canvas id='canvas1' width='600px' height='200px'></canvas><br>";
		$("#canvasDiv").append(guideScheCanvasDiv1);
		drawCanvas(1);
	}
	if(DAY2Array.length!=0){
		var guideScheCanvasDiv2 = "<canvas id='canvas2' width='600px' height='200px'></canvas><br>";
			$("#canvasDiv").append(guideScheCanvasDiv2);
		drawCanvas(2);
	}
	if(DAY3Array.length!=0){
		var guideScheCanvasDiv3 = "<canvas id='canvas3' width='600px' height='200px'></canvas><br>";
		$("#canvasDiv").append(guideScheCanvasDiv3);
		drawCanvas(3);
	}
});

//사진 슬라이드
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
function drawCanvas(d){
	if(d==1){
		var canvas = $("#canvas1")[0];
		var Array = DAY1Array;
	}else if(d==2){
		var canvas = $("#canvas2")[0];
		var Array = DAY2Array;
	}else if(d==3){
		var canvas = $("#canvas3")[0];
		var Array = DAY3Array;
		
	}
	
	if(canvas==null || canvas.getContext==null) return;
	var ctx = canvas.getContext("2d");
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	var x = 50;
	var y = 80;

	ctx.font="bold 20px 한초롬돋움";
	ctx.fillText("DAY"+d,30,30);	
	
	for(var n=0; n<Array.length; n++){
		
		ctx.beginPath();
		ctx.arc(x,y,10,0,2*Math.PI);
		
		
		ctx.font="bold 13px 한초롬돋움";
		ctx.fillText(Array[n].time,x-15,y-15);
		
		if(Array[n].place.length<=2){
			ctx.fillText(Array[n].place,x-10,y+30);		
		}else if(Array[n].place.length>2 && Array[n].place.length<=5){
			ctx.fillText(Array[n].place,x-25,y+30);	
		}else if(Array[n].place.length>5){
			ctx.fillText(Array[n].place,x-50,y+30);		
		}
		
		if(n==Array.length-1){
			ctx.stroke();
			break;
		}
		if(x<500&&y==80){
			ctx.moveTo(x+10,y);
			ctx.lineTo(x+140,y);
			x+=150;
		}else if(x==500&&y==80){
			ctx.moveTo(x+10,y);
			ctx.lineTo(x+85,y);
			ctx.moveTo(x+85,y);
			ctx.lineTo(x+85,y+80);
			ctx.moveTo(x+85,y+80);
			ctx.lineTo(x+10,y+80);
			y+=80;
		}
		else if(x>50&&y==160){
			ctx.moveTo(x-10,y);
			ctx.lineTo(x-140,y);
			x-=150;
		}
		ctx.stroke();
	}
}

//세부일정담기
var DAY1Array = new Array();
var DAY2Array = new Array();
var DAY3Array = new Array();
function setGuideScheduleArray(){
	$("input[name=sdate]").each(function(){		
		var day = $("input[name=sdate]").val();
		if(day==DAY1){
			var DAY1 = new Object;
			DAY1.time=$("input[name=stime]").val();
			DAY1.place=$("input[name=splace]").val();
			DAY1Array.push(DAY1);
		}else if(day==DAY2){
			var DAY2 = new Object;
			DAY2.time=$("input[name=stime]").val();
			DAY2.place=$("input[name=splace]").val();
			DAY2Array.push(DAY2);
		}else if(day==DAY3){
			var DAY3 = new Object;
			DAY3.time=$("input[name=stime]").val();
			DAY3.place=$("input[name=splace]").val();
			DAY3Array.push(DAY3);
		}
	});
}

