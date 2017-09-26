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
								<c:if test="${room_no eq no.key }"><option value="${no.key}"  selected>${no.value}</option></c:if>
								<c:if test="${room_no != no.key }"><option value="${no.key}" >${no.value}</option></c:if>
							</c:forEach>
						</select>
		  			</div>
		  			<div class="w3-col s2 w3-center host-row1">	
				  		<select class="host-select" name="syear">
				  			<c:forEach begin="0" end="10" var="idx" step="1">
				  				<c:if test="${syear eq (year - idx) }"><option value="${syear}" selected>${syear}년</option></c:if>
			           			<c:if test="${syear != (year - idx) }"><option value="${year - idx}">${year - idx}년</option></c:if>
				          	</c:forEach>
			          	</select>
			  		</div>
			  		<div class="w3-col s2 w3-center host-row1">	
				  		<select class="host-select" name="startMonth">
				  			<c:forEach begin="1" end="12" step="1" var="i">
				  			  	<c:if test="${sMonth eq i }">
				  			  		<option  value="<fmt:formatNumber value='${i}' pattern='00'/>"  selected>
									시작: <fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>
								<c:if test="${sMonth != i }">
									<option  value="<fmt:formatNumber value='${i}' pattern='00'/>"  >
									시작: <fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>	
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col s2 host-row1">	
				  		<select class="host-select" name="endMonth">
				  			<c:forEach begin="1" end="12" step="1" var="i">
				  				<c:choose>
				  					<c:when test="${eMonth != null}">
				  						<c:if test="${eMonth eq i}"><option value="<fmt:formatNumber value='${i}' pattern='00'/>" selected>종료:<fmt:formatNumber value='${i}' pattern='00'/>월</option></c:if>
				  						<c:if test="${eMonth != i}"><option value="<fmt:formatNumber value='${i}' pattern='00'/>">종료:<fmt:formatNumber value='${i}' pattern='00'/>월</option></c:if>
				  					</c:when>
				  					<c:otherwise>
				  						<c:if test="${i eq 12}">
						  					<option value="<fmt:formatNumber value='${i}' pattern='00'/>" selected>종료:<fmt:formatNumber value='${i}' pattern='00'/>월</option>
						  				</c:if>
						  				<c:if test="${i != 12}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>" >종료:<fmt:formatNumber value='${i}' pattern='00'/>월</option>
										</c:if>	
				  					</c:otherwise>
				  				</c:choose>
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col s2 host-row1 searchbtn">
			  			<input type="submit"  value="검색" class="w3-button w3-gray w3-small">
			  		</div>
			  	</div>
			  	</form>
			  	<div class="host-row1 area-90" id="sub1">	
			  		<table class="history_table" >
			  			<thead>
			  				<tr>
				  				<th>날짜</th>
				  				<th>숙소명</th>
				  				<th>수령 완료 금액</th>
				  			</tr>	
			  			</thead>
			  			<tbody>
			  				<c:forEach var="rsvp" items="${cList}">
				  				<tr> 
				  					<td>${rsvp.getEdate()} </td>
				  					<td>
				  						<c:forEach var="no" items="${map}">
						  				<c:if test="${no.key == rsvp.room_no}">
							  				<c:set value="${no.value}" var="room"/>
					  						${room.name}
				  						</c:if>
				  						</c:forEach>
				  					</td>
				  					<td style="text-align:right;"><fmt:formatNumber value="${rsvp.totalprice}" pattern="#,###" /></td>
			  					</tr>
			  				</c:forEach>
			  				<tr>
			  					<td colspan="2"><b>총합계</b></td>
			  					<td style="text-align:right;"><b><fmt:formatNumber value="${total}" pattern="#,###" /></b></td>
			  				</tr>
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