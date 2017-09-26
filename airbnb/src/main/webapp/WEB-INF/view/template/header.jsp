<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>airbnb</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/main.css" />
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/review.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layer_popup.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/messageSend.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/list.css" />
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/cancel_rsv.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/function.js"></script>
<script src="${pageContext.request.contextPath}/js/layer_popup.js"></script>
<script src="${pageContext.request.contextPath}/js/wishList.js"></script> 

<!-- 리스트에 필요한것들  -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/list.css" />
<!-- 그래프 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/addSlider.css" />
<script src="${pageContext.request.contextPath}/js/list_menu2.js"></script>
<script src="${pageContext.request.contextPath}/js/Obj.min.js"></script>
<script src="${pageContext.request.contextPath}/js/addSlider.js"></script> 
</head>

<body>

	<!-- Sidebar (hidden by default) -->
	<nav 
		class="w3-display-right w3-sidebar w3-bar-block w3-card-2 w3-top w3-xlarge w3-animate-right"
		style="display: none; z-index: 2; width: 40%; min-width: 300px"
		id="mySidebar">
		<a href="host/become_host1" class="w3-bar-item w3-button">호스팅하기</a>
		<a href="mypage/rooms" class="w3-bar-item w3-button">마이페이지</a>
		<sec:authorize access="!isAuthenticated()">
			<a href="javaScript:void(0);" class="joinbtn w3-bar-item w3-button">회원가입</a>
			<a href="${pageContext.request.contextPath}/member/login"
				class="w3-bar-item w3-button">로그인</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a href="${pageContext.request.contextPath}/member/logout" class="w3-bar-item w3-button">로그아웃</a>
		</sec:authorize>
	</nav>

	<%@ include file="/WEB-INF/view/popup/layerpop.jsp"%>

	<!-- Navbar (sit on top) -->
	<div class="w3-top header-z" id="header">
		<div class="w3-bar w3-white w3-padding w3-card-2"
			style="letter-spacing: 4px;">
			<div class="w3-twothird">
				<div class="w3-col" style="width: 100px">
					<a href="${pageContext.request.contextPath}/home"
						class="w3-bar-item w3-button"> <img
						src="${pageContext.request.contextPath}/img/paper.png" width="50">
					</a>
				</div>
				<form id="mainSearchForm" method="post"
					action="${pageContext.request.contextPath}/sub/sub_list">
					<sec:csrfInput />
					<input type="hidden" id="from"> 
					<input type="hidden" id="to">
					<div class="w3-rest w3-border">
						<div class="w3-col s4 w3-left">
							<input class="w3-input border_bottom0 " type="text"
								placeholder="모든 위치" name="location" value="${param.location}">
						</div>
						<div class="w3-col s4 w3-left" id="changDate">
							<div class="w3-col s4 w3-left">
								<input class="w3-input width100 border_bottom0 " type="text"
									id="startDate" name="startDate" placeholder="체크인"
									style="text-align: right;" value="${param.startDate}">
							</div>
							<div class="w3-col s3 w3-left border_bottom0 "
								style="width: 20px; padding-top: 5px;">─</div>
							<div class="w3-col s4 w3-left">
								<input class="w3-input width100 border_bottom0 " type="text"
									id="endDate" name="endDate" placeholder="체크아웃"
									value="${param.endDate}">
							</div>

						</div>

						<div class="w3-col s4 w3-left" style="border: 0px;">
							<div class="w3-col s8 w3-left flex">
								<span class="currency">인원</span> 
								<input id="personInput"	name="amount" type="number" max="9999" maxlength="4"
									oninput="maxLengthCheck(this)" value="${param.amount}" /> 
								<span class="currency1">명</span>
							</div>
							<div class="w3-col s4 w3-center" style="padding-top: 3px;">
								<button class="w3-button w3-red w3-small">검색</button>
							</div>

						</div>
					</div>
				</form>
			</div>

			<!-- Right-sided navbar links. Hide them on small screens -->
			<div class="w3-right w3-hide-small" id="header_right">
				<a href="${pageContext.request.contextPath}/host/become_host1"
					class="w3-bar-item w3-button">호스팅하기</a> <a
					href="${pageContext.request.contextPath}/mypage/rooms"
					class="w3-bar-item w3-button">마이페이지</a>
				<sec:authorize access="isAuthenticated()">
					<a href="${pageContext.request.contextPath}/member/logout" class="w3-bar-item w3-button">로그아웃</a>
				</sec:authorize>
				<sec:authorize access="!isAuthenticated()">
					<a href="javaScript:void(0);" class="joinbtn w3-bar-item w3-button">회원가입</a>
					<a href="${pageContext.request.contextPath}/member/login"
						class="w3-bar-item w3-button">로그인</a>
				</sec:authorize>
			</div>
			<a href="javascript:void(0)"
				class="w3-bar-item w3-button w3-padding-24 w3-right" id="hambug"
				onclick="w3_open()"><i class="fa fa-bars"></i></a>
			<!-- Overlay effect when opening sidebar on small screens -->
			<div class="w3-overlay w3-hide-large" onclick="w3_close()"
				style="cursor: pointer" title="close side menu" id="myOverlay"></div>

			<br> <br> <br> <br> <br>
		</div>
	</div>