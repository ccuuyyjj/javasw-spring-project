<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    
<div class="w3-main w3-content w3-padding w3-center" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="row">
		<h2>숙소 등록 준비가 완료되었습니다!</h2>
	</div>
	<div class="empty"></div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host3_3">	
		<div class="w3-row host-row">
			<a href="javascript:history.back();" >뒤로</a>
			<span class="space">&nbsp;</span>
			<input type="submit" id="continue" class="w3-btn w3-round-large w3-red" value="숙소 등록하기">
		</div>
	</form>
	<div class="empty"></div>
</div>	

<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	