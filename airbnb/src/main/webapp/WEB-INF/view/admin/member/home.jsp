<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>airbnb 관리자</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/adminpage.css" />
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/admin_member.js"></script>
</head>
<body>
	<!-- menu -->
	<nav class="w3-sidebar w3-blue w3-collapse w3-top w3-large w3-padding"
		style="z-index: 3; width: 300px; font-weight: bold;" id="mySidebar">
		<br> <a href="javascript:void(0)" onclick="w3_close()"
			class="w3-button w3-hide-large w3-display-topleft"
			style="width: 100%; font-size: 22px">Close Menu</a>
		<div class="w3-container">
			<h3 class="w3-padding-64">
				<b>aibnb<br>관리자
				</b>
			</h3>
		</div>
		<div class="w3-bar-block">
			<a href="${pageContext.request.contextPath}/admin/member"
				onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white w3-gray">회원관리</a> <a
				href="${pageContext.request.contextPath}/admin/reservations"
				onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">예약현황</a>
			<a href="${pageContext.request.contextPath}/admin/sales"
				onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">매출현황</a>
		</div>
	</nav>
	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
		<div class="w3-container" id="member" style="margin-top: 75px">
			<div class="m_table">
				<div class="m_caption">
					<h2>회원 목록</h2>
				</div>
				<div class="m_head">
					<div class="m_row">
						<div class="m_no">번호</div>
						<div class="m_email">이메일</div>
						<div class="m_name">이름</div>
						<div class="m_phone">전화번호</div>
						<div class="m_authority">권한</div>
						<div class="m_reg">가입 시간</div>
						<div class="m_pwreset">임시 비밀번호<br>발급</div>
					</div>
				</div>
				<div class="m_body">
				<c:forEach var="member" items="${memberList}">
					<div class="m_row">
						<div class="m_no">${member.no}</div>
						<div class="m_email">${member.email}</div>
						<div class="m_name">${member.name}</div>
						<div class="m_phone">${member.phone}</div>
						<div class="m_authority">${member.authority}</div>
						<div class="m_reg">${member.reg}</div>
						<div class="m_pwreset">
							<a href="#"
								onclick="location.href='${pageContext.request.contextPath}/admin/member/tempPw?no=${member.no}';">실행</a>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>