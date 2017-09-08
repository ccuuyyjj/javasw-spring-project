<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    
<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="row">
		<div class="w3-round w3-teal area-10 w3-center">1단계</div>
		<h3>어떤 편의시설을 제공하시나요?</h3>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host1_4">
	<input type="hidden" id="mode" name="mode" >
	<div class="row host-label">
		<input type="checkbox" name="options" value="필수 품목<br>수건, 침대시트, 비누, 화장지" id="essentials">&nbsp;
		<label for="essentials">필수 품목
		<br>
		 &nbsp;&nbsp;&nbsp;&nbsp;수건, 침대시트, 비누, 화장지
		 </label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="wireless_internet" value="무선인터넷">&nbsp;
		<label for="wireless_internet">무선인터넷</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="shampoo" value="샴푸">&nbsp;
		<label for="shampoo">샴푸</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="hangers" value="옷장/서랍장">&nbsp;
		<label for="hangers">옷장/서랍장</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="tv" value="TV">&nbsp;
		<label for="tv">TV</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="heating" value="난방">&nbsp;
		<label for="heating">난방</lable>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="ac" value="에어컨">&nbsp;
		<label for="ac">에어컨</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="breakfast" value="조식, 커피, 차">&nbsp;
		<label for="breakfast">조식, 커피, 차</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="laptop-friendly" value="책상/작업공간">&nbsp;
		<label for="laptop-friendly">책상/작업공간</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" id="fireplace" name="options"  value="벽난로">&nbsp;
		<label for="fireplace">벽난로</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="iron" value="다리미">&nbsp;
		<label for="iron">다리미</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" id="hair-dryer" value="헤어드라이어">&nbsp;
		<label for="hair-dryer">헤어드라이어</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" id="allows_pets" name="options" value="집에서 키우는 반려동물">&nbsp;
		<label for="allows_pets">집에서 키우는 반려동물</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" id="private-entrance" name="options" value="게스트 전용 출입문">&nbsp;
		<label for="private-entrance">게스트 전용 출입문</label>
	</div>
	<div class="empty"></div>
	
	<div class="row">
		<h4>안전 시설</h4>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" value="연기 감지기" id="smoke_detector">&nbsp;
		<label for="smoke_detector">연기 감지기
		<br>&nbsp;&nbsp;&nbsp;&nbsp;
		 잘 작동하는 연기 감지기를 모든 방에 구비해야 하는지 현지 법규를 확인해보세요.
		 </label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" value="일산화탄소 감지기" id="carbon_monoxide_detector">&nbsp;
		<label for="carbon_monoxide_detector">일산화탄소 감지기
		<br>&nbsp;&nbsp;&nbsp;&nbsp;
		 일산화탄소 감지기 구비 요건에 대해 현지 법규를 확인해보세요. 
		 <br>&nbsp;&nbsp;&nbsp;&nbsp;
		 지역에 따라 정상적으로 작동하는 일산화탄소 감지기를 모든 방에 설치해야 할 수 있습니다.
		 </label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" value="구급상자" id="first_aid_kit">&nbsp;
		<label for="first_aid_kit">구급상자</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" value="안전 카드" id="safety_card">&nbsp;
		<label for="safety_card">안전 카드
			<br>&nbsp;&nbsp;&nbsp;&nbsp;
			긴급 상황 시에 사용할 수 있는 정보를 적은 카드
		</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" value="소화기" id="fire_extinguisher">&nbsp;
		<label for="fire_extinguisher">소화기</label>
	</div>
	<div class="row host-label">
		<input type="checkbox" name="options" value="침실문 잠금장치" id="lock_on_bedroom_door">&nbsp;
		<label for="lock_on_bedroom_door">침실문 잠금장치
			<br>&nbsp;&nbsp;&nbsp;&nbsp;
			개인실은 안전과 사생활 보호를 위해 방문을 잠글 수 있습니다
		</label>	
	</div>
	<div class="empty"></div>
	<div class="w3-row host-row">
		<a href="javascript:history.back();" >뒤로</a>
		<span class="space">&nbsp;</span>
		<input type="submit" class="w3-btn w3-round-large w3-green" value="계속">
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