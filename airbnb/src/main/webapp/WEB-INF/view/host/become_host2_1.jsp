<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    
<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="row">
		<h3>숙소 설명 수정하기</h3>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host2_1">
		
		<div class="row host-row">
			요약 (500자)
		</div>
		<div class="row  host-row">
			<textarea class="area-80" rows="10" name="etc"></textarea>
		</div>
		
		
		<div class="row host-row">
			<h3>이름 지정</h3>
		</div>
		<input type="text" class="host-input"  name="name" placeholder="숙소 제목" required>
		
		<div class="empty"></div>
		<div class="w3-row host-row">
			<a href="javascript:history.back();" >뒤로</a>
			<span class="space">&nbsp;</span>
			<input type="submit" id="continue" class="w3-btn w3-round-large w3-green" value="완료" >
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	