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
				<b>1. 확인</b>
			</div>
		</div>
	</div>    
	
	<div class="w3-main w3-content w3-padding w3-center" style="max-width:800px;margin-top:100px">
		<div class="w3-center">
			<h1>예약 확인</h1>
		</div>
		<div class="empty"></div>
		<div class="w3-center">
			<table class="book-table area-80 b-border" align="center">
			<tbody>
				<tr>
					<td>${room.region} ${cart.diffdays}박</td>
					<td rowspan="2" class="b-border">
						<img src="${pageContext.request.contextPath}/viewPhoto/${room.no}" alt="${room.name}" width="100" height="80">
					</td>
				</tr>
				<tr>
					<td class="b-border">${room.type} <span aria-hidden="true"> · </span> 침대 ${room.beds}개</td>
				</tr>
				<tr>
					<td colspan="2">인원 ${cart.quantity}명</td>
				</tr>
				<tr>	
					<td colspan="2" class="b-border">${cart.getSdate()} -> ${cart.getEdate()}</td>
				</tr>
				<tr>
					<td class="b-border">\ <fmt:formatNumber value="${room.price}" pattern="#,###" /> x ${cart.diffdays}박</td>
					<td class="b-border">\ <fmt:formatNumber value="${total_price}" pattern="#,###" /></td>
				</tr>
				<tr>
					<td><b>총합계</b></td>
					<td><b>\ <fmt:formatNumber value="${total_price}" pattern="#,###" /></b></td>
				</tr>
			</tbody>
			</table>
		</div>
		<div class="empty"></div>
		<div class="empty"></div>
		<form method="post" action="${pageContext.request.contextPath}/sub/book">
			<sec:csrfInput/>
			<input type="hidden" name="c_no" value="${cart.no}">
			<div>
				<input type="submit" id="continue" value="계속" class="w3-btn w3-round-large w3-green" >
			</div>
		</form>
	</div>
</body>
</html>
