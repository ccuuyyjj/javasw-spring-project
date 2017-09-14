<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css"/>
<script>
$(document).ready(function(){
	$(".subtab").on("click", function(){
      	$("#tab"+(i+1)).css("color", red);
    });
	
});
</script>
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
				<li><a href="${pageContext.request.contextPath}/mypage/setting">계정관리</a></li>
				<li class="hover"><a href="${pageContext.request.contextPath}/mypage/transaction_history">대금수령내역</a></li>
			
			</ul>
		</div>
		
		  	<div class="w3-col l6 m3 s4 w3-white w3-center subcontent">
		  		<div class="subtab">
					<ul>
						<li id="tab1"><a href="" aria-selected="true">수령완료 내역</a></li>
						<li id="tab2"><a href="" aria-selected="false">수령예정 내역</a></li>
						<li id="tab3"><a href="" aria-selected="false">총 수입</a></li>
					</ul>
				</div>
				<!-- 수령완료 내역 -->
				<div class="area-60 tab-item"  id="menu1">
					<form id="rfrm" method="post" action="#">
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
				  	</form>
		  		</div>
		  		
		  		<!-- 수령예정 내역 -->
				<div class="area-60 tab-item" id="menu2" >
					<form id="rfrm" method="post" action="#">
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
				  	</form>
		  		</div>
		  		<!-- 총 수입 내역 -->
				<div class="area-60 tab-item" id="menu3">
					<form id="rfrm" method="post" action="#">
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
				  	</form>
		  		</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>