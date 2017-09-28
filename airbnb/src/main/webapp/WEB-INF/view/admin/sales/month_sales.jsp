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
				<div>일자</div>
				<div>예약승낙건수</div>
				<div>예약승낙금액</div>
				<div>예약취소건수</div>
				<div>예약취소금액</div>
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
					<div class="text-center">${sale.cancel_cnt}</div>
					<div class="text-right">
						<fmt:formatNumber value="${sale.cancel_amount}" pattern="#,###" />
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
				<div class="text-center">
					<b><fmt:formatNumber value="${total_cancel_cnt}" pattern="#,###" /></b>
				</div>
				<div class="text-right">
					<b><fmt:formatNumber value="${total_cancel_amount}" pattern="#,###" /></b>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
google.charts.load('current', {'packages' :['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var data = new google.visualization.DataTable();
    data.addColumn('string', 'name');
    data.addColumn('number', '예약승낙금액');
    <c:forEach var="sale" items="${mList}">
        var name = '${sale.dt}';
        var empid = '${sale.amount}';
        data.addRows([
            [name,parseInt(empid)]
        ]);
    </c:forEach>

var options = {
	title: '월 매출 현황',
	width: 1000,
	height: 300
};

var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	chart.draw(data, options);
};
</script>
	<div id="chart_div"></div>
</div>
<%@include file="/WEB-INF/view/admin/template/footer.jsp"%>