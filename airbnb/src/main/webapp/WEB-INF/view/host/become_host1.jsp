<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp" %>

<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div>
		<h2>${member.name}님 안녕하세요!<br>회원님의 숙소 등록을 도와드리겠습니다</h2>
	</div>	
	
	<div class="host-row1">
		<div class="w3-round w3-teal area-10 w3-center">1단계</div>
		<h3>회원님의 숙소 유형은 무엇인가요?</h3>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host1">
	<sec:csrfInput/>
	<div class="host-row host-label">
		숙소의 건물 유형을 알려주세요.
	</div>
	<div  class="host-row1">
		<select class="host-select area-25" name="house_type" required >
			<option value="">하나를 선택해주세요.</option>
			<option>아파트</option>
			<option>아파트(콘도미니엄)</option>
			<option>게스트하우스</option>
			<option>단독주택</option>
			<option>별채</option>
			<option>게스트 스위트</option>
			<option>타운하우스</option>
			<option>휴가용 별장</option>
			<option value="-1" disabled="" data-reactid="90">──────────────</option>
			<option>배</option>
			<option>방갈로</option>
			<option>통나무집</option>
			<option>기숙사</option>
			<option>흙집</option>
			<option>오두막</option>
			<option>이글루</option>
			<option>캠핑카</option>
			<option>텐트</option>
			<option>기타</option>
		</select>
	</div>
	<div class="host-row1 host-label">
		게스트가 묵을 방 유형
	</div>
	<div  class="host-row1">
		<select class="host-select area-25" name="room_type" >
			<option>집 전체</option>
			<option>개인실</option>
			<option>다인실</option>
		</select>
	</div>
	
	<div class="w3-row host-row">
		<input class="host-input" type="text" name="region" placeholder="대한민국 서울특별시" required>
	</div>
	
	<div class="empty"></div>
	
	<div class="w3-row host-row w3-center">
		<input type="submit" class="w3-btn w3-round-large w3-green" value="계속">
	</div>
	</form>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	