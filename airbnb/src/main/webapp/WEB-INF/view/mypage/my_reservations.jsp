<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css"/>
<div class="w3-main w3-content w3-padding" style="max-width:100%;margin-top:100px">
	<div class="menu-wrap">
	    <ul class="w3-center">
	        <li>
	            <a href="${pageContext.request.contextPath}/sub/message">메시지</a>
	        </li>
	        <li class="hover">
	            <a href="${pageContext.request.contextPath}/mypage/rooms">숙소 목록</a>
	        </li>
	        <li>
	            <a href="${pageContext.request.contextPath}/mypage/setting">계정 관리</a>
	        </li>
	    </ul>
	</div>
	<div class="w3-row">
		<div class="w3-col s4 w3-white w3-center submenu_wrap">
			<ul>
				<li><a href="${pageContext.request.contextPath}/mypage/rooms">숙소 목록</a></li>
				<li class="hover"><a href="${pageContext.request.contextPath}/mypage/my_reservations">예약 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/host/become_host1">
						<button class="w3-btn w3-round-large w3-green">새로운 숙소 추가</button>
				</a></li>
			</ul>
		</div>
		<form id="rfrm" method="post">
	  	<div class="w3-col l6 m3 s4w3-white w3-center subcontent">
	  		<div class="subtab">
				예약현황
			</div>
			
	  	</div>
	  	</form>
	</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>