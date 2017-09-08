<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
	<div class="empty"></div>
	<div class="row">
		<div class="w3-round w3-teal area-10 w3-center">1단계</div>
		<h3>주소 지도 표시</h3>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host4">
	<div class="empty"></div>
	
	<div class="w3-row host-row">
		<input type="submit" class="w3-btn w3-round-large w3-green" value="계속">
	</div>
	</form>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	