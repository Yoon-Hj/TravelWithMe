<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

	 body, html {
	  height: 96.5%;
	  margin: 0;
	 }
	
	.bgimg {
	  background-image: url('imgs/soon.jpg');
	  height: 100%;
	  background-position: center;
	  background-size: cover;
	  position: relative;
	  color: white;
	  font-family: "Courier New", Courier, monospace;
	  font-size: 25px;
	}
	
	.middle {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  text-align: center;
	}
	
	hr {
	  margin: auto;
	  width: 40%;
	}
</style>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="bgimg" style="margin-top: 13px;">
	  <div class="middle">
	    <h1 style="font-size: 70px;">COMING SOON</h1>
	    <hr>
	    <p id="demo" style="font-size:50px"></p>
	  </div>
	</div>
	
	<script>
	// Set the date we're counting down to
	var countDownDate = new Date("Sept 30, 2019 15:37:25").getTime();
	
	// Update the count down every 1 second
	var countdownfunction = setInterval(function() {
	
	  // Get todays date and time
	  var now = new Date().getTime();
	  
	  // Find the distance between now an the count down date
	  var distance = countDownDate - now;
	  
	  // Time calculations for days, hours, minutes and seconds
	  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	  
	  // Output the result in an element with id="demo"
	  document.getElementById("demo").innerHTML = days + "d " + hours + "h "
	  + minutes + "m " + seconds + "s ";
	  
	  // If the count down is over, write some text 
	  if (distance < 0) {
	    clearInterval(countdownfunction);
	    document.getElementById("demo").innerHTML = "EXPIRED";
	  }
	}, 1000);
	
	</script>
</body>
</html>