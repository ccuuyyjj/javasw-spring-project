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
				<div class="area-50">
					<div class="w3-col s3 text-right host-row1">
						<label>이전 비밀번호</label>
					</div>
					<div class="w3-col s4 w3-left host-row1">	
				  		<input type="password" name="">
			  		</div>
			  		<div class="w3-col s3 text-right host-row1">
				  		<label>새 비밀번호</label>
				  	</div>
			  		<div class="w3-col s4 w3-left host-row1">	
				  		<input type="password" name="">
			  		</div>
			  		<div class="w3-col s3 text-right host-row1">
				  		<label>비밀번호 확인</label>
				  	</div>
			  		<div class="w3-col s4 w3-left host-row1">	
				  		<input type="password" name="">
			  		</div>
		  		</div>
		  	</div>
		  
	  	</form>
	</div>
</div>