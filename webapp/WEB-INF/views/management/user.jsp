<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/user.css">
<link rel="shortcut icon" href="/resources/img/tiger.jpg">
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="sub-location">
			<div class="sub-location-inner">
				<i class="material-icons">&#xe88a;</i>
				<p>> 마이페이지 > 회원정보 > 개인정보 수정</p>
			</div>
		</div>
		<!-- user-infobox -->
		<div class="user-infobox">
			<p id="infobox-title">개인정보 수정</p>
			<p id="infobox-subtitle">
				<span>기본정보</span>&nbsp;·&nbsp;회원님의 정보를 정확히 입력해주세요.<span id="right"><em class="font-orange">*</em>&nbsp;필수</span>
			</p>
			<form id="frmUpdate" method="post">
				<input type="hidden" name="memberId" value="${userInfo.memberId }">
				<input type="hidden" name="memberName" value="${userInfo.memberName }">
				<fmt:formatDate value="${userInfo.memberBirth }" pattern="yyyy년 MM월 dd일" var="regdate" />
				<input type="hidden" name="memberBirth" value="${regdate }">
				<input type="hidden" id="existPhone" name="memberPhone" value="${userInfo.memberPhone }">
				<input type="hidden" name="memberEmail" value="${userInfo.memberEmail }" >
				<input type="hidden" name="memberPw" value="${userInfo.memberPw }">
			<!-- user-info -->
			<div class="user-info">
				<table>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>${userInfo.memberId }<a id="leave" href="/mypage/goodbye">회원 탈퇴</a></td>
						</tr>
						<tr>
							<th>이름 <em class="font-orange">*</em></th>
							<td>${userInfo.memberName }&nbsp;<a href="#">이름 변경</a>&nbsp;<span id="nameInfo">※ 개명으로 이름이 변경된 경우, 회원정보의 이름을 변경하실 수 있습니다.</span></td>
						</tr>
						<tr>
							<th>생년월일 <em class="font-orange">*</em></th>
							<td>${regdate }</td>
						</tr>
						<tr>
							<th>휴대폰 <em class="font-orange">*</em></th>
							<td>
								<p id="formatPhone"></p>
								<div class="phone-update"><a>휴대폰번호 변경</a></div>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input id="emailInfo" type="text" value="${userInfo.memberEmail }"></td>
						</tr>
						<tr>
							<th>비밀번호 <em class="font-orange">*</em></th>
							<td><a href="/mypage/userPwdChangePage">비밀번호 변경</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- // user-info -->
			</form>
			<!-- info-submit -->
			<div class="info-submit">
				<!-- 취소하면 mypage로 -->
				<button type="button" id="cancel">취소</button>
				<!-- 등록하면 회원정보 수정 -->
				<button type="button" id="update">등록</button>
			</div>
			<!-- // info-submit -->
		</div>
		<!-- // user-infobox -->
	</div>
	<!-- // container -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var phone = $("#existPhone").val();
			console.log(phone);
			// 휴대폰 번호에 '-'을 붙여서 화면 출력
			phoneFormat(phone);
			
			$("#cancel").click(function() {
				location.href="/mypage";
			}); //end cancel click()
			
			// '-'붙인 휴대폰 번호 출력
			function phoneFormat(num) {
				console.log(num);
				var regPhone = num.replace(/([0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
				$("#formatPhone").text(regPhone);
			} // end phoneFormat()
		}); //end document
	
	</script>