<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/detail.css"/>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script src="${pageContext.request.contextPath}/js/gmaps.js"></script>
<script src="${pageContext.request.contextPath}/js/wishList.js"></script>


<script>
 $(document).ready(function(){
	 
	//구글맵 생성
 	//var gmap = new GMaps({옵션});
 	var gmap = new GMaps({
         div:"#map"//어디에(출력장소),선택자
         ,lat:'${room.lat}'	//위도
         ,lng:'${room.lng}'	//경도                 
     });
 	 gmap.addMarker({
         lat:'${room.lat}'		//위도
         ,lng:'${room.lng}'	//경도                 
     });
	 
	 
	 var enabledays = new Array();
	 <c:forEach items="${availList}" var="avail">
	 enabledays.push( '${avail.getDate()}');
	 </c:forEach>	 
	 
	 
	 jQuery('#checkin').datepicker({
		dateFormat: 'yy/mm/dd',
		minDate: 0,
		constrainInput: false,
		beforeShowDay: enableAllTheseDays,
		onSelect: function (dateText, inst) {
			 checkdate();
	     }
	});	
	
	 jQuery('#checkout').datepicker({
		dateFormat: 'yy/mm/dd',
		constrainInput: false,
		minDate: 0,
		beforeShowDay: enableAllTheseDays,
		onSelect: function (dateText, inst) {
	         checkdate();
	      }
	});    		
	
	 function checkdate(){
		 if($("#checkin").val() === ""){
			jQuery('#checkout').datepicker('show');
			return;
		 }
		 if($("#checkout").val() === ""){
			 jQuery('#checkin').datepicker('show');
			 return;
		 }
		
		var date1 = new Date($("#checkin").val());
		var date2 = new Date($("#checkout").val());
		var timeDiff = Math.abs(date2.getTime() - date1.getTime());
		var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
		diffDays = (diffDays==0)?1:diffDays;
		var price = "${room.price}";
		console.log("diffDays:"+diffDays);
		console.log("price:"+"${room.price}");
		
		var total = diffDays * price;
		var txt = "\\"+numberWithCommas(price) +"×"+diffDays + "박";
		$("#divOption").show();
		$(".btnFixed").css("height", "550");
		$("#atm_content").html(txt);
		$("#atm").text("\\"+numberWithCommas(total));
		$("#total").text("\\"+numberWithCommas(total));
		$("#totalprice").val(total);	 
		$("#diffdays").val(diffDays);
	 }
	 
	
 });
 
</script>

 <div class="photo">
     <img src="${pageContext.request.contextPath}/viewPhoto/${room.no}" alt="${room.name}" width="100%" height="80%">
 </div>
 <div class="container_1" id="summary">
	<div class="container"  id="menu">
		<div class="menu">
			<a class="atag" href="#summary">개요</a>
            <a class="atag" href="#">후기</a>
			<a class="atag" href="#">호스트</a>
			<a class="atag" href="#">위치</a>
		</div>
	</div>
	<div>
		<div class="detailTitle">${room.name}</div>
	</div>
	<div>
		<a class="atag_1">${room.type}</a>
		<span aria-hidden="true"> · </span>
		<a class="atag_1">${room.region}</a>
		<span aria-hidden="true"> · </span>
		<a class="atag_1">후기 000개</a>
	</div>
	<div class="container_2">
		<span aria-hidden="true"> · </span>
		<div class="content">인원 ${room.capacity}명</div>
		<span aria-hidden="true"> · </span>
		<div class="content">침대 ${room.beds}개</div>
		<span aria-hidden="true"> · </span>
		<div class="content">침실 ${room.bedrooms}개</div>
	</div>
	<div class="content_1">숙소정보</div>
	<div class="content_4">
		${room.etc}
		<br><br><br>
	</div>
	<div class="container_3">
		<h1>${room.parsedOptions}</h1>
		<table class="reviewTable">
			<tr>
				<td class="content_2">시설</td>
				<td class="content_3">
					엘리베이터<br>
					반려동물 입실 가능<br>
					가족/어린이 숙박에 적합<br>
				</td>
			</tr>
			<tr>
					<td class="content_2">가격</td>
					<td class="content_3">
						추가 인원 요금 ₩23144 / 박 (2명 초과 시)<br>
						언제나 에어비앤비를 통해 대화를 나누세요.<br>
						안전한 결제를 위해 에어비앤비 웹사이트나 앱 외부에서 송금하거나 대화를 나누지 마세요.<br>
					</td>
			</tr>
			<tr>
				<td class="content_2">침대/침구</td>
					<td class="content_3">
						공용 공간<br>
						퀸 베드 1개, 에어 메트리스 1개<br>
					</td>
			</tr>
			<tr>
				<td class="content_2">숙소 이용규칙</td>
				<td class="content_3">
					흡연 금지<br>
					반려동물 동반에 적합하지 않음<br>
					파티나 이벤트 금지<br>
					어린이(만 2-12세)에게 안전하거나 적합하지 않음<br>
					체크인 가능 시간은 15:00 - 20:00입니다<br>
					12:00까지 체크아웃하세요<br>
				</td>
			</tr>
			<tr>
			    <td class="content_2">환불정책</td>
			    <td class="content_3">
			        이 호스트는 엄격 환불 정책을 시행합니다<br>
			        체크인 30일 전까지 예약을 취소하면 전액 환불받을 수 있습니다.<br>
			        30일이 남지 않은 시점에서 취소하면 1박 요금의 50%와 수수료 전액을 환불받을 수 있습니다<br>
			    </td>
			</tr>
			<tr>
			    <td class="content_2">안전기능</td>
			    <td class="content_3">
			        화재 감지기<br>
			        구급 상자<br>
			        안전 카드<br>
			        소화기<br>
			    </td>
			</tr>
		</table>
	</div>
	
	
	<!-- fixed 예약(S) -->
	<div class="btnFixed" id="btnFixed">
   	<div class="w3-row content_1 booking-title w3-center">
   		최소 : <span>\</span><span><fmt:formatNumber value="${room.price}" pattern="#,###" /></span> /박
   	</div>
   	<div class="booking-wrap">
   		<form name="bfrm" method="post" action="${pageContext.request.contextPath}/sub/detail/${room.no}">
   		<input type="hidden" name="totalprice" id="totalprice">
   		<input type="hidden" name="diffdays" id="diffdays">
    	<div class="w3-row content_1">
    		<div class="w3-col s3">
    			<label class="booking-menu">체크인</label>
    		</div>
    		<div class="w3-col s4">
    			<input type="text" id="checkin" name="checkin" required placeholder="년/월/일" class="booking-height">
    		</div>
    		
    	</div>		
    	<div class="w3-row content_1">
    		<div class="w3-col s3">
    			<label class="booking-menu">체크아웃</label>
    		</div>
    		<div class="w3-col s4">
    			<input type="text" id="checkout" name="checkout" required placeholder="년/월/일" class="booking-height">
    		</div>
    	</div>
    	<div class="w3-row content_1">
    		<div class="w3-col s3">
    			<label class="booking-menu">인원</label>
    		</div>
    		<div class="w3-col s5">
    			<input type="number" name="qty" id="qty"  value="1" class="area-80 booking-height inputNum text-center" > 
    			<span>명</span>
    		</div>
    	</div>
    	<div class="w3-row content_1" id="divOption" style="display:none;">
    		<table class="fixed_table" >
    			<tr>
    				<td id="atm_content"></td>
    				<td id="atm" class="text-right"></td>
    			</tr>	
    			<tr>
    				<td class="font-bold">합계</td>
    				<td id="total" class="text-right font-bold"></td>
    			</tr>
    		</table>
    	</div>
    	<div class="w3-row w3-center">
    			<sec:authorize access="!isAuthenticated()">
    				<a href="${pageContext.request.contextPath}/member/login">
    					<input type="button" class="booking-width booking-height  w3-red w3-round-large" value="예약 가능 여부 확인">
    				</a>
    			</sec:authorize>
    			<sec:authorize access="isAuthenticated()">
    				<input type="submit" class="booking-width booking-height  w3-red w3-round-large" value="예약 가능 여부 확인">
    			</sec:authorize>	
    	</div>
    	</form>
    	<div class="w3-row booking-comment">
    		100% 환불 가능ㆍ예약 확정 전에는 요금이 청구되지 않습니다.
    	</div>
    	<hr>
    	<div class="w3-row w3-center">
    		<input type="button" class="booking-width booking-height w3-white w3-round-large wl-btn2" value="위시리스트에 담기">
    	</div>
   	</div>
   </div>
   
  
   <!-- fixed 예약(E) -->
		    
    <!--  후기 -->
    <%@ include file="/WEB-INF/view/sub/review.jsp" %>
		    
		    
    <div class="host">
        <div>호스트: Stephanie And Jay님</div>
    </div>
    <div class="host_1">
        <span>죠슈아 트리(Joshua Tree), 캘리포니아,  미국</span>
        <span>·</span>
        <span>회원가입: 1월 2010</span>
    </div>
    <div class="host_2">
        <div>어쩌구저쩌꾸 We are creative types who left Los Angeles in 2010 seeking a richer, more serene lifestyle inside nature. Stephanie is an architect, Jay is founder/editor of Arthur Magazine. We live in Joshua Tree full-time and rent out our three restored homestead cabins (with a fourth on the way). We're active in the local community and we also maintain ties to friends and colleagues in LA and beyond. We're excited to meet you and we offer you a warm welcome. 어쩌구저쩌구</div>
    </div>
    
    <sec:authorize access="!isAuthenticated()">
		<a href="${pageContext.request.contextPath}/member/login"><button class="host_3"><div>호스트에게 연락하기</div></button></a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<button class="messagebtn host_3"><div>호스트에게 연락하기</div></button>	
	</sec:authorize>
    	
    <div>
		<div>지역정보</div>
      	<div id="map">지도 공간</div>
	</div>
	<div>정확한 위치 정보는 예약이 확정된 후 알려드립니다.</div>
</div>
		
<%@ include file="/WEB-INF/view/template/footer.jsp" %>   