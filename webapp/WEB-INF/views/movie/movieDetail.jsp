<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reply.css">
<link rel="shortcut icon" href="/resources/img/tiger.jpg">
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div>
	<div align="center">
		<h1>영화 상세정보 페이지</h1>
		<hr>
		<p>${movieDetail.movieTitle }</p>
		<p>${movieDetail.movieType }</p>
		<p>${movieDetail.movieAge }</p>
		<p>${movieDetail.movieContent }</p>
		<p>${movieDetail.movieDirector }</p>
		<fmt:formatDate value="${movieDetail.movieDate }" pattern="yyyy.MM.dd" var="regdate" />
		<p>${regdate }</p>
	</div>
	
	<div id ="reply-frame">	
		<div id ="reply-area" >
		<ul id="reply" style="list-style: none;"></ul>					
		</div>
			<div id="page-num">
				<ul id="pager"></ul>
			</div>
	</div>
</div>	
	
	
	<jsp:include page="../footer.jsp"></jsp:include>
	
	
	<script type="text/javascript">
		$(function(){
			const movieNo = 20113252;
			let page = 1;
			getReplies(movieNo);
			
			$("#pager li a").click(function() {
				// .pager 클래스의 하위 li 요소의 하위 a 요소를 찾아감
				event.preventDefault(); // a 태그의 기본 동작(페이지 이동)을 금지
				var targetPage = $(this).attr('href'); // a 태그 href 속성의 값을 저장
				getReplies(targetPage);
				console.log(targetPage);				
			}); // end click()			
			
			
			function getReplies(movieNo){
				const uri = "/reply/all/" + movieNo + "/" + page;
				$.getJSON(uri,
						function(jsonData){
					let replyContent = "";
					let pageNoContent = "";
					let date = "";
					
					console.log(jsonData);
					const pageMaker = jsonData[0].pageMaker;
					console.log(pageMaker);
					
					$(jsonData).each(function(){
						date = new Date(this.replyDate);
						console.log(this.replyNo);
						replyContent +=	'<li><div class="img-wrap"><img alt="유저" src="/resources/img/user.png"></div>';
						replyContent += '<div class ="info-wrap">';
						replyContent += '<div class = "top-info"><span class="member-id">' + this.memberId + '</span><span class="grade">' + this.replyGrade + '</span></div>';
						replyContent += '<div class = "review-info">' + this.replyContent + '</div>';
						replyContent += '<div class = "btm-info">'+ date_to_str(date); + '</div>	</div></li>';	  	  
					})// end each()
					
					if(pageMaker.hasPrev){
						pageNoContent += '<li><a href="' + (pageMaker.startPageNo - 1) + '">이전</a></li>';
					}
					for(let i = pageMaker.startPageNo; i<=pageMaker.endPageNo; i++){
						pageNoContent += '<li><a href="'+ i +'">'+ i +'</a></li>';
					}
					if(pageMaker.hasNext){
						pageNoContent += '<li><a href="' + (pageMaker.endPageNo - 1) + '">다음</a></li>';						
					}
					
					$('#reply').html(replyContent);
					$('#pager').html(pageNoContent);					  
				}); // end getJSON()				
			} // end getReplies()			
			
			// date형태를 yyyy.MM.dd로 변환
			function date_to_str(format) {
			    let year = format.getFullYear();
			    
			    let month = format.getMonth() + 1;
			    if(month<10) {
			    	month = '0' + month;
			    }			    
			    let date = format.getDate();
			    if(date<10) {
			    	date = '0' + date;
			    }			    
			    return year + "." + month + "." + date;
			} // end date_to_str()
			
			
			
			
		}); // end document()
	
	</script>