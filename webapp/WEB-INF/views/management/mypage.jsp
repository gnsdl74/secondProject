<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
<link rel="shortcut icon" href="/resources/img/tiger.jpg">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<c:if test="${empty memberId }">
		<script type='text/javascript'>
			alert('로그인 후 이용가능한 서비스입니다.');
			location.href="/main";
		</script>
	</c:if>
	
	<div class="mypage-container">
		<div class="sub-location">
			<div class="sub-location-inner">
				<i class="material-icons">&#xe88a;</i>
				<p>> 마이페이지</p>
			</div>
		</div>
		<div class="mypage-info">
			<div class="top">
				<!-- 세션에서 memberId 가져옴 -->
				<p>${memberId }님의<br>마이 페이지입니다.
				<p>
					<a href="/mypage/myinfo">개인정보수정 ></a>
			</div>
			<div class="bottom">
				<p>나의 한줄평</p>
				<ol>
					<li>1. 가장 최근 댓글입니다.</li>
					<li>2. 두번째로 최근 댓글입니다.</li>
					<li>3. 세번째로 최근 댓글입니다.</li>
					<li>4. 네번째로 최근 댓글입니다.</li>
					<li>5. 다섯번째로 최근 댓글입니다.</li>
					<li>6. 여섯번째로 최근 댓글입니다.</li>
				</ol>
			</div>
		</div>

		<div class="division">
			<div class="myticket ticket-pay">
				<p class="mypage-title">나의 예매정보</p>
				<div class="ticket-info">
					<p>예매 내역이 없습니다.</p>
				</div>
			</div>
			<div class="mypay ticket-pay">
				<p class="mypage-title">나의 결제정보</p>
				<div class="pay-info">
					<p>결제 내역이 없습니다.</p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>