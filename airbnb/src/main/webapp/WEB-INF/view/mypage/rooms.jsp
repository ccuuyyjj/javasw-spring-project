<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css"/>
<div class="w3-main w3-content w3-padding" style="max-width:100%;margin-top:100px">
	<div class="menu-wrap">
	    <ul class="w3-center">
	        <li>
	            <a href="${pageContext.request.contextPath}/mypage/message">메시지</a>
	        </li>
	        <li class="hover">
	            <a href="${pageContext.request.contextPath}/mypage/rooms">숙소 목록</a>
	        </li>
	        <li>
	            <a href="#">계정 관리</a>
	        </li>
	    </ul>
	</div>
	<div class="submenu_wrap area-40 w3-center">
		<ul>
			<li>숙소 목록</li>
			<li>예약 관리</li>
		</ul>
	</div>
</div>