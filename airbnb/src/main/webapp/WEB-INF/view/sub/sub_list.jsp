<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<div class="center">
	<div class="empty-90"></div>
	<div class="menu2">
		<input type="button" value="방 유형" class="b">
		<div class="add_type slider">
			<form class="slider" action="sub_list" method="post">
				<input class="slider" type="checkbox" name="type" value="전체">집
				전체
				<p>&nbsp;&nbsp;&nbsp;나 혼자 사용할 수 있는 숙소</p>
				<input class="slider" type="checkbox" name="type" value="개인실">개인
				실
				<p>&nbsp;&nbsp;&nbsp;개인실이 있고 공동 공간은 함께 사용하는 숙소</p>
				<input class="slider" type="checkbox" name="type" value="다인실">다인
				실
				<p>&nbsp;&nbsp;&nbsp;다인실과 같은 공유 공간을 이용하는 숙소</p>
				<button id="b">취소</button>
				<input type="submit" value="적용">
			</form>
		</div>


		<input type="button" value="가격 범위" class="b">
		<div class="add_price slider">
			<form class="slider" action="sub_list" method="post">
				<!-- <img src="/home.png" width="300" height="150"> --> <br>평균 1박
				요금은 ₩91,174입니다. <input data-addui='slider' data-min='10000'
					data-formatter='usd' data-fontsize='12' data-step='5'
					data-range='true' data-timeout='50000' value='10000,1000000'
					data-max='1000000' name='price' class='slider' />
				<br>
				<button id="b">취소</button>
				<input type="submit" value="적용">
			</form>
		</div>


		<input type="button" value="필터 추가" class="b">
		<div class="add_filter slider">
			<form class="slider" action="sub_list" method="post">
				침실 수<input class="slider" type="number" name="filter"> <br>
				<br> 침대 수<input class="slider" type="number" name="filter">
				<br>
				<button id="b">취소</button>
				<input type="submit" value="적용">
			</form>
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
