<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<div class="center">
	<div class="empty-90"></div>
	<div class="menu2">
		<input type="button" value="방 유형"
			class="b w3-button w3-red w3-round-large">
		<div class="add_type">
				<c:choose>
					<c:when test="${fn:contains(param.type, '전체')}">
						<input type="checkbox" name="type" value="전체" checked>
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="type" value="전체">
					</c:otherwise>
				</c:choose>
				집 전체
				<p>&nbsp;&nbsp;&nbsp;나 혼자 사용할 수 있는 숙소</p>
				<c:choose>
					<c:when test="${fn:contains(param.type, '개인실')}">
						<input type="checkbox" name="type" value="개인실" checked>
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="type" value="개인실">
					</c:otherwise>
				</c:choose>
				개인실
				<p>&nbsp;&nbsp;&nbsp;개인실이 있고 공동 공간은 함께 사용하는 숙소</p>
				<c:choose>
					<c:when test="${fn:contains(param.type, '다인실')}">
						<input type="checkbox" name="type" value="다인실" checked>
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="type" value="다인실">
					</c:otherwise>
				</c:choose>
				다인실
				<p>&nbsp;&nbsp;&nbsp;다인실과 같은 공유 공간을 이용하는 숙소</p>
				<button id="cancel">취소</button>
				<button id="send1">적용</button>
		</div>


		<input type="button" value="가격 범위"
			class="b w3-button w3-red w3-round-large">
		<div class="add_price">
				<img src="${pageContext.request.contextPath}/img/home.png"
					width="300" height="150" class="slider"> <br>
				<p style="color: dimgray;">평균 1박 요금은 ${avg}원 입니다.</p>
				<input data-addui='slider' data-min='10000' data-formatter='usd'
					data-fontsize='12' data-step='5' data-range='true'
					data-timeout='50000' value='${param.price}' data-max='1000000'
					name='price' /> <br>
				<button id="cancel">취소</button>
				<button id="send2">적용</button>
		</div>


		<input type="button" value="필터 추가"
			class="b w3-button w3-red w3-round-large">
		<div class="add_filter">
				침실 수<input class="slider" type="number" name="filter"
					value="0${paramValues.filter[0]}"> <br> <br> 침대 수<input
					class="slider" type="number" name="filter"
					value="0${paramValues.filter[1]}"> <br>
				<button id="cancel">취소</button>
				<button id="send3">적용</button>
		</div>
	</div>

	<div class="page">
		<c:forEach var="room" items="${list}">
			<div class="page_list">
				<a href="${pageContext.request.contextPath}/sub/detail/${room.no}"><img
					src="${room.photoUrl}"> <br>
					<div class="font1">
						\
						<!--  -->${room.price}
						부터 | ${room.name}
					</div> <br> ${room.type} - 침대 ${room.beds}개 </a>
			</div>
		</c:forEach>
	</div>
</div>
<!-- 페이징 처리 -->
<div class="row">
	<!-- 번호 출력 -->

	<!-- 처음  페이지 -->
	<c:if test="${page >= 4 }">
		<a href="${pageContext.request.contextPath }/sub/sub_list?page=${1}">${1}</a>
		<span> &nbsp &nbsp··· &nbsp</span>
	</c:if>

	<c:forEach var="i" begin="${start }" end="${end }" step="1">
		<c:choose>
			<c:when test="${i == page}">
				<a href="${pageContext.request.contextPath}/sub/sub_list?page=${i}"
					class="this">${i}</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/sub/sub_list?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<!-- 끝 페이지 -->
	<c:if test="${page < totalPage - 1 && end < totalPage}">
		<span>&nbsp&nbsp···&nbsp </span>
		<a
			href="${pageContext.request.contextPath }/sub/sub_list?page=${totalPage}">${totalPage}</a>
	</c:if>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>
