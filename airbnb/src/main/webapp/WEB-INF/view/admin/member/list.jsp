<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/admin/template/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/admin_member.js"></script>
<div class="w3-container" id="member" style="margin-top: 75px">
	<div class="m_table">
		<div class="m_caption">
			<div class="m_flex">
				<div class="m_title">
					<h2>회원 목록</h2>
				</div>
				<div class="m_searchbox">
					<form id="m_search" method="post">
						<sec:csrfInput/>
						<input type="text" name="query" placeholder="검색어">
						<sec:csrfInput/>
						<input type="submit" value="검색">
					</form>
				</div>
			</div>
		</div>
		<div class="m_head">
			<div class="m_row">
				<div class="m_no">번호</div>
				<div class="m_email">이메일</div>
				<div class="m_name">이름</div>
				<div class="m_phone">전화번호</div>
				<div class="m_authority">권한</div>
				<div class="m_reg">가입 시간</div>
				<div class="m_pwreset">
					임시 비밀번호<br>발급
				</div>
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
					<div class="m_reg">${member.reg}</div>
					<div class="m_pwreset">
						<a href="#"
							onclick="location.href='${pageContext.request.contextPath}/admin/member/tempPw?no=${member.no}';">실행</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/view/admin/template/footer.jsp"%>