<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<div class="center">
	<div class="area-30 middle">
		<form action="${pageContext.request.contextPath}/loginProc"
			method="post">
			<sec:csrfInput/>
			<div class="row_login">
				<input type="email" name="email" placeholder="Email" class="w3-input"
					required>
			</div>
			<div class="row_login">
				<input type="password" name="pw" placeholder="Password"
					class="w3-input" required>
			</div>
			<div class="row_login">
				<input type="checkbox" id="remember" class="user-check"> <label
					for="remember"> <span></span> 아이디 기억하기
				</label>
			</div>
			<div class="row_login">
				<input type="submit" value="로그인" class="input-btn area-60">
			</div>
	
			<div class="row_login">
				<hr>
				<a href="">비밀번호가 생각나지 않으세요?</a>
			</div>
			<div class="row_login">
				<hr>
				<label>계정이 없으세요?</label>
				<button
					class="joinbtn w3-button w3-white w3-border w3-border-blue w3-round-large w3-right">회원가입</button>
			</div>
		</form>
	</div>
	<div class="empty"></div>
	<div class="empty"></div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>