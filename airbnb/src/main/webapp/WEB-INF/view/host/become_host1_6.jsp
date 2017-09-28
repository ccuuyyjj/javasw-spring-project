<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    


<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="host-row1">
		<h2>${member.name}님, 좋아요!</h2>
	</div>
	<div class="host-row1 host-label">
		이제 숙소를 등록할 수 있도록 몇 가지 세부정보를 추가하도록 하겠습니다.
	</div>
	<div class="host-row1 host-label">
		침대, 욕실, 편의시설 등 &nbsp;&nbsp;&nbsp;
		
		<c:choose>
			<c:when test="${urlNo eq 3}">
				<a href="${pageContext.request.contextPath}/host/become_host1_4" class="host-a w3-green w3-button w3-round">계속</a>
			</c:when>
			<c:otherwise>	
				<a href="${pageContext.request.contextPath}/host/become_host1" class="host-a w3-green w3-button w3-round">변경</a>
			</c:otherwise>	
		</c:choose>
		
	</div>
	<hr>
	<div class="host-row1 host-label"">
		<div class="w3-round w3-teal area-10 w3-center">2단계</div>
		<h3>상세 정보를 제공해 주세요</h3>
		<small>사진, 간단한 설명, 제목</small>
	</div>
	<div class="empty"></div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host1_6">
	<sec:csrfInput/>
	<input type="hidden" name="urlNo" value="${urlNo}">
	<div class="w3-row host-row">
		<c:choose>
			<c:when test="${urlNo eq 3}">
				<a href="${pageContext.request.contextPath}/host/become_host1_3" >뒤로</a>
			</c:when>
			<c:otherwise>	
				<a href="${pageContext.request.contextPath}/host/become_host1_5" >뒤로</a>
			</c:otherwise>	
		</c:choose>
		
		<span class="space">&nbsp;</span>
		<input type="submit" class="w3-btn w3-round-large w3-green" value="계속">
	</div>
	</form>
</div>	
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	