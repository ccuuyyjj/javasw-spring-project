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
	        <li>
	            <a href="${pageContext.request.contextPath}/mypage/trips">여행 목록</a>
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
					<li class="on"><a href="${pageContext.request.contextPath}/mypage/transaction_history">수령완료 내역</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/future_transactions">수령예정 내역</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/tax_report">총 수입</a></li>
				</ul>
			</div>
			<!-- 수령완료 내역 -->
			<div class="area-100 tab-item"  id="menu1">
				<form id="rfrm" method="post" action="${pageContext.request.contextPath}/mypage/transaction_history">
				<div class="w3-row">
			  		<div class="w3-col s3  text-right host-row1">
				  		<select class="host-select" name="roomName">
							<option value="all">모든 숙소</option>
							<c:forEach var="no" items="${nameList}">
								<option value="${no.key}|${no.value}">${no.value}</option>
							</c:forEach>
						</select>
		  			</div>
		  			<div class="w3-col s2 w3-center host-row1">	
				  		<select class="host-select" name="year">
				  			<c:forEach begin="0" end="10" var="idx" step="1">
			           			<option value="${today - idx}">${today - idx}년</option>
				          	</c:forEach>
			          	</select>
			  		</div>
			  		<div class="w3-col s2 w3-center host-row1">	
				  		<select class="host-select" name="startMonth">
				  			<c:forEach begin="1" end="12" step="1" var="i">
								<option value="${i}">시작: ${i}월</option>
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col s2 host-row1">	
				  		<select class="host-select" name="endMonth">
				  			<c:forEach begin="1" end="12" step="1" var="i">
				  				<c:if test="${i eq 12}">
				  					<option value="${i}" selected>종료:${i}월</option>
				  				</c:if>
				  				<c:if test="${i != 12}">
									<option value="${i}" >종료:${i}월</option>
								</c:if>	
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col s2 host-row1 searchbtn">
			  			<input type="button" onClick="JavaScript:cngoption(1)" value="검색" class="w3-button w3-gray w3-small">
			  		</div>
			  	</div>
			  	</form>
			  	<div class="host-row1 area-100" id="sub1">	
			  		<table class="history_table" >
			  			<thead>
			  				<th>날짜</th>
			  				<th>종류</th>
			  				<th>상세정보</th>
			  				<th>금액</th>
			  				<th>수령 완료 금액</th>
			  			</thead>
			  			<tbody>
			  				<td colspan="5" align="center"><b>거래 없음</b></td>
			  			</tbody>
			  		</table>
			  	</div>
	  		</div>
		</div>
	</div>
</div>	
<div class="empty"></div>
<div class="empty"></div>

<%@ include file="/WEB-INF/view/template/footer.jsp" %>