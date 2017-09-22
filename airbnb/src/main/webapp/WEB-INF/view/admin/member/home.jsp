<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Member</title>
	<style>
		.m_head, .m_row {
			border: 1px solid black;
			border-right-style: none;
			width: fit-content;
		}
		.m_row {
			border-top-style: none;
		}
		.m_head > div {
			text-align: center;
		}
		.m_head > div, .m_row > div {
			display: inline-block;
			margin: 0;
			border-right: 1px solid black;
			padding: 2px;
		}
		.m_no { width:40px; text-align: center;}
		.m_email { width:200px; }
		.m_name { width:150px; }
		.m_phone { width:150px; }
		.m_authority { width:150px; }
		.m_reg { width:200px; text-align: center;}
		.m_pwreset { width:150px; text-align: center;}
	</style>
</head>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".m_row").on("click", function(e) {
			toggleEdit(e.target);
		});
		
		function toggleEdit(target){
			if($(target).children()){
				var edit = $("<input>");
				edit.attr("type", "text");
				edit.attr("id", target.className.substring(2));
				edit.val($(target).text());
				$(target).empty();
				$(target).append(edit);
			} else {
				
			}
		}
	});
</script>
<body>
	<div>
		<div><h2>회원 목록</h2></div>
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
</body>
</html>