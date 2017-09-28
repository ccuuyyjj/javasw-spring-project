<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/admin/template/header.jsp"%>
<div class="menu-wrap w3-blue">
	<ul>
		<li><a
			href="${pageContext.request.contextPath}/admin/reservations">일일 예약 현황</a></li>
		<li class="hover"><a
			href="${pageContext.request.contextPath}/admin/reservations/monthly">월별 예약 현황</a>
		</li>
	</ul>
</div>
<div class="w3-container" id="reservations" style="margin-top: 75px">
	<div class="m_table">
		<div class="m_caption">
			<div class="m_flex">
				<div class="m_title">
					<h2>월별 예약 현황</h2>
				</div>
			</div>
		</div>
		<div class="m_head">
			<div class="m_row"><!-- 0:예약요청, 1:예약확인, 2:예약승낙, 3:예약취소, 9:예약거부 -->
				<div>년월</div>
				<div>예약 요청</div>
				<div>예약 확인</div>
				<div>예약 승낙</div>
				<div>예약 취소</div>
				<div>예약 거부</div>
				<div>총계</div>
			</div>
		</div>
		<div class="m_body">
			<c:forEach items="${list}" var="row">
				<div class="m_row text-center">
					<c:forEach var="item" items="${row.split('\\\\|')}">
						<div>${item}</div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/view/admin/template/footer.jsp"%>