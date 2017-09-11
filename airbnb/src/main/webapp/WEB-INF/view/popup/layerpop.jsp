<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mask"></div>
<div id="popup_area">
	<div class="window" style="display:none;" id="login">
			<img src="${pageContext.request.contextPath}/img/ico_close.png" class="close">
			<div class="empty"></div>
			<div class="area-60  layer-center">
		    <form action="#" method="post">
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
	
	<div class="window" style="display:none;" id="join">
			<img src="${pageContext.request.contextPath}/img/ico_close.png" class="close">
			<div class="empty"></div>
			<div class="area-60  layer-center">
		    <form action="${pageContext.request.contextPath}/member/join" method="post">
		    
		        <div class="row">
		            <input type="email" name="email" placeholder="Email" class="w3-input" required>
		        </div>
		        <div class="row">
		           <input type="password" name="pw" placeholder="Password" class="w3-input" required>
		        </div>
		        <div class="row">
		            <input type="text" name="name" placeholder="이름" class="w3-input" required>
		        </div>
		         <div class="row">
		            <input type="tel" name="phone" placeholder="연락처&nbsp&nbsp'&nbsp-&nbsp' &nbsp제외"  class="w3-input" required>
		        </div>
		        <div class="row">
		            <input type="submit" value="회원가입" class="input-btn area-80">
		        </div>
		        
		        <div class="row">
		        	&nbsp;
		        </div>
		        <div class="row">
		        	<hr>
		        	<label>계정이 있나요?</label>
		            <button class="loginbtn w3-button w3-white w3-border w3-border-blue w3-round-large w3-right">로그인</button>
		        </div>
		    </form>
		    </div>
	</div>
	<div class="window" style="display:none;" id="message">
		<img src="${pageContext.request.contextPath}/img/ico_close.png" class="close">
		<div class="empty"></div>
		<div class="area-60 center">
	    <form action="${pageContext.request.contextPath}/sub/sendMessage" method="post">
	  		<div>
	            <span>회원번호</span><input type="number" name="member_no" placeholder="회원번호">
	        </div>
		    <div>
	            <span>방번호</span><input type="number" name="room_no" placeholder="방번호">
	        </div>
	        <div>
	            <span>체크인</span><input type="date" name="checkin" placeholder="체크인">
	        </div>
	        <div>
	            <span>체크아웃</span><input type="date" name="checkout" placeholder="체크아웃">
	        </div>
	        <div>
	            <span>인원</span><input type="number"  name="quantity" max="9999" maxlength="4"/><span>명</span>
	        </div>
	        <div>
	            <textarea name="question" rows="3" cols="30" placeholder="내용"></textarea>
	        </div>
	        <div>
	            <input type="submit" value="메세지 보내기">
	        </div>
	    </form>
	    </div>
	</div>
</div>	