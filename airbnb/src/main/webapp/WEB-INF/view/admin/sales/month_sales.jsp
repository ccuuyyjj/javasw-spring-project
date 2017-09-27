<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/admin/template/header.jsp"%>
<div class="menu-wrap w3-blue">
	<ul>
		<li><a href="${pageContext.request.contextPath}/admin/sales">일
				매출 현황</a></li>
		<li class="w3-gray"><a
			href="${pageContext.request.contextPath}/admin/sales/month_sales">월
				매출 현황</a></li>
	</ul>
</div>
<div class="w3-container" id="sales" style="margin-top: 75px">
	<div class="m_table">
		<div class="m_caption">
			<div class="m_flex">
				<div class="m_title">
					<h2>월 매출 현황</h2>
				</div>
				<div class="m_searchbox">
					<form id="rfrm" method="post"
						action="${pageContext.request.contextPath}/admin/sales/month_sales">
						<sec:csrfInput />
						<select class="select" name="syear">
							<c:forEach begin="0" end="10" var="idx" step="1">
								<c:if test="${syear eq (year - idx) }">
									<option value="${syear}" selected>${syear}년</option>
								</c:if>
								<c:if test="${syear != (year - idx) }">
									<option value="${year - idx}">${year - idx}년</option>
								</c:if>
							</c:forEach>
						</select> <input type="submit" value="검색"
							class="w3-button w3-gray w3-small">
					</form>
				</div>
			</div>
		</div>

		<div class="m_head">
			<div class="m_row div_row">
				<div>월</div>
				<div>건수</div>
				<div>금액</div>
			</div>
		</div>
		<div class="m_body">
			<c:forEach var="sale" items="${mList}">
				<div class="m_row div_row">
					<div class="text-center">${sale.dt}월</div>
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