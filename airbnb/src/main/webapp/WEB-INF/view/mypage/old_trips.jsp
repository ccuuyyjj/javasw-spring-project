<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mypage.css" />
<script src="${pageContext.request.contextPath }/js/trip.js"></script>
<div class="w3-main w3-content w3-padding"
	style="max-width: 100%; margin-top: 100px">
	<div class="menu-wrap">
		<ul class="w3-center">
			<li><a href="${pageContext.request.contextPath}/sub/message">메시지</a>
			</li>
			<li><a href="${pageContext.request.contextPath}/mypage/rooms">숙소
					목록</a></li>
			<li class="hover"><a
				href="${pageContext.request.contextPath}/mypage/trips">여행 목록</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/setting">계정
					관리</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/wishlist">위시
					리스트</a></li>
		</ul>
	</div>
	<div class="w3-row">
		<div class="w3-col s4 w3-white w3-center submenu_wrap">
			<ul>
				<li class="hover"><a
					href="${pageContext.request.contextPath}/mypage/trips">예정된 여행</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mypage/old_trips">지나간
						여행</a></li>
			</ul>
		</div>
			<div class="w3-col l6 m3 s4w3-white w3-center subcontent">
				<div class="subtab">지나간 여행</div>
				<div class="w3-row">
					<div class="host-row1 area-100">
						<table class="history_table">
							<thead>
								<tr>
									<th>숙소/위치</th>
									<th>호스트</th>
									<th>날짜</th>
									<th>옵션</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${rsvp}" var="list">
									<tr>
										<td>${list.address}</td>
										<td>${list.host_name}</td>
										<td>${list.startdate.substring(0,10)}<br>${list.enddate.substring(0,10)}</td>
										<td>
											<input type="hidden" value="${list.room_no}">
											<button class="move_rsv w3-btn w3-round-large w3-green" >이동 하기</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	</div>
</div>
<div class="empty"></div>
<div class="empty"></div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>