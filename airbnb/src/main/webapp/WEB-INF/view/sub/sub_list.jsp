<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="/WEB-INF/view/template/header.jsp" %>
 <div class="center">
 	<div class="empty-90"></div>
   <div class="menu2">
                     <input type="button" value="방 유형" class="b">
                     <div class="add_type">
                         <input type="checkbox" name="whole">집 전체
                            <p>&nbsp&nbsp&nbsp나 혼자 사용할 수 있는 숙소</p>
                         <input type="checkbox" name="private">개인 실
                          <p>&nbsp&nbsp&nbsp개인실이 있고 공동 공간은 함께 사용하는 숙소</p>
                         <input type="checkbox" name="share">다인 실
                         <p>&nbsp&nbsp&nbsp다인실과 같은 공유 공간을 이용하는 숙소</p>
                         <button id="b">취소</button>
                         <button id="b">적용</button>
                     </div>    
                  <input type="button" value="가격 범위" class="b">
                    <div class="add_price">
                        <img src="/home.png" width="300" height="150">
                        <br>평균 1박 요금은 ₩91,174입니다.
                        
                          <input 
                                data-addui='slider'
                                 data-min='10000'
                                 data-formatter='usd'
                                 data-fontsize='12'
                                 data-step='5'
                                 data-range='true'
                                 data-timeout='50000'
                                 value='10000,1000000'
                                data-max='1000000'
                                 />
                        <br><br>
                         <button id="b">취소</button>
                         <button id="b">적용</button>
                     </div>
                  <input type="button" value="필터 추가" class="b">
                    <div class="add_filter">
                    <h2>css 너무 싫다</h2>
                     침실 수<input type="number" name="n_room">
                    <br><br>
                    침대 수<input type="number" name="n_bed">
                    <br><br>
                    침실 수<input type="number" name="n_bath">
                    <br><br>
                        <button id="b">취소</button>
                         <button id="b">적용</button>
                     </div>
             </div>

            <div class="page">
            <c:forEach var="room" items="${list}">
                <div class="page_list">
                    <a href="${pageContext.request.contextPath}/sub/detail/${room.no}"><img src="${room.photoUrl}" >
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