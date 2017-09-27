<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    
<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="host-row1 ">
		<h2>기본 요금</h2>
	</div>
	<div class="w3-row host-row">
		기본 요금은 회원님이 정한 기본 1박당 요금입니다.
	</div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host3_1">	
	<sec:csrfInput/>
	<div class="host-row1  host-row">
		<label>기본 요금</label>
		<span class="currency"></span>
		<input type="number" name="price" class="host-input1" required>
		<span class="currency1">/박</span>
	</div>
	<div class="host-row1 ">&nbsp;</div>
	<div class="w3-row host-row">
		체크인 가능 시간을 선택해 주세요.
	</div>
	<div class="host-row1  host-row">
		<select name="check_in" class="host-select area-25" >
			<option value="">시간을 선택해주세요</option>
			<c:forEach var="i" begin="8" end="24" step="1">
				<c:if test="${i==15}">
					<option value="${i}:00"  selected>${i} : 00</option>
				</c:if>
				<c:if test="${i!=15}">
					<option value="${i}:00" >${i} : 00</option>
				</c:if>	
			</c:forEach>
		</select>
	</div>
	
	<div class="empty"></div>
	
		<div class="w3-row host-row">
			<a href="${pageContext.request.contextPath}/host/become_host3"" >뒤로</a>
			<span class="space">&nbsp;</span>
			<input type="submit" id="continue" class="w3-btn w3-round-large w3-green" value="계속">
			<span class="space">&nbsp;</span>
			<input type="submit" id="save" class="w3-btn w3-round-large" value="저장 후 나가기">
		</div>
	</form>
</div>
<script>
$(document).ready(function(){
	$("#save").on("click", function(){
		document.getElementById('mode').value = 'save';
	});
});
</script>	
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	