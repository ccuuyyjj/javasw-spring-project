<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>airbnb 관리자</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminpage.css" />
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<body>

<!-- menu -->
<nav class="w3-sidebar w3-blue w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>airbnb<br>관리자</b></h3>
  </div>
  <div class="w3-bar-block">
    <a href="${pageContext.request.contextPath}/admin/member" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">회원관리</a> 
    <a href="${pageContext.request.contextPath}/admin/reservations" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">예약현황</a> 
    <a href="${pageContext.request.contextPath}/admin/sales" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white w3-gray">매출현황</a> 
  </div>
</nav>
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">
  	<div class="w3-container" id="member" style="margin-top:75px">
		<div class="m_table">
			<div class="w3-row m_caption">
				<div class="w3-col s2  w3-left">
					<h2>매출현황</h2>
				</div>
				<div class="m_caption_right">
				<form id="rfrm" method="post" action="${pageContext.request.contextPath}/mypage/transaction_history">
			  		<div class="w3-col s2 w3-center row1">	
				  		<select class="select" name="year">
				  			<c:forEach begin="0" end="10" var="idx" step="1">
				  				<c:if test="${year eq idx }"><option value="${year - idx}" selected>${year}년</option></c:if>
			           			<c:if test="${year != idx }"><option value="${year - idx}">${year - idx}년</option></c:if>
				          	</c:forEach>
			          	</select>
			  		</div>
			  		<div class="w3-col s3 w3-center row1">	
				  		<select class="select" name="startMonth">
				  			<c:forEach begin="1" end="12" step="1" var="i">
				  			  	<c:if test="${sMonth eq i }">
				  			  		<option  value="<fmt:formatNumber value='${i}' pattern='00'/>"  >
									시작: <fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>
								<c:if test="${sMonth != i }">
									<option  value="<fmt:formatNumber value='${i}' pattern='00'/>"  >
									시작: <fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>	
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col s2 row1">	
				  		<select class="select" name="endMonth">
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
			  		<div class="w3-col s2 row1 searchbtn">
			  			<input type="submit"  value="검색" class="w3-button w3-gray w3-small">
			  		</div>
			  	</form>
			  	</div>
			</div>
			
			<div class="m_head">
				<div class="m_row">
					<div class="m_no">번호</div>
					<div class="m_name">숙박명</div>
					<div class="m_email">체크아웃날짜</div>
					<div class="m_phone">호스트id</div>
					<div class="m_phone">게스트id</div>
					<div class="m_authority">금액</div>
				</div>
			</div>
			<div class="m_body">
			<c:forEach var="member" items="${memberList}">
				<div class="m_row">
					<div class="m_no">${member.no}</div>
					<div class="m_email">${member.email}</div>
					<div class="m_name">${member.name}</div>
					<div class="m_phone">${member.phone}</div>
					<div class="m_authority">${member.authority}</div>
				</div>
			</c:forEach>
			</div>
		</div>
  </div>
</div>
</body>
</html>