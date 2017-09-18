<!DOCTYPE html>
<!-- test -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<title>airbnb</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/layer_popup.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/datepicker.js"></script>
<script src="js/function.js"></script>
<script src="js/layer_popup.js"></script>

<body>

	<!-- Sidebar (hidden by default) -->
	<nav
		class="w3-display-right w3-sidebar w3-bar-block w3-card-2 w3-top w3-xlarge w3-animate-right"
		style="display: none; z-index: 2; width: 40%; min-width: 300px"
		id="mySidebar">
		<a href="javascript:void(0)" onclick="w3_close()"
			class="w3-bar-item w3-button">Close Menu</a> <a
			href="host/become_host1" onclick="w3_close()"
			class="w3-bar-item w3-button">호스팅하기</a> <a href="sub/message"
			onclick="w3_close()" class="w3-bar-item w3-button">메세지</a> <a
			href="mypage/rooms" onclick="w3_close()"
			class="w3-bar-item w3-button">마이페이지</a> <a href="javaScript:void(0);"
			onclick="w3_close()" class="joinbtn w3-bar-item w3-button">회원가입</a> <a
			href="javaScript:void(0);" onclick="w3_close()"
			class="loginbtn w3-bar-item w3-button">로그인</a> <a
			href="javaScript:void(0);" onclick="w3_close()"
			class="loginbtn w3-bar-item w3-button">로그아웃</a>
	</nav>

	<%@ include file="/WEB-INF/view/popup/layerpop.jsp"%>

	<!-- Top menu -->
	<div class="w3-top">
		<div class="w3-white w3-xlarge"
			style="max-width: 1200px; margin: auto">
			<div class="w3-right w3-padding-16" id="header_right">
				<a href="host/become_host1" class="w3-bar-item w3-button">호스팅하기</a>
				<a href="sub/message" class="w3-bar-item w3-button">메세지</a> <a
					href="mypage/rooms" class="w3-bar-item w3-button">마이페이지</a>
				<sec:authorize access="!isAuthenticated()">
					<a href="javaScript:void(0);" class="joinbtn w3-bar-item w3-button">회원가입</a>
					<a href="javaScript:void(0);"
						class="loginbtn w3-bar-item w3-button">로그인</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<a href="javaScript:void(0);"
						class="loginbtn w3-bar-item w3-button">로그아웃</a>
				</sec:authorize>
			</div>
			<a href="javascript:void(0)"
				class="w3-bar-item w3-button w3-padding-24 w3-right" id="hambug"
				onclick="w3_open()"><i class="fa fa-bars"></i></a>
			<!-- Overlay effect when opening sidebar on small screens -->
			<div class="w3-overlay w3-hide-large" onclick="w3_close()"
				style="cursor: pointer" title="close side menu" id="myOverlay"></div>

			<div class="w3-center w3-padding-16">
				<img src="img/paper.png" width="50"> airbnb
			</div>
		</div>
	</div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main w3-content w3-padding"
		style="max-width: 1200px; margin-top: 100px">
		<div class="empty"></div>
		<div class="empty"></div>
		<form method="post"
			action="${pageContext.request.contextPath}/sub/sub_list">
			<sec:csrfInput/>
			<input type="hidden" id="from"> <input type="hidden" id="to">
			<div class="w3-row w3-border">
				<div class="w3-col s4 w3-left">
					<p>
						<label style="padding-left: 8px;">위치</label> <input
							class="w3-input border_bottom0 area-80" type="text"
							placeholder="모든 위치" name="location">
					</p>
				</div>
				<!--div class="w3-col s4 w3-left" id="dateWrap" style="border-left:1px solid #ccc!important;border-right:1px solid #ccc!important">
                <p>
                    <label style="padding-left:8px;">날짜</label>
                    <input class="w3-input date-input border_bottom0" type="button" id="checkDate" value="모든 날짜">
                </p>
            </div-->
				<div class="w3-col s4 w3-left" id="changDate">
					<div class="w3-col s4 w3-left">
						<p>
							<label style="padding-left: 8px;">날짜</label> <input
								class="w3-input date-input1 border_bottom0 area-100" type="text"
								id="startDate" name="startDate" placeholder="체크인"
								style="text-align: right">
						</p>
					</div>
					<div class="w3-col s4 w3-left" style="width: 20px;">
						<p>
							<label>&nbsp;</label>
						</p>

					</div>
					<div class="w3-col s4 w3-left">
						<p>
							<label>&nbsp;</label> <input
								class="w3-input date-input1 border_bottom0 area-100" type="text"
								id="endDate" name="endDate" placeholder="체크아웃">
						</p>
					</div>
				</div>

				<div class="w3-col s4 w3-left">
					<div class="w3-col s9 w3-left">
						<p>
							<label style="padding-left: 8px;">인원</label>
						</p>
						<div class="flex1">
							<span class="currency">&nbsp;</span> 
							<input id="personInput" name="amount" type="number" max="9999" maxlength="4" value ="1"
								oninput="maxLengthCheck(this)" style="width: 150px;"> 
							<span class="currency1">명</span>
						</div>
					</div>
					<div class="w3-col s3 w3-right"
						style="padding-left: 20px; padding-top: 10px;">
						<p>
							<button class="w3-button w3-red w3-round-large">검색</button>
						</p>
					</div>
				</div>
			</div>
		</form>

		<div class="empty"></div>
		<div class="empty"></div>
		<div class="empty"></div>

	</div>

	<%@ include file="/WEB-INF/view/template/footer.jsp"%>


	<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>