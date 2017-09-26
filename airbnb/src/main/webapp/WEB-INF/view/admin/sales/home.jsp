<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>     
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
	<div class="menu-wrap w3-blue">
	    <ul>
	        <li class="hover">
	            <a href="${pageContext.request.contextPath}/admin/sales">일매출현황</a>
	        </li>
	        <li>
	            <a href="${pageContext.request.contextPath}/admin/sales/month_sales">월매출현황</a>
	        </li>
	    </ul>
	</div>
  	<div class="w3-container" id="member" style="margin-top:75px">
		<div class="m_table">
			<div class="w3-row m_caption">
				<div class="w3-col s2  w3-left">
					<h2>일매출현황</h2>
				</div>
				<div class="m_caption_center">
				<form id="rfrm" method="post" action="${pageContext.request.contextPath}/admin/sales">
			  		<div class="w3-col s1 w3-center row1">	
				  		<select class="select" name="syear">
				  			<c:forEach begin="0" end="10" var="idx" step="1">
				  				<c:if test="${syear eq idx }"><option value="${syear - idx}" selected>${syear}년</option></c:if>
			           			<c:if test="${syear != idx }"><option value="${syear - idx}">${syear - idx}년</option></c:if>
				          	</c:forEach>
			          	</select>
			  		</div>
			  		<div class="w3-col l1 w3-center row1">	
				  		<select class="select" name="smonth">
				  			<c:forEach begin="1" end="12" step="1" var="i">
				  			  	<c:if test="${smonth eq i }">
				  			  		<option  value="<fmt:formatNumber value='${i}' pattern='00'/>"  selected>
									<fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>
								<c:if test="${smonth != i }">
									<option  value="<fmt:formatNumber value='${i}' pattern='00'/>"  >
									<fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>	
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col l1 row1">	
				  		<select class="select" name="sday">
				  			<c:forEach begin="1" end="31" step="1" var="i">
				  				<c:choose>
				  					<c:when test="${sday != null}">
				  						<c:if test="${sday eq i}"><option value="<fmt:formatNumber value='${i}' pattern='00'/>" selected><fmt:formatNumber value='${i}' pattern='00'/>일</option></c:if>
				  						<c:if test="${sday != i}"><option value="<fmt:formatNumber value='${i}' pattern='00'/>"><fmt:formatNumber value='${i}' pattern='00'/>일</option></c:if>
				  					</c:when>
				  					<c:otherwise>
				  						<c:if test="${i eq 1}">
						  					<option value="<fmt:formatNumber value='${i}' pattern='00'/>" selected><fmt:formatNumber value='${i}' pattern='00'/>일</option>
						  				</c:if>
						  				<c:if test="${i != 1}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>" ><fmt:formatNumber value='${i}' pattern='00'/>일</option>
										</c:if>	
				  					</c:otherwise>
				  				</c:choose>
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col s2 w3-center row1">
			  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;	
				  		<select class="select" name="eyear">
				  			<c:forEach begin="0" end="10" var="idx" step="1">
				  				<c:if test="${eyear eq idx }"><option value="${eyear - idx}" selected>${eyear}년</option></c:if>
			           			<c:if test="${eyear != idx }"><option value="${eyear - idx}">${eyear - idx}년</option></c:if>
				          	</c:forEach>
			          	</select>
			  		</div>
			  		<div class="w3-col l1 w3-center row1">	
				  		<select class="select" name="emonth">
				  			<c:forEach begin="1" end="12" step="1" var="i">
				  			  	<c:if test="${emonth eq i }">
				  			  		<option  value="<fmt:formatNumber value='${i}' pattern='00'/>"  selected>
									<fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>
								<c:if test="${emonth != i }">
									<option  value="<fmt:formatNumber value='${i}' pattern='00'/>"  >
									<fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>	
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col l1 row1">	
				  		<select class="select" name="eday">
				  			<c:forEach begin="1" end="31" step="1" var="i">
				  				<c:choose>
				  					<c:when test="${eday != null}">
				  						<c:if test="${eday eq i}"><option value="<fmt:formatNumber value='${i}' pattern='00'/>" selected><fmt:formatNumber value='${i}' pattern='00'/>일</option></c:if>
				  						<c:if test="${eday != i}"><option value="<fmt:formatNumber value='${i}' pattern='00'/>"><fmt:formatNumber value='${i}' pattern='00'/>일</option></c:if>
				  					</c:when>
				  					<c:otherwise>
				  						<c:if test="${i eq 31}">
						  					<option value="<fmt:formatNumber value='${i}' pattern='00'/>" selected><fmt:formatNumber value='${i}' pattern='00'/>일</option>
						  				</c:if>
						  				<c:if test="${i != 31}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>" ><fmt:formatNumber value='${i}' pattern='00'/>일</option>
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
				<div class="m_row div_row">
					<div class="m_no">일자</div>
					<div class="m_no">건수</div>
					<div class="m_no">금액</div>
				</div>
			</div>
			<div class="m_body">
			<c:forEach var="sale" items="${dList}">
				<div class="m_row div_row">
					<div class="m_no">${sale.dt}</div>
					<div class="m_no">${sale.cnt}</div>
					<div class="m_no text-right"><fmt:formatNumber value="${sale.amount}" pattern="#,###" /></div>
				</div>
			</c:forEach>
				<div class="m_row div_row">
					<div class="m_no"><b>총합계</b></div>
					<div class="m_no"><b><fmt:formatNumber value="${total_cnt}" pattern="#,###" /></b></div>
					<div class="m_no text-right"><b><fmt:formatNumber value="${total_amount}" pattern="#,###" /></b></div>
				</div>
			</div>
			
		</div>
  </div>
</div>
</body>
</html>

