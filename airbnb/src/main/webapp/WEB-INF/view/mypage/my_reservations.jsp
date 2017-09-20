<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css"/>
<script>
function reg(pVal){
	document.getElementById("rfrm").action = '${pageContext.request.contextPath}/host/become_host'+pVal;
	document.getElementById("rfrm").submit();
}
function del_confirm(pNo){
	$("#room_"+pNo).hide();
	$("#delcontent_"+pNo).show();
	
}
function back_reg(pNo){
	$("#room_"+pNo).show();
	$("#delcontent_"+pNo).hide();
}
function del_reg(pNo){
	$.ajax({
		   type: "POST",
		   url: "${pageContext.request.contextPath}/mypage/room_del",
		   data: { "room_no" : pNo },
		   DateType: "html",
		   cache: false,
		   success: function(msg){
		   },
		  error:function(a, b, c){
				console.log(a, b, c);
			}
	});
}
</script>
<div class="w3-main w3-content w3-padding" style="max-width:100%;margin-top:100px">
	<div class="menu-wrap">
	    <ul class="w3-center">
	        <li>
	            <a href="${pageContext.request.contextPath}/sub/message">메시지</a>
	        </li>
	        <li class="hover">
	            <a href="${pageContext.request.contextPath}/mypage/rooms">숙소 목록</a>
	        </li>
	        <li>
	            <a href="${pageContext.request.contextPath}/mypage/trips">여행 목록</a>
	        </li>
	        <li>
	            <a href="${pageContext.request.contextPath}/mypage/setting">계정 관리</a>
	        </li>
	    </ul>
	</div>
	<div class="w3-row">
		<div class="w3-col s4 w3-white w3-center submenu_wrap">
			<ul>
				<li><a href="${pageContext.request.contextPath}/mypage/rooms">숙소 목록</a></li>
				<li class="hover"><a href="${pageContext.request.contextPath}/mypage/my_reservations">예약 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/host/become_host1">
						<button class="w3-btn w3-round-large w3-green">새로운 숙소 추가</button>
				</a></li>
			</ul>
		</div>
		
	  	<div class="w3-col l8 m3 s6 w3-white w3-center subcontent">
	  		<div class="subtab">
				예약현황
			</div>
			<form id="rfrm" method="post">
			<ul class="list-layout ">
				<c:forEach var="room" items="${host_list}">
				<input type="hidden" name="room_no" value="${room.no}">
				<li class="w3-left" id="room_${room.no}">
						<img src="${pageContext.request.contextPath}/img/ico_close.png" onclick="JavaScript:del_confirm(${room.no});" id="del${room.no}" class="hostclose">
						<div class="w3-col s5 image-wrap">
							<c:if test="${room.photoUrl ne null}">
								<img src="${pageContext.request.contextPath}/viewPhoto/${room.no}" width="288" height="185">
							</c:if>	
							<c:if test="${room.photoUrl eq null}">
								<img src="http://placehold.it/288x185" width="288" height="185">
							</c:if>	
						</div>
						<div class="w3-col s7 content-wrap">
							<div class="w3-col content-title">
								${room.name}
							</div>
							<div class="w3-col content-update">
								최종 업데이트 : ${room.getDate()} 
							</div>
						</div>
						<!-- 예약이 있을 경우  -->
<%-- 						<c:if test="${comp_list}"></c:if> --%>
						<div>
							<table class="area-100 comple-table" align="center" >
								<tbody>
									<tr class="border-bottom">
										<th>상태</th>
										<th>게스트id</th>
										<th>게스트이름</th>
										<th>연락처</th>
										<th>날짜</th>
										<th>인원</th>
										<th>옵션</th>
									</tr>
									<tr class="border-bottom">
										<td>예약요청</td>
										<td>testid</td>
										<td>게스트사용자명</td>
										<td>0123544122558844411</td>
										<td>2017.09. 30 ~ 2017.10.07</td>
										<td>3</td>
										<td>
											<select>
												<option value="">- 선택 -</option>
												<option value="1">예약확인</option>
												<option value="2">예약승낙</option>
												<option value="99">예약거절</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
				</li>
				<li id="delcontent_${room.no}" style="display:none;" class="delcontent">
					<h6>숙소 삭제</h6>
					이 숙소를 삭제하시겠습니까? 삭제하면 되돌릴 수 없습니다<br><br>
					<button class="w3-button w3-round w3-green" onclick="JavaScript:del_reg(${room.no})">삭제</button>
					<button class="w3-button w3-round w3-white" onclick="JavaScript:back_reg(${room.no})">뒤로</button>
				</li>
				
				
				</c:forEach>
			</ul>
			</form>
	  	</div>
	</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>