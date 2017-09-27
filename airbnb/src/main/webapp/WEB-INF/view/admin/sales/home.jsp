<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/admin/template/header.jsp"%>
<div class="menu-wrap w3-blue">
	<ul>
		<li class="hover"><a
			href="${pageContext.request.contextPath}/admin/sales">일 매출 현황</a></li>
		<li><a
			href="${pageContext.request.contextPath}/admin/sales/month_sales">월
				매출 현황</a></li>
	</ul>
</div>
<div class="w3-container" id="sales" style="margin-top: 75px">
	<div class="m_table">
		<div class="m_caption">
			<div class="m_flex">
				<div class="m_title">
					<h2>일 매출 현황</h2>
				</div>
				<div class="m_searchbox">
					<form id="rfrm" method="post"
						action="${pageContext.request.contextPath}/admin/sales">
						<sec:csrfInput />
						<select class="select" name="syear">
							<c:forEach begin="0" end="10" var="idx" step="1">
								<c:if test="${syear eq (year - idx)}">
									<option value="${syear}" selected>${syear}년</option>
								</c:if>
								<c:if test="${syear != (year - idx) }">
									<option value="${year - idx}">${year - idx}년</option>
								</c:if>
							</c:forEach>
						</select> <select class="select" name="smonth">
							<c:forEach begin="1" end="12" step="1" var="i">
								<c:if test="${smonth eq i }">
									<option value="<fmt:formatNumber value='${i}' pattern='00'/>"
										selected>
									<fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>
								<c:if test="${smonth != i }">
									<option value="<fmt:formatNumber value='${i}' pattern='00'/>">
									<fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>
							</c:forEach>
						</select> <select class="select" name="sday">
							<c:forEach begin="1" end="31" step="1" var="i">
								<c:choose>
									<c:when test="${sday != null}">
										<c:if test="${sday eq i}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>"
												selected><fmt:formatNumber value='${i}' pattern='00'/>일</option>
										</c:if>
										<c:if test="${sday != i}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>"><fmt:formatNumber value='${i}' pattern='00'/>일</option>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:if test="${i eq 1}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>"
												selected><fmt:formatNumber value='${i}' pattern='00'/>일</option>
										</c:if>
										<c:if test="${i != 1}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>"><fmt:formatNumber value='${i}' pattern='00'/>일</option>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp; <select class="select"
							name="eyear">
							<c:forEach begin="0" end="10" var="idx" step="1">
								<c:if test="${eyear eq (year - idx) }">
									<option value="${eyear}" selected>${eyear}년</option>
								</c:if>
								<c:if test="${eyear != (year - idx) }">
									<option value="${year - idx}">${year - idx}년</option>
								</c:if>
							</c:forEach>
						</select> <select class="select" name="emonth">
							<c:forEach begin="1" end="12" step="1" var="i">
								<c:if test="${emonth eq i }">
									<option value="<fmt:formatNumber value='${i}' pattern='00'/>"
										selected>
									<fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>
								<c:if test="${emonth != i }">
									<option value="<fmt:formatNumber value='${i}' pattern='00'/>">
									<fmt:formatNumber value='${i}' pattern='00'/>월</option>
								</c:if>
							</c:forEach>
						</select> <select class="select" name="eday">
							<c:forEach begin="1" end="31" step="1" var="i">
								<c:choose>
									<c:when test="${eday != null}">
										<c:if test="${eday eq i}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>"
												selected><fmt:formatNumber value='${i}' pattern='00'/>일</option>
										</c:if>
										<c:if test="${eday != i}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>"><fmt:formatNumber value='${i}' pattern='00'/>일</option>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:if test="${i eq 31}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>"
												selected><fmt:formatNumber value='${i}' pattern='00'/>일</option>
										</c:if>
										<c:if test="${i != 31}">
											<option value="<fmt:formatNumber value='${i}' pattern='00'/>"><fmt:formatNumber value='${i}' pattern='00'/>일</option>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select> <input type="submit" value="검색"
							class="w3-button w3-gray w3-small">
					</form>
				</div>
			</div>
		</div>
		<div class="m_head">
			<div class="m_row div_row">
				<div>일자</div>
				<div>건수</div>
				<div>금액</div>
			</div>
		</div>
		<div class="m_body">
			<c:forEach var="sale" items="${dList}">
				<div class="m_row div_row">
					<div class="text-center">${sale.dt}</div>
					<div class="text-center">${sale.cnt}</div>
					<div class="text-right">
						<fmt:formatNumber value="${sale.amount}" pattern="#,###" />
					</div>
				</div>
			</c:forEach>
			<div class="m_row div_row">
				<div class="text-center">
					<b>총 합계</b>
				</div>
				<div class="text-center">
					<b><fmt:formatNumber value="${total_cnt}" pattern="#,###" /></b>
				</div>
				<div class="text-right">
					<b><fmt:formatNumber value="${total_amount}" pattern="#,###" /></b>
				</div>
			</div>
		</div>

	</div>
</div>
<%@include file="/WEB-INF/view/admin/template/footer.jsp"%>