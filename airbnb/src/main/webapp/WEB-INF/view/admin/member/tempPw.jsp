<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/admin/template/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/admin_member.js"></script>
<div class="w3-container" id="member" style="margin-top: 75px">
	<div>
		<h2>임시 비밀번호 발급</h2>
	</div>
	<div>
		<h3>이메일 주소 : ${member.email}</h3>
		<h3>사용자 명 : ${member.name}</h3>
		<div class="tempPw"></div>
		<button class="gen" onclick="tempPw(${member.no});">발급</button>
		<button onclick="history.back();">뒤로가기</button>
	</div>
</div>
<%@include file="/WEB-INF/view/admin/template/footer.jsp"%>