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
	        <li>
	            <a href="${pageContext.request.contextPath}/mypage/rooms">숙소 목록</a>
	        </li>
	        <li class="hover">
	            <a href="${pageContext.request.contextPath}/mypage/setting">계정 관리</a>
	        </li>
	    </ul>
	</div>
	<div class="w3-row">
		<div class="w3-col s4 w3-white w3-center submenu_wrap">
			<ul>
				<li class="hover"><a href="${pageContext.request.contextPath}/mypage/setting">계정관리</a></li>
				<li><a href="">대금수령내역</a></li>
			
			</ul>
		</div>
		<form id="rfrm" method="post" action="#">
		  	<div class="w3-col l6 m3 s4 w3-white w3-center subcontent">
		  		<div class="subtab">
					비밀번호 변경
				</div>
				<div class="area-60">
					<div class="w3-row">
						<div class="w3-col s3 text-right host-row1">
							<label>이전 비밀번호</label>
						</div>
						<div class="w3-col s5 host-row1">	
					  		<input type="password" name="">
				  		</div>
			  		</div>
			  		<div class="w3-row">
				  		<div class="w3-col s3 text-right host-row1">
					  		<label>새 비밀번호</label>
					  	</div>
				  		<div class="w3-col s5 host-row1">	
					  		<input type="password" name="pw">
				  		</div>
				  	</div>
				  	<div class="w3-row">	
				  		<div class="w3-col s3 text-right host-row1">
					  		<label>비밀번호 확인</label>
					  	</div>
				  		<div class="w3-col s5 host-row1">	
					  		<input type="password" name="pw_confirm">
				  		</div>
				  	</div>	
		  		</div>
		  		<div class="pw-wrap">
		  			<div class="w3-right pw-btn">
						<input type="submit" class="w3-btn w3-round w3-red" value="비밀번호 업데이트">
					</div>
				</div>
		  	</div>
		  
	  	</form>
	 </div> 	
	 	<form id="dfrm" method="post" action="#">
	  		<div class="w3-row host-row1">
	  			<div class="w3-col s4" >&nbsp;</div>
			  	<div class="w3-col l6 m3 s4 subcontent">
			  		<div class="subtab">
						계정 해지
					</div>
					<div class="pw-wrap">
			  			<div class="pw-btn w3-left">
							<input type="submit" class="w3-btn w3-round w3-red" value="계정 해지하기">
						</div>
					</div>
			  	</div>
		  	</div>
	  	</form>
	
</div>