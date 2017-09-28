<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>airbnb 관리자</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<sec:csrfMetaTags/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/adminpage.css" />
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/admin_common.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<!-- menu -->
	<nav class="w3-sidebar w3-blue w3-collapse w3-top w3-large w3-padding"
		style="z-index: 3; width: 300px; font-weight: bold;" id="mySidebar">
		<div class="w3-container">
			<h3 class="w3-padding-64">
				<b>airbnb<br>관리자
				</b>
			</h3>
		</div>
		<div class="w3-bar-block" id="menulist">
			<a href="${pageContext.request.contextPath}/admin/member"
				onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">회원 관리</a>
			<a href="${pageContext.request.contextPath}/admin/reservations"
				onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">예약 현황</a>
			<a href="${pageContext.request.contextPath}/admin/sales"
				onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">매출 현황</a>
		</div>
	</nav>
	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">