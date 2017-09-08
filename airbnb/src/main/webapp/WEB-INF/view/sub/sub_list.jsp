<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="/WEB-INF/view/template/header.jsp" %>
 <div class="center">
             <div class="w3-top">
                 <button>숙소 유형</button>
                 <button>가격 범위</button>
                 <button>즉시 예약</button>
                 <button>필터 추가</button>
             </div>

            <div class="page">
            <c:forEach var="room" items="${list}">
                <div class="page_list">
                    <a href="${pageContext.request.contextPath}/sub/detail/${room.no}"><img src="${room.photoUrl}" ></a>
                   	<br>
                    <div class="font1">\<!--  -->${room.price} 부터 | ${room.name}</div>
                    <br>
                    ${room.type} - 침대 ${room.beds}개
                    </a>
                </div>
            </c:forEach>
            </div>

        </div>
      <!-- 페이징 처리 -->
     <div	class="row">
     	<!-- 번호 출력 -->
     	
     	<!-- 처음  페이지 -->
     	<c:if test="${page >= 4 }">
     		<a href="${pageContext.request.contextPath }/sub/sub_list?pageNo=${1}">${1}</a>
     		<span> &nbsp &nbsp··· &nbsp</span>
     	</c:if>
     	<!-- 이전 페이지 -->
     	<%-- <c:if test="${page == start && start != 1 }">
     		<a href="${pageContext.request.contextPath }/sub/sub_list?pageNo=${start-1}">${start-1}</a>
     	</c:if> --%>
     	<c:forEach var="i" begin="${start }" end="${end }" step="1">
     		<c:choose>
     			<c:when test="${i == page}">
     				<a href="${pageContext.request.contextPath}/sub/sub_list?pageNo=${i}" class="this">${i}</a>
     			</c:when>
     			<c:otherwise>
     				<a href="${pageContext.request.contextPath}/sub/sub_list?pageNo=${i}">${i}</a>
     			</c:otherwise>
     		</c:choose>
     	</c:forEach>
     	<!-- 다음 페이지 -->
		<%-- <c:if test="${page == end && end < totalPage }">
			<a href="${ pageContext.request.contextPath}/sub/sub_list?pageNo=${end+1}">${end+1}</a>
		</c:if> --%>
		<!-- 끝 페이지 -->
		<c:if test="${page < totalPage - 1 && end < totalPage}">
     		<span>&nbsp&nbsp···&nbsp </span>
     		<a href="${pageContext.request.contextPath }/sub/sub_list?pageNo=${totalPage}">${totalPage}</a>
     	</c:if> 
     </div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    