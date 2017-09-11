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
	            <a href="#">계정 관리</a>
	        </li>
	    </ul>
	</div>
	<div class="w3-row">
		<div class="w3-col s4 w3-white w3-center submenu_wrap">
			<ul>
				<li class="hover"><a href="">숙소 목록</a></li>
				<li><a href="">예약 관리</a></li>
			</ul>
		</div>
	  	<div class="w3-col l6 m3 s4w3-white w3-center subcontent">
	  		<div class="subtab">
				등록 진행 중
			</div>
			<ul class="list-layout ">
				<li>
						<div class="w3-col s5 image-wrap">
							<img src="http://placehold.it/288x185">
						</div>
						<div class="w3-col s7 content-wrap">
							<div class="w3-col content-step">
								숙소 등록이 2단계 완료되었습니다. 
							</div>
							<div class="w3-col content-title">
								숙소 제목
							</div>
							<div class="w3-col content-update">
								최종 업데이트 : 
							</div>
							<div class="w3-col content-update">
								<button class="w3-btn w3-round-large w3-red">등록 완료하기</button>
								&nbsp;
								<button class="w3-button  w3-round-large w3-white w3-border">미리보기</button>
							</div>
						</div>
				</li>
				<li>
						<div class="w3-col s5 image-wrap">
							<img src="http://placehold.it/288x185">
						</div>
						<div class="w3-col s7 content-wrap">
							<div class="w3-col content-step">
								숙소 등록이 2단계 완료되었습니다. 
							</div>
							<div class="w3-col content-title">
								숙소 제목
							</div>
							<div class="w3-col content-update">
								최종 업데이트 : 
							</div>
							<div class="w3-col content-update">
								<button class="w3-btn w3-round-large w3-red">등록 완료하기</button>
								&nbsp;
								<button class="w3-button  w3-round-large w3-white w3-border">미리보기</button>
							</div>
						</div>
				</li>
			</ul>
	  	</div>
	</div>
</div>