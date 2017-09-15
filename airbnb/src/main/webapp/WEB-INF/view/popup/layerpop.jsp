<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="mask"></div>
<div id="popup_area">
	<div class="window" style="display:none;" id="login">
			<img src="${pageContext.request.contextPath}/img/ico_close.png" class="close">
			<div class="empty"></div>
			<div class="area-60  layer-center">
		    <form action="${pageContext.request.contextPath}/loginProc" method="post">
		        <div class="row">
		            <input type="email" name="email" placeholder="Email" class="w3-input" required>
		        </div>
		        <div class="row">
		           <input type="password" name="pw" placeholder="Password" class="w3-input" required>
		        </div>
		        <div class="row">
		            <input type="checkbox" id="remember" class="user-check">
		            <label for="remember">
		                <span></span>
		                아이디 기억하기
		            </label>
		        </div>
		        <div class="row">
		            <input type="submit" value="로그인" class="input-btn area-80">
		        </div>
		        
		        <div class="row">
		        	<hr>
		        	<a href="">비밀번호가 생각나지 않으세요?</a>
		        </div>
		        <div class="row">
		        	<hr>
		        	<label>계정이 없으세요?</label>
		            <button class="joinbtn w3-button w3-white w3-border w3-border-blue w3-round-large w3-right">회원가입</button>
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
				<br>
				<br>
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
<div>
	    <form action="${pageContext.request.contextPath}/sub/sendMessage" method="post">
	        <input type="hidden" name="member_no" value="1">
	        <input type="hidden" name="name" value="${room.name}">
	        <input type="hidden" name="price" value="${room.price}">
	        <input type="hidden" name="room_no" value="${room.no}">
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
                    <input type="date" name="checkin" placeholder="체크인">
                </div>
                <div class="area-45 md-checkout">
                    <input type="date" name="checkout" placeholder="체크아웃">
                </div>
	        </div>
            <div class="md-container_2">인원</div>
	        <div class="md-row md-container_3">
                <input class="area-90" type="number"  name="quantity" max="9999" maxlength="4"/><span>명</span>
	        </div>
            <div class="md-container_2">호스트에게 메세지 보내기</div>
	        <div class="md-row md-container_3">
                <textarea name="question" rows="5" cols="50" placeholder="메세지 쓰기..."></textarea>
	        </div>
	        <div class="md-row">
	            <input class="area-100 md-btn" type="submit" value="메세지 보내기">
	        </div>
	    </form>
	    </div>
	    </div>
	</div>
</div>
