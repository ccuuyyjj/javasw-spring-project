<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/admin/template/header.jsp"%>
<div class="menu-wrap w3-blue">
	<ul>
		<li class="hover"><a
			href="${pageContext.request.contextPath}/admin/reservations">일 예약 현황</a></li>
		<li><a
			href="${pageContext.request.contextPath}/admin/reservations/month_sales">월 예약 현황</a>
		</li>
	</ul>
</div>
<div class="w3-container" id="reservations" style="margin-top: 75px">
	<div class="m_table">
		<div class="m_caption">
			<div class="m_flex">
				<div class="m_title">
					<h2>예약 현황</h2>
				</div>
			</div>
		</div>
		<div class="m_head">
			<div class="m_row"><!-- 0:예약요청, 1:예약확인, 2:예약승낙, 9:예약거부 -->
				<div>일자</div>
				<div>예약 요청</div>
				<div>예약 확인</div>
				<div>예약 승낙</div>
				<div>예약 거부</div>
				<div>총계</div>
			</div>
		</div>
		<div class="m_body">
			<div class="m_row">
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
			</div>
			<div class="m_row">
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
			</div>
			<div class="m_row">
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
			</div>
			<div class="m_row">
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
				<div>dddd</div>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/view/admin/template/footer.jsp"%>