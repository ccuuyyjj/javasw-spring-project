<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    
<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="row">
		<h2>마지막 단계!</h2>
	</div>
	<div class="w3-row host-row">
			가격과 호스팅 달력을 설정하겠습니다.
	</div>
	<div class="row host-label">
		침대, 욕실, 편의시설 등 &nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/host/become_host1" class="host-a w3-green w3-button w3-round">변경</a>
		
		&nbsp;&nbsp;&nbsp; |  &nbsp;&nbsp;&nbsp;
		사진, 간단한 설명, 제목 &nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/host/become_host2" class="host-a w3-green w3-button w3-round">변경</a>
		
		<c:if test="${photourl eq null}">
			<a href="${pageContext.request.contextPath}/host/become_host2" class="host-a w3-gray w3-button w3-round">
				사진 업로드
			</a>
		</c:if>
	</div>
	
	<hr>
	<div class="row host-label"">
		<div class="w3-round w3-teal area-10 w3-center">3단계</div>
		<h3>게스트를 맞이할 준비를 하세요</h3>
		<small>예약 설정, 달력, 요금</small>
	</div>
	
	<div class="empty"></div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host2_2">
		<div class="w3-row host-row">
			<a href="javascript:history.back();" >뒤로</a>
			<span class="space">&nbsp;</span>
			<input type="submit" id="continue" class="w3-btn w3-round-large w3-green" value="완료" >
		</div>
		
	</form>
</div>	

	
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	