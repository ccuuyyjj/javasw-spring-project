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
			<form action="sub_list" method="post">
				<sec:csrfInput/>
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
			<button class="cancel w3-btn w3-round-large w3-green">취소</button>
			<button class="send w3-btn w3-round-large w3-green">적용</button>
		</form>
		</div>


		<input type="button" value="가격 범위"
			class="b w3-button w3-red w3-round-large">
		<div class="add_price ">
		<form action="sub_list" method="post">
			<sec:csrfInput/>
			<img src="${pageContext.request.contextPath}/img/house.png"
				width="200" height="130" class="slider" style="margin-left: 80px;">
			<br>
			<p style="color: dimgray;">평균 1박 요금은 ${avg}원 입니다.</p>
			<div id="value">
				<input data-addui='slider' data-min='10000' data-formatter='usd'
					data-fontsize='12' data-step='5' data-range='true'
					data-timeout='50000' value='${param.price}' data-max='1000000'
					name='price'  id="ak"/>
			</div>
			<br>
			<button class=" cancel  w3-btn w3-round-large w3-green">취소</button>
			<button class=" send  w3-btn w3-round-large w3-green">적용</button>
			</form>
		</div>


		<input type="button" value="필터 추가"
			class="b w3-button w3-red w3-round-large">
		<div class="add_filter">
		<form action="sub_list" method="post">
			<sec:csrfInput/>
			<img src="${pageContext.request.contextPath}/img/bed.png" width="150"
				height="130" class="slider" style="margin-left: 100px;">
				<div class="filter">
				침실 수&nbsp; &nbsp;<input class="slider" type="number" name="filter"
					value="0${paramValues.filter[0]}"><br> <br>
				침대 수&nbsp; &nbsp;<input class="slider" type="number" name="filter"
					value="0${paramValues.filter[1]}">
				</div>
			<br>
			<button class="cancel w3-btn w3-round-large w3-green">취소</button>
			<button class="send w3-btn w3-round-large w3-green">적용</button>
			</form>
		</div>
	</div>

	<div class="page">
		<c:forEach var="room" items="${list}" varStatus="status">
			<div class="page_list">
				<a href="${pageContext.request.contextPath}/sub/detail/${room.no}">
				<img	src="${room.photoUrl}">
					<span>\ ${room.price}&nbsp;-&nbsp; ${room.name}</span>
					<br>
					 ${room.type} - 침대 ${room.beds}개
					 <br>

 		<!--  평점 -->
		후기 ${room.count }개
    	<c:choose>
    	<c:when test="${room.rating ==  1 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${room.rating ==2 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${room.rating ==3 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${room.rating ==4 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${room.rating == 5 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    	</c:choose>
    		
					  </a>
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
		<span> &nbsp; &nbsp;··· &nbsp;</span>
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
		<span>&nbsp;&nbsp;···&nbsp; </span>
		<a
			href="${pageContext.request.contextPath }/sub/sub_list?page=${totalPage}">${totalPage}</a>
	</c:if>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>