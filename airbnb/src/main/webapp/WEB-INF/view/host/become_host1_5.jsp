<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    
<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="row">
		<div class="w3-round w3-teal area-10 w3-center">1단계</div>
		<h3>게스트에게 회원님의 공간에 대해 설명해주세요.</h3>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host1_5">
	<div class="row host-label">
		<input type="checkbox" name="options" value="개인 거실" id="private-living-room">&nbsp;
		<label for="private-living-room">개인 거실</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="pool" value="수영장">&nbsp;
		<label for="pool">수영장</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="kitchen" value="부엌">&nbsp;
		<label for="kitchen">부엌</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="washer" value="빨래 - 세탁기">&nbsp;
		<label for="washer">빨래 - 세탁기</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="dryer" value="빨래 - 건조기">&nbsp;
		<label for="dryer">빨래 - 건조기</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="free_parking" value="주차">&nbsp;
		<lable for="free_parking">주차</lable>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="elevator" value="엘리베이터">&nbsp;
		<label for="elevator">엘리베이터</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="jacuzzi" value="자쿠지 욕조">&nbsp;
		<label for="jacuzzi">자쿠지 욕조</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="gym" value="헬스장">&nbsp;
		<label for="gym">헬스장</label>
	</div>
	<div class="empty"></div>
	<div class="w3-row host-row">
		<a href="javascript:history.back();" >뒤로</a>
		<span class="space">&nbsp;</span>
		<input type="submit" class="w3-btn w3-round-large w3-green" value="완료">
	</div>
	</form>
</div>	
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	