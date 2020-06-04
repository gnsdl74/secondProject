<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/booking.css">
<link rel="shortcut icon" href="/resources/img/tiger.jpg">


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>
.reservation-date {
	position: relative;
	height: 40px;
	border-bottom: 1px solid #d8d9db;
}

.reservation-date-inner {position: relative; margin-right: 40px;}

.date-btn {
	position: absolute;
	font-size: 25px;
	color: #444;
	top: 4px;
}

.date-btn.date-prev-btn {
	left: 20px;
}

.date-btn.date-next-btn {
	right: 20px;
}

.date-btn-list {
	display: block;
	padding: 0 40px;
}

.date-btn-list button {
	display: inline-block;
	vertical-align: middle;
	margin: 0 10px;
	font-size: 16px;
	line-height: 40px;
}

.date-icon {
	position: absolute; 
	display: inline-block;
	width: 29px;
	height: 35px;
	right: 8px;
	top: 0px; 
	padding: 5px 0px 0 10px;
	border-left: 1px solid #d8d9db;
}

.date-icon button {outline: none;}

.date-icon .ui-datepicker-trigger {margin-left: 0;}

.movie-frame-title {
	width: 100%;
	text-align:left;
	font-size: 20px; 
	color: #222;
	height: 38px;
	line-height: 38px;
	padding-left: 20px;
	box-sizing: border-box;
}

.schedule-frame-title {
	width: 100%;
	text-align:left;
	font-size: 20px; 
	color: #222;
	height: 38px;
	line-height: 38px;
	padding-left: 20px;
	box-sizing: border-box;
}

.movie-frame {
	width: 659px;
	float: left;
}

.movie-area{	
	width: 250px;
	float:left;
}

.movie-area{
	overflow-y: scroll;
	width:300px; 
	height:390px;
	margin-left: 30px; 
	border: 0;
	text-align: left;
}
.movie-area span {display: inline-block; vertical-align: middle; color: #000; font-size:16px;}
.movie-area span:first-child {margin-right: 5px;}

#movie-btn{
	width: 265px;
	height: 35px;
	margin-bottom: 1px;
	text-align: left;
}
.movie-poster{
	width: 329px;
	height: 390px;
	float:right;	
}


.poster-area {height: 390px; line-height: 390px;}

.poster{	
	display: inline-block;
	max-width: 100%;
	height: auto;
	max-height: 100%;
}

.schedule-frame {
	float: right;
	width: 439px;
	border-left: 1px solid #d8d9db;
	overflow-y: scroll;
	height: 460px;
}


#schedule-btn {
	width: 100%;
	height: 45px;
	margin-bottom: 1px;
	border-bottom: 1px solid #d8d9db;
}

.date-text{	
	width : 39px;
	height: 18px;	

}

list{
	list-style-type: none;
}

.date-btn-area{
	border: 1px solid white;
	margin-bottom: 1px;
}

.date-prev-btn{
	border: 1px solid white;
	background-color: rgba(0,0,0,0);

}

.date-next-btn{
	border: 1px solid white;
	background-color: rgba(0,0,0,0);		
}
#date-btn{
	background-color: rgba(0,0,0,0);
	color:black;
	padding: 3px;
}

#date-btn-sun{
	background-color: rgba(0,0,0,0);
	color:red;
	padding: 3px;
}

#date-btn-sat{
	background-color: rgba(0,0,0,0);
	color:blue;
	padding: 3px;
}

.ui-datepicker-trigger{
	margin-left: 8px;
}

#movie-btn-* span {
	text-align: left;
}

</style>


</head>

<body>
	<!-- Header -->

	<jsp:include page="../header.jsp"></jsp:include>

	<!-- // Header -->
	<!-- frame(여백포함) div -->
	<div>

		<!-- 예매 > 빠른예매 div  -->
		<div class="sub-location">
			<div class="sub-location-inner">
				<i class="material-icons">&#xe88a;</i>
				<p>> 예매 > 빠른예매</p>
			</div>
		</div>
		<!-- // 예매 > 빠른예매 div  -->

		<!-- frame -->
		<div class="frame" align="center">

			<div class="area">

				<!-- 빠른예매 div -->
				<div class="sub-reservation-tit">
					<p>빠른예매</p>
				</div>
				<!-- // 빠른예매 div -->

				<!-- frame-main -->
				<div class="frame-main">
					<!-- 날짜 선택 -->
					<div class="reservation-date">


						<div class="reservation-date-inner">
							<c:if test="true">
								<button class="date-prev-btn date-btn"><</button>
							</c:if>


							<span class="date-btn-list"></span>


							<c:if test="true">
								<button class="date-next-btn date-btn">></button>
							</c:if>
						</div>

						<span><input type="hidden" name="dateValue" id="dateVal" ></span>		
						<span class="date-icon"><input type="hidden" name="date"
							id="datepicker" size="12" /></span>


					</div>
					<!-- // 날짜 선택 -->
					<!-- 영화,시간 -->
					<div class="frame-main-body clearfix">
						<!-- 영화 목록 -->
						<div class="movie-frame">
							<div class="movie-frame-title">영화</div>
							<!-- 1 -->
							<div>
								<!-- 영화 선택 -->
								<div class="movie-area">
									<!-- 영화 list -->
									<div class="movie-list" align="center">
										<ul class ="list"  style="none;">
											<!-- 영화 제목 출력 -->
											<c:forEach var="movieVO" items="${movieList }">
												<li><button type="button" id="movie-btn" onclick="movieBtnClick(this.value)" value="${movieVO.movieNo}" >
												<span ><img id="movie-age-${movieVO.movieAge }"  alt="${movieVO.movieAge }" src=""></span>
												<span class="title">${movieVO.movieTitle }</span>
												</button></li>
											</c:forEach>	
										</ul>
									</div>
									<!--// 영화 list -->
								</div>
								<!--// 영화 선택 -->
								<!-- 영화 포스터 -->
								<div class="movie-poster">
									<div class="poster-area">
										<img class="poster " alt="poster_area"
											src="/resources/img/poster_area1.png">
									</div>
								</div>
								<!--// 영화 포스터 -->
							</div>
							<!-- // 1 -->
						</div>
						<!-- // 영화 목록 -->
						<!-- 상영시간 선택 -->
						<div class="schedule-frame">
							<!-- 제목 -->
							<div class="schedule-frame-title">시간</div>
							<!-- 상영 시간 -->
							<div class="schedule-hour"></div>
							<!-- 상영 목록 -->
							<div class="schedule-list">
								<ul class ="list" style="list-style-type: none; magin: 0;">
									<c:forEach var="scheduleDetailVO" items="${scheduleList }">
										<li>
											<button id="schedule-btn" onclick="scheduleBtnClick(this.value)" value="${scheduleDetailVO.scheduleNo }">
												<span class="time">${scheduleDetailVO.scheduleTime }</span>
												<span class="title">${scheduleDetailVO.movieTitle }</span> 
												<span class="theater">${scheduleDetailVO.theaterName }</span> 
												<span class="seat">${scheduleDetailVO.seatCount }/${scheduleDetailVO.theaterSeat }</span>
											</button>
										</li>
									</c:forEach>
								</ul>
							</div>
							<!-- // 상영 목록 -->
						</div>
						<!-- // 상영시간 선택 -->
					</div>
					<!-- // 영화,시간 -->

				</div>
				<!-- // frame-main -->

			</div>

		</div>
		<!-- // frame -->

	</div>
	<!-- // frame(여백포함) div -->
	<!-- Footer -->


	<jsp:include page="../footer.jsp"></jsp:include>

	<!-- // Footer -->

 	<!-- 날짜버튼관련 script -->
	<script type="text/javascript">
		let date = new Date(); // 오늘날짜 설정
		
		getDate(date); // 날짜를 출력하는 함수 
		
		function getDate(date){ 
				let list = ''; // 출력할 요소
				let week = ''; // 요일(한글)				
				let dateVal = '' // 버튼에 들어가는 날짜 값
				
				for(var i=0; i<14; i++){ 
					
					switch(date.getDay()){ // 요일(한글 입력)
					case 0:
						week = '일';
						 break;
					case 1:
						week = '월';
						 break;
					case 2:
						week = '화';
						 break;
					case 3:
						week = '수';
						 break;
					case 4:
						week = '목';
						 break;
					case 5:
						week = '금';
						 break;
					case 6:
						week = '토';
						 break;
					default:
						console.log('요일 error');
					} // end switch						
						if(week=="일"){
							list += '<button type="button" id="date-btn-sun" onclick="dateBtnClick(this.value)" value=" ' +  
							date + ' "">' +"<div class='date-text'>" + date.getDate() + "."+ week + "<div>";  
							+'</button>' ;
						}else if(week=="토"){
							list += '<button type="button" id="date-btn-sat" onclick="dateBtnClick(this.value)" value=" ' +  
							date + ' "">' +"<div class='date-text'>" + date.getDate() + "."+ week + "<div>";  
							+'</button>' ;
						} else {
							list += '<button type="button" id="date-btn" onclick="dateBtnClick(this.value)" value=" ' +  
							date + ' "">' +"<div class='date-text'>" +  date.getDate() + "."+ week + "<div>";  
							+'</button>' ;
						} // end if
				
					// 버튼 출력					
					
					if(i != 13){ // 반복문 마지막 순서에서 date 값을 첫번째 버튼의 날짜로 변경
					 date.setDate(date.getDate() +1);						
					}else {
					date.setDate(date.getDate() - 13);
					 console.log('첫번째 버튼날짜 : ' + date);
						}					
					} // end for
					
				$('.date-btn-list').html(list);	// 버튼 추가
				$('#dateVal').val(' ' + date);  // 오늘날짜 input에 넣어주기
				
				} // end getDate()	
		
				
			
					$('.date-prev-btn').click(function(){
						let today = new Date();
						if(today >= date){ // 이전 날짜가 오늘 날짜보다 작으면 실행하지않음.
							console.log('오늘 날짜보다 작습니다.')
						}else {
							date.setDate(date.getDate() -1);
							console.log(date.getDate());
							getDate(date);	
							dateBtnClick(date);
						}								
					}); // end next-prev-click()
					
					$('.date-next-btn').click(function(){
						date.setDate(date.getDate() +1);
						console.log("첫번째 버튼 날짜 : " + date);
						getDate(date);
						dateBtnClick(' ' + date);
						}); // end next-btn-click()
						
			
	</script>	

 	<!-- 날짜버튼을 클릭하면 영화제목과 영화스케줄을 가져오는 스크립트 -->
	<script type="text/javascript">
	
	function dateBtnClick(dateVal){		
			$('#dateVal').val(dateVal); // 날짜를 저장하는 input에 클릭한 값 넣어주기 
			console.log()
			dateVal = dateVal + '';
		 	let yyyy = dateVal.substr(12,4);
            let mm = dateVal.substr(5,3);
            let dd = dateVal.substr(9,2);
            switch(mm){
            case "Jan" : mm = "01";
    		break;
    		case "Feb" : mm = "02";
    		break;
    		case "Mar" : mm = "03";
    		break;
    		case "Apr" : mm = "04";
    		break;
    		case "May" : mm = "05";
    		break;
    		case "Jun" : mm = "06";
    		break;
    		case "Jul" : mm = "07";
    		break;
    		case "Aug" : mm = "08";
    		break;
    		case "Sep" : mm = "09";
    		break;
    		case "Oct" : mm = "10";
    		break;
    		case "Nov" : mm = "11";
    		break;
    		case "Dec" : mm = "12";
    		break;		
            }           
          let strDate = yyyy + mm + dd;
            console.log("날짜 : " + strDate);
		
		// 해당 날짜의 영화 제목을 가져오는 ajax
		let movieUrl = '/booking/movies/' +strDate;
		
		$.getJSON(movieUrl,function(movieList){
			let list = '';			
			$(movieList).each(
					function(){					
					list += '<li><button type="button" id="movie-btn" onclick="movieBtnClick(this.value)"value=' +this.movieNo + '>'+
					'<span>' + '<img id="movie-age-' + this.movieAge + '"  alt="" src="">' + '</span>' +
	  	    		'<span>' + this.movieTitle + '</span>' +
	  	    		'</button></li>'					
				}); // end each()
			 $('.movie-list').html(list);
			 getAgePoster();
			} // end callback()
		); // end getJSON
		
		
		// 해당 날짜의 영화 상영일정을 가져오는 ajax
		let scheduleUrl = '/booking/schedules/' + strDate;
		
		$.getJSON(scheduleUrl,function(scheduleList){		
			list = '';			
			$(scheduleList).each(
					function(){					
						list += '<li><button id="schedule-btn" onclick="scheduleBtnClick(this.value)" value=' +this.scheduleNo + '>'+
		  	    		'<span>' + this.scheduleTime+ "  " + '</span>' +
		  	    		'<span>' + this.movieTitle + "  " + '</span>' +
		  	    		'<span>' + this.theaterName + "  " + '</span>' +
		  	    		'<span>' + this.seatCount + "/" + this.theaterSeat + '</span>' +
		  	    		'</button></li>'				
				}); // end each()
			 $('.schedule-list').html(list);
			
			} // end callback()
		); // end getJSON		
			$(".poster").attr("src", "/resources/img/poster_area1.png");
			$(".poster").attr("alt", "poster_area");
	} // end dateBtnClick()
	

	</script>	

	<!-- 영화버튼을 클릭하면 해당영화스케줄을 가져오는 스크립트 -->
	<script type="text/javascript">
	
	function movieBtnClick(movieNo){		
		let dateVal = $('#dateVal').val(); // 날짜 값
		console.log("영화번호 : " + movieNo);
		
		let yyyy = dateVal.substr(12,4);
        let mm = dateVal.substr(5,3);
        let dd = dateVal.substr(9,2);
        switch(mm){
        case "Jan" : mm = "01";
		break;
		case "Feb" : mm = "02";
		break;
		case "Mar" : mm = "03";
		break;
		case "Apr" : mm = "04";
		break;
		case "May" : mm = "05";
		break;
		case "Jun" : mm = "06";
		break;
		case "Jul" : mm = "07";
		break;
		case "Aug" : mm = "08";
		break;
		case "Sep" : mm = "09";
		break;
		case "Oct" : mm = "10";
		break;
		case "Nov" : mm = "11";
		break;
		case "Dec" : mm = "12";
		break;		
        }           
      let strDate = yyyy + mm + dd;
        console.log("날짜 : " + strDate);       
        
     // 해당 날짜, 선택영화의 상영일정을 가져오는 ajax
		let scheduleUrl = '/booking/schedules/' + strDate + '/' + movieNo;
		
		$.getJSON(scheduleUrl,function(scheduleList){
			let list = '';			
			$(scheduleList).each(
					function(){					
						list += '<li><button id="schedule-btn" onclick="scheduleBtnClick(this.value)" value=' + this.scheduleNo + '>'+
		  	    		'<span>' + this.scheduleTime+ "  " + '</span>' +
		  	    		'<span>' + this.movieTitle + "  " + '</span>' +
		  	    		'<span>' + this.theaterName + "  " + '</span>' +
		  	    		'<span>' + this.seatCount + "/" + this.theaterSeat + '</span>' +
		  	    		'</button></li>'
				}); // end each()
			 $('.schedule-list').html(list);
			} // end callback()
		); // end getJSON
        
		
		  let movieUrl = '/booking/moviePoster/' + movieNo;
			$.getJSON(movieUrl, function(movieVO){
					$(".poster").attr("src",movieVO.moviePoster)
				} // end callback()
			); // end getJSON()		
	
		
	} // end movieBtnClick() 
	</script>	
			
	<!-- datepicker -->
	<script type="text/javascript">
//datepicker
$(function() {
  $("#datepicker").datepicker({
    showOn : "button",
    buttonImage : "/resources/img/calender2.png",
    buttonImageOnly : false,
    buttonText : "Select date",
    minDate : 0,
    onSelect : function(dateText, inst) {
      let yyyy = dateText.substr(6, 4);
      let mm = dateText.substr(0, 2);
      let dd = dateText.substr(3, 2);
      const datePicker = new Date(yyyy, mm - 1, dd);
      btnDate = datePicker;
      console.log("btnDate : " + datePicker);
      getDate(datePicker);
      dateBtnClick(' ' + datePicker); // 날짜의 str 규칙을 맞춰주기
    } // end onSelect()
  }); // end datepicker
}); // end document
</script>			
	
	<!--  영화 연령 poster 삽입  -->
	<script type="text/javascript">
	getAgePoster();
	function getAgePoster(){
				 $("#movie-age-0").attr("src","https://img.megabox.co.kr/static/pc/images/common/txt/txt-age-small-all.png");
				 $("#movie-age-12").attr("src","https://img.megabox.co.kr/static/pc/images/common/txt/txt-age-small-12.png");
				 $("#movie-age-15").attr("src","https://img.megabox.co.kr/static/pc/images/common/txt/txt-age-small-15.png");
				 $("#movie-age-19").attr("src","https://img.megabox.co.kr/static/pc/images/common/txt/txt-age-small-19.png");
				 $("#movie-age-0").attr("alt",0);
				 $("#movie-age-12").attr("alt",12);
				 $("#movie-age-15").attr("alt",15);
				 $("#movie-age-19").attr("alt",19);
	}
		
	
	</script>
	
	<!-- 스케줄 클릭시 값 넘겨주기  -->
	<script type="text/javascript">	
			function scheduleBtnClick(scheduleNo){				
				const memberId = $('#member-id').val();
				
					console.log("상영번호" + scheduleNo);
					let action = "/booking/seat";
					let param = scheduleNo;
					sendPost(action, param);
				
				
				function sendPost(action, param) {
					console.log("action : " + action);
					console.log("param : " + param);
					const form = document.createElement('form');
					form.setAttribute('method', 'post');
					form.setAttribute('action', action);
					
					const hiddenField = document.createElement('input');

					hiddenField.setAttribute('type', 'hidden');
					hiddenField.setAttribute('name', 'scheduleNo');
					hiddenField.setAttribute('value', param);
					form.appendChild(hiddenField);			

					document.body.appendChild(form);
					form.submit();
				} // end sendPost()
				
			} // end scheduleBtnClick()		
	</script>
	
	
	
