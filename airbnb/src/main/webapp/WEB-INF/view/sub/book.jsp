<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
	<title>airbnb</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/css/main.css" />
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/css/detail.css" />
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
	<div class="w3-top header-z">
		<div class="w3-twothird">
			<div class="w3-col" style="width: 100px">
				<a href="${pageContext.request.contextPath}/home"
					class="w3-bar-item w3-button"> <img
					src="${pageContext.request.contextPath}/img/paper.png" width="50">
				</a>
			</div>
			<div class="w3-col s4 w3-left p-top-20">
				1. 확인    >    2. 결제
			</div>
		</div>
	</div>    
	
	<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
		
		<div>
			${rsvp.region} ${diffday}박 <img src="${pageContext.request.contextPath}/viewPhoto/${room.no}"" width="100" height="80">이미지
			집 전체 <span aria-hidden="true"> · </span> 침대 3개
			<hr>
			인원 1명
			2017년 10월 6일 -> 2017년 10월 7일
			<hr>
			₩325234 x 1박		₩325234
			총합계 (KRW)			₩409677
			
		</div>
	</div>
</body>
</html>
