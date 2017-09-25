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
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif
}

body {
	font-size: 16px;
}

.w3-half img {
	margin-bottom: -6px;
	margin-top: 16px;
	opacity: 0.8;
	cursor: pointer
}

.w3-half img:hover {
	opacity: 1
}

.m_head, .m_row {
	border: 1px solid black;
	border-right-style: none;
	width: fit-content;
}

.m_row {
	border-top-style: none;
}

.m_head>div {
	text-align: center;
}

.m_head>div, .m_row>div {
	display: inline-block;
	margin: 0;
	border-right: 1px solid black;
	padding: 2px;
}

.m_no {
	width: 40px;
	text-align: center;
}

.m_email {
	width: 200px;
}

.m_name {
	width: 150px;
}

.m_phone {
	width: 150px;
}

.m_authority {
	width: 150px;
}

.m_reg {
	width: 200px;
	text-align: center;
}

.m_pwreset {
	width: 150px;
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function toggleEdit(target) {
		console.log(target.tagName);
		console.log(target.className);
		if (target.tagName == "BUTTON") {
			//var value = $(target).val();
			//$(target).parent().text(value);
		} else if ($(target).find("input[type=text]").length != 0) {
			var value = $(target).find("input[type=text]").val();
			$(target).text(value);
		} else if(target.className == "m_name" ||
				target.className == "m_phone" ||
				target.className == "m_authority" ){
			var edit = $("<input>");
			edit.attr("type", "text");
			edit.attr("id", target.className.substring(2));
			edit.css("width", (parseInt($(target).css("width")) - 58));
			edit.val($(target).text());
			$(target).empty();
			$(target).append(edit);
			var submit = $("<button>");
			submit.attr("onclick", "modify(this);");
			submit.text("저장");
			$(target).append(submit);
		}
	}
	function modify(target) {
		var id = $(target).parent().parent().find(".m_no").text();
		var type = $(target).parent().find("input[type=text]").attr("id");
		var value = $(target).parent().find("input[type=text]").val();
		var data = "no=" + id + "&" + type + "=" + value;
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/member/modify",
			type : "post",
			data : data,
			success : function(res) {
				if(res == "true") $(target).parent().text(value);
				else $(target).parent().find("input[type=text]").css("border-color", "red");
			}
		});
	}
	$(document).ready(function() {
		$(".m_row").on("click", function(e) {
			toggleEdit(e.target);
		});
	});
</script>
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
			<div>
				<h2>회원 목록</h2>
			</div>
			<div class="m_head">
				<div class="m_no">번호</div>
				<div class="m_email">이메일</div>
				<div class="m_name">이름</div>
				<div class="m_phone">전화번호</div>
				<div class="m_authority">권한</div>
				<div class="m_reg">가입 시간</div>
				<div class="m_pwreset">임시 비밀번호 발급</div>
			</div>
			<c:forEach var="member" items="${memberList}">
				<div class="m_row">
					<div class="m_no">${member.no}</div>
					<div class="m_email">${member.email}</div>
					<div class="m_name">${member.name}</div>
					<div class="m_phone">${member.phone}</div>
					<div class="m_authority">${member.authority}</div>
					<div class="m_reg">${member.reg}</div>
					<div class="m_pwreset">실행</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>