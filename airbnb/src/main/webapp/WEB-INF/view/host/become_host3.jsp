<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    
<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="row">
		<h2>에어비앤비의 게스트 필수 요건을 검토합니다.</h2>
	</div>
	<div class="w3-row host-row">
		모든 에어비앤비 게스트는 예약 전 다음 정보를 제공해야 합니다.
	</div>
	<div class="row host-row">
		<img src="${pageContext.request.contextPath}/img/check-icon.png" width="20" >
		프로필 사진
	</div>
	<div class="row host-row">
		<img src="${pageContext.request.contextPath}/img/check-icon.png" width="20" >
		인증된 이메일
	</div>
	<div class="row host-row">
		<img src="${pageContext.request.contextPath}/img/check-icon.png" width="20" >
		전화번호 인증
	</div>
	<div class="row host-row">
		<img src="${pageContext.request.contextPath}/img/check-icon.png" width="20" >
		결제 정보
	</div>
	<hr>
	<div class="w3-row host-row">
		게스트는 예약 전 다음 사항을 이행해야 합니다.
	</div>
	<div class="row host-row">
		<img src="${pageContext.request.contextPath}/img/check-icon.png" width="20" >
		숙소 이용규칙에 동의합니다.
	</div>
	<div class="row host-row">
		<img src="${pageContext.request.contextPath}/img/check-icon.png" width="20" >
		여행에 관해 메시지 보내기
	</div>
	<div class="row host-row">
		<img src="${pageContext.request.contextPath}/img/check-icon.png" width="20" >
		게스트가 몇 명인지 알리기
	</div>
	<div class="row host-row">
		<img src="${pageContext.request.contextPath}/img/check-icon.png" width="20" >
		게스트가 2일 이내에 도착할 예정이라면 체크인 시간을 확정하세요.
	</div>
	<div class="empty"></div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host3">	
		<div class="w3-row host-row">
			<a href="javascript:history.back();" >뒤로</a>
			<span class="space">&nbsp;</span>
			<input type="submit" id="continue" class="w3-btn w3-round-large w3-green" value="계속">
		</div>
	</form>
</div>		
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	