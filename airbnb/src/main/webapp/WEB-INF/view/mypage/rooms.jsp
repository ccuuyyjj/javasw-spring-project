<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css"/>
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
	            <a href="${pageContext.request.contextPath}/mypage/setting">계정 관리</a>
	        </li>
	    </ul>
	</div>
	<div class="w3-row">
		<div class="w3-col s4 w3-white w3-center submenu_wrap">
			<ul>
				<li class="hover"><a href="${pageContext.request.contextPath}/mypage/rooms">숙소 목록</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/my_reservations">예약 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/host/become_host1">
						<button class="w3-btn w3-round-large w3-green">새로운 숙소 추가</button>
				</a></li>
			</ul>
		</div>
		<form id="rfrm" method="post">
	  	<div class="w3-col l6 m3 s4w3-white w3-center subcontent">
	  		<div class="subtab">
				등록 진행 중
			</div>
			<ul class="list-layout ">
				<c:forEach var="room" items="${host_list}">
				<input type="hidden" name="room_no" value="${room.no}">
				<li class="w3-left">
						<div class="w3-col s5 image-wrap">
							<c:if test="${room.photoUrl ne null}">
								<img src="${pageContext.request.contextPath}/viewPhoto/${room.no}" width="288" height="185">
							</c:if>	
							<c:if test="${room.photoUrl eq null}">
								<img src="http://placehold.it/288x185" width="288" height="185">
							</c:if>	
						</div>
						<div class="w3-col s7 content-wrap">
							<div class="w3-col content-step">
								숙소 등록이 ${room.progress}단계 완료되었습니다. 
							</div>
							<div class="w3-col content-title">
								${room.name}
							</div>
							<div class="w3-col content-update">
								최종 업데이트 : ${room.getDate()} 
							</div>
							<div class="w3-col content-update">
								<c:if test="${room.progress < 3}">
									<input type="submit" formaction="${pageContext.request.contextPath}/host/become_host${room.progress+1}" value="등록 완료하기" class="w3-btn w3-round-large w3-red" >
								</c:if>
								<c:if test="${room.progress eq 3}">
									<input type="submit" formaction="${pageContext.request.contextPath}/host/become_host3_3" value="숙소 등록" class="w3-btn w3-round-large w3-red">숙소 등록
								</c:if>
								&nbsp;
<!-- 								<button class="w3-button  w3-round-large w3-white w3-border">미리보기</button> -->
							</div>
						</div>
				</li>
				</c:forEach>
			</ul>
	  	</div>
	  	</form>
	</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>