<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    
<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="row">
		<div class="w3-round w3-teal area-10 w3-center">1단계</div>
		<h3>숙소에 얼마나 많은 인원이 숙박할 수 있나요?</h3>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host1_1">
	<div class="row host-label">
		최대 숙박 인원
	</div>
	<div  class="row">
		<span class="currency">인원</span>
        <input class="inputNum host-input1 area-10" type="number" name="capacity"  value="1" maxlength="4" oninput="maxLengthCheck(this)" >	
		<span class="currency1">명</span>
	</div>
	<div class="row host-label">
		게스트가 사용할 수 있는 침실은 몇 개인가요?
	</div>
	<div  class="row">
		<select class="host-select area-25" name="bedrooms" >
			<c:forEach var="i" begin="0" end="50" step="1">
				<option value="${i}">침실 ${i}개</option>
			</c:forEach>	
		</select>
		
	</div>
	<div class="row host-label">
		게스트가 사용할 수 있는 침대는 몇 개인가요
	</div>
	<div  class="row">
		<span class="currency">침대</span>
        <input class="inputNum host-input1 area-10" type="number" name="beds"  value="1" maxlength="4" oninput="maxLengthCheck(this)" >	
		<span class="currency1">개</span>
	</div>
	<div class="row host-label">
		침대 유형
	</div>
	<div  class="row">
		<select class="host-select area-25" name="bed_type" >
			<option value="">하나를 선택해주세요</option>
			<option>싱글</option>
			<option>더블</option>
			<option>매트리스(요와 이불)</option>
			<option>소파</option>
			<option>소파베드</option>
			<option>기타</option>
		</select>
	</div>
	<div class="empty"></div>
	
	<div class="w3-row host-row">
		<a href="javascript:history.back();" >뒤로</a>
		<span class="space">&nbsp;</span>
		<input type="submit" class="w3-btn w3-round-large w3-green" value="계속">
	</div>
	</form>
</div>	
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	
