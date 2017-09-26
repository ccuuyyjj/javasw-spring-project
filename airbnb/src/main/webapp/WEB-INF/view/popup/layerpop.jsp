<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="mask"></div>
<div id="popup_area">
	<div class="window" style="display: none;" id="login">
		<img src="${pageContext.request.contextPath}/img/ico_close.png"
			class="close">
		<div class="empty"></div>
		<div class="area-60  layer-center">
			<form action="${pageContext.request.contextPath}/loginProc"
				method="post">
				<div>
					<input type="email" name="email" placeholder="Email"
						class="w3-input" required>
				</div>
				<div>
					<input type="password" name="pw" placeholder="Password"
						class="w3-input" required>
				</div>
				<div class="remember">
					<input type="checkbox" id="remember" class="user-check"> <label
						for="remember"> <span></span> 아이디 기억하기
					</label>
				</div>
				<div class="w3-center">
					<input type="submit" value="로그인" class="input-btn area-80">
				</div>

				<div>
					<hr>
					<a href="">비밀번호가 생각나지 않으세요?</a>
				</div>
				<div>
					<hr>
					<label>계정이 없으세요?</label>
					<button
						class="joinbtn w3-button w3-white w3-border w3-border-blue w3-round-large w3-right">회원가입</button>
				</div>
			</form>
		</div>
	</div>
	<div class="window" style="display: none;" id="join">
		<img src="${pageContext.request.contextPath}/img/ico_close.png"
			class="close">
		<div class="empty"></div>
		<div class="area-60  layer-center">
			<!-- 회원가입 폼 -->
			<form id="a_join"
				action="${pageContext.request.contextPath}/member/join"
				method="post">
				<div>
					<input type="email" id="a_email" name="email" placeholder="Email"
						class="w3-input resource" required>
				</div>
				<div>
					<input type="password" name="pw" placeholder="Password"
						class="w3-input resource" required>
				</div>
				<div>
					<input type="text" name="name" placeholder="이름"
						class="w3-input resource" required>
				</div>
				<div>
					<input type="tel" name="phone"
						placeholder="연락처&nbsp&nbsp'&nbsp-&nbsp' &nbsp제외"
						class="w3-input resource" required>
				</div>
				<br> <br>
				<div>
					<input type="submit" value="회원가입" class="input-btn area-80">
				</div>

				<div>&nbsp;</div>
				<div>
					<hr>
					<label>계정이 있나요?</label>
					<button
						class="loginbtn w3-button w3-white w3-border w3-border-blue w3-round-large w3-right">로그인</button>
				</div>
			</form>
		</div>
	</div>

	<div class="messageWindow" style="display: none;" id="message">
		<img src="${pageContext.request.contextPath}/img/ico_close.png"
			class="close">
		<div class="empty"></div>
		<div class="area-60 layer-center">
			<form action="${pageContext.request.contextPath}/sub/sendMessage"
				method="post">
				<input type="hidden" name="name" value="${room.name}"> <input
					type="hidden" name="price" value="${room.price}"> <input
					type="hidden" name="room_no" value="${room.no}">
				<div class="md-row md-container_1">※체크인 및 체크아웃 날짜를 정해주세요</div>
				<div class="md-container_2">언제 여행하실 계획인가요?</div>
				<div class="md-row md-container md-checkin">
					<div class="area-45 md-checkin">
						<span>체크인</span>
					</div>
					<div class="area-45 md-checkout">
						<span>체크아웃</span>
					</div>
					<div class="area-45 md-checkin">
						<input type=text name="checkin" id="checkIn" placeholder="체크인">
					</div>
					<div class="area-45 md-checkout">
						<input type="text" name="checkout" id="checkOut"
							placeholder="체크아웃">
					</div>
				</div>
				<div class="md-container_2">인원</div>
				<div class="md-row md-container_3">
					<input class="area-90" type="number" name="quantity" max="9999"
						maxlength="4" /><span>명</span>
				</div>
				<div class="md-container_2">호스트에게 메세지 보내기</div>
				<div class="md-row md-container_3">
					<textarea name="question" rows="5" cols="50"
						placeholder="메세지 쓰기..."></textarea>
				</div>
				<div class="md-row">
					<input class="area-100 md-btn" type="submit" value="메세지 보내기">
				</div>
			</form>
		</div>
	</div>
	<div class="wishListWindow" style="display: none;" id="wishList">
		<img src="${pageContext.request.contextPath}/img/ico_close.png"
			class="close">
		<div class="empty"></div>
		<div class="area-80 layer-center">
			<div>
				<form action="${pageContext.request.contextPath}/mypage/wishlist"
					method="post" id="wishform">
					<input type="hidden" name="room_no" value="${no}">
					<div class="w-row wfont">위시리스트에 담기</div>
					<div class="w-row" id="addwl">
						<button class="wbtn">새로운 위시리스트 만들기</button>
						<div id="newwl" style="display: none">
							<div class="wfont_3">이름</div>
							<div class="wl-box_4">
								<input class="wl-input" type="text" required
									placeholder="위시리스트의 제목을 지정하세요">
							</div>
							<div class="wl-box_5">
								<button class="wbtn3">취소</button>
								<button class="wbtn4" disabled>목록 만들기</button>
							</div>
						</div>
					</div>
					<div class="appendhere"></div>
					<input type="submit" value="등록" class="insert">
				</form>
				<div style="margin-top: 70px">
					<div class="wl-box_3">
						<button class="wbtn2">
							<div class="wl-box">
								<div class="wl-img"
									style="background-image: url('${pageContext.request.contextPath}/viewPhoto/${room.no}')">
								</div>
							</div>
							<div class="wl-box_1">
								<div class="wl-box_2 wfont_3">${room.name}</div>
								<div class="wl-box_2 wfont_2">${room.region}</div>
								<div class="wl-box_2 wfont_2" style="margin-bottom: 0px">
									<c:choose>
										<c:when test="${avg==1 }">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
										</c:when>
										<c:when test="${avg==2 }">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
										</c:when>
										<c:when test="${avg==3 }">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
										</c:when>
										<c:when test="${avg==4 }">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
										</c:when>
										<c:when test="${avg==5 }">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
											<img src="${pageContext.request.contextPath}/img/star.png"
												width="8" height="8" style="margin-bottom: 0px">
										</c:when>
									</c:choose>
									<span>후기 ${total}개</span>
								</div>
							</div>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 예약 취소시 -->
	<div class="rsv_class" style="display: none;" id="rsv_id">
		<img src="${pageContext.request.contextPath}/img/ico_close.png"
			class="close">
		<div class="refund">
			<div class="wfont">환불 정책</div>
			<div id="rsv_policy">
<p>체크인 30일 전까지 취소: 모든 수수료를 포함한 전액 환불</p>
<p>체크인 30일 전부터 체크인 전까지 취소: 체크인 당일 오후 12시까지 취소하면 총 숙박 요금의 50% 및 수수료, 청소비 전액 환불</p>
<p>숙박 중 취소: 현지 시간으로 오후 12시 전까지 취소하면 남은 숙박일에 대한 숙박 요금은 50% 환불되지만 수수료, 청소비는 환불 불가. 현지 시간으로 오후 12시 이후에 취소하면 당일 숙박 요금과 수수료, 청소비는 환불되지 않으며, 남은 숙박일에 대한 숙박 요금의 50% 환불</p>
			</div>
			<input type="hidden">
			<div id="rsv_btn">
				<button class="w3-btn w3-round-large w3-green final_rsv">예약
					취소</button>
			</div>
		</div>
	</div>
</div>
<script>
	var enabledays = new Array();
	<c:forEach items="${availList}" var="avail">
	enabledays.push('${avail.getDate()}');
	</c:forEach>
	jQuery('#checkIn').datepicker({
		dateFormat : 'yy/mm/dd',
		minDate : 0,
		constrainInput : false,
		beforeShowDay : enableAllTheseDays
	});

	jQuery('#checkOut').datepicker({
		dateFormat : 'yy/mm/dd',
		constrainInput : false,
		minDate : 0,
		beforeShowDay : enableAllTheseDays
	});
</script>
