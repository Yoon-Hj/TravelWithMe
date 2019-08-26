<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Travel With Me</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font.css">
<link rel="stylesheet" type="text/css" href="css/full-page-scroll.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 여기서 부터 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<script language="javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- 여기까지 바꿈.(설정) -->

<style type="text/css">

	.section1 {
		background-image: url(imgs/korea.jpg);
		background-size: cover;
		margin-top: 15px;
	}
	
	.section2 {
		background-image: url(imgs/yeosu.PNG);
		background-size: cover;
		margin-top: -60px;
	}
	
	.section3 {
		background-image: url(imgs/night.jpg);
		background-size: cover;
	}

	.section4 {
		background-image: url(imgs/bg4.jpg);
		background-size: cover;
	}

	.section5 {
		background-image: url(imgs/je.jpg);
		background-size: cover;
	}
	
	.scroll-container{
		height: 100%;
	}
	
	section div {
		font-style: normal;
		text-align: center;
		position: relative;
		top: 50%;  
		transform: translateY(-50%);
	}
	
	span {
		font-size: 4em;
		font-style: normal;
		color: #fff;
	}
	
	h2{
		font-family: '함초롬돋움';
		color: #fff;
		text-align: center;
	}
	
	body{
		text-align: center;
	}

</style>
</head>

<jsp:include page="header.jsp"></jsp:include>

<body>
	<div id="main" class="scroll-container">
	
		<!-- 1쪽 -->
		<section class="section1">
		
			<jsp:include page="mainHeader.jsp"></jsp:include>

			<div style="margin-bottom: 250px;">
				<h2 style="font-size: 45px">새로운 만남ㆍ새로운 인연과 함께 여행을 시작해보세요!</h2>
				<br>	
				<div style="display: inline">
					<input class="form-control mr-sm-2" type="search" placeholder="Quick Search" aria-label="Search" 
							style="margin-left: 200px; width: 700px; height: 60px; float: left;">
					<input type="button" class="btn btn-danger" value="SEARCH" 
							style="width: 150px; height: 60px; margin-right: 150px; font-weight: bold; font-family: 배달의민족 도현; font-size: 20px">
				</div>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
				<input type="button" class="btn btn-outline-success"
						value="서비스 이용 가이드" data-toggle="modal" data-target="#useguideModal"
						style="float: right; margin-right: 80px; width: 200px; border-width: 3px; font-family: 배달의민족 도현; font-size: 15px; color: white;">
			</div>	
		  </section>
		
		<!-- 2쪽 -->
		<section class="section2">
		
		<jsp:include page="mainHeader.jsp"></jsp:include>
			<div>
				<h2 style="font-size: 45px;">나와 비슷한 취향의 여행 친구들을 찾아보세요</h2>
				<br>
				<input type="button" class="btn btn-danger btn-lg btn-block" 
						value="Travel with Me 목록 보기" onclick="location.href='accomBoardList.do'"
						style="float: right; margin-right: 100px; width: 300px; border-width: 3px; background-color: transparent !important; font-family: 배달의민족 도현; font-size: 20px">

				<br><br><br><br><br>
				 
				<h2 style="font-size: 45px;">함께할 여행 친구들을 직접 모아보세요</h2>
				<br>
				<input type="button" class="btn btn-danger btn-lg btn-block" 
						value="Travel with Me 글 작성" onclick="check()"
						style="float: right; margin-right: 100px; width: 300px; border-width: 3px; background-color: transparent !important; font-family: 배달의민족 도현; font-size: 20px">
			
			</div>			
		</section>
		
		<!-- 3쪽 -->
		<section class="section3">
			<jsp:include page="mainHeader.jsp"></jsp:include>
			
			<div>
				<h2 style="font-size: 45px">가이드를 만나 더 풍요로운 여행을 즐겨보세요</h2>
				<br>
				<input type="button" class="btn btn-danger btn-lg btn-block" 
						value="Travel with Guide 목록 보기"
						onclick="location.href='guideBoardList.do'" 
						style="float: right; margin-right: 100px; width: 300px; border-width: 3px; background-color: transparent !important; font-family: 배달의민족 도현; font-size: 20px">
			
				<br><br><br><br><br>
			
				<h2 style="font-size: 45px">나만의 투어를 계획하여 직접 가이드가 되어보세요</h2>
				<br>
				<input type="button" class="btn btn-danger btn-lg btn-block" 
						value="Travel with Guide 글 작성" 
						onclick="location.href='guideWriteForm.do'"
						style="float: right; margin-right: 100px; width: 300px; border-width: 3px; background-color: transparent !important; font-family: 배달의민족 도현; font-size: 20px">
			</div>
		</section>
		
		<section class="section4">
			<jsp:include page="mainHeader.jsp"></jsp:include>
			
			<div>
				<h2 style="font-size: 45px">여행 지역의 관광지와 여행 시기의 축제를 확인해보세요</h2>
				<br>
				<input type="button" class="btn btn-danger btn-lg btn-block" 
						value="Attraction Info 목록 보기" 
						onclick="location.href='attractionInfo.do'"
						style="float: right; margin-right: 100px; width: 300px; border-width: 3px; background-color: transparent !important; font-family: 배달의민족 도현; font-size: 20px">				
			</div>
		</section>
		
		<section class="section5">
			<jsp:include page="mainHeader.jsp"></jsp:include>
			
			<div>
				<h2 style="font-size: 45px">궁금한 것은 질문하고, 여행후기도 공유해보세요</h2>
				<br>
				<input type="button" class="btn btn-danger btn-lg btn-block" 
						value="Community 목록 보기" 
						style="float: right; margin-right: 100px; width: 300px; border-width: 3px; background-color: transparent !important; font-family: 배달의민족 도현; font-size: 20px">			
			</div>
		</section>
	</div>
	
	<!-- The Modal -->
	<div class="modal fade" id="useguideModal">
    	<div class="modal-dialog">
      		<div class="modal-content">
      		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h3 class="modal-title" style="font-family: 배달의민족 도현">서비스 이용 가이드</h3>
					<button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
	        
		        <!-- Modal body -->
		        <div class="modal-body">
		          해당 서비스를 효율적으로 이용하기 위한 가이드입니다.<br>
		          1. 신뢰지수<br>
		          
				  2. 가이드등급<br>
		        </div>
	        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
		        </div>
		        
      		</div>
    	</div>
 	 </div>
 	 
 	 <div style="position: fixed; bottom: 23px; right: 10px;">
 	 	<a href="#0"><img src="imgs/top.png" style="width: 60px;height: 60px;"></a>
 	 </div>
 	 
	<script src="js/full-page-scroll.js"></script>
	
	<script type="text/javascript">
		//location.href="../index.do";
		new fullScroll({
			mainElement: 'main',
			displayDots: false,
			dotsPosition: 'left',
			animateTime: 0.7,
			animateFunction: 'ease'
		});
	</script>
	
</body>

</html>
