<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="${pageContext.request.contextPath}/js/review.js"></script>

<div class="reviewsContainer" id="review">
    <div class="reviews">
    	<h3>후기 ${total }개
    	<c:choose>
    	<c:when test="${avg==1 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${avg==2 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${avg==3 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${avg==4 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${avg==5 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    	</c:choose>
    		
    	</h3>
    	
    </div>

	<div class="detailContainer">
		<c:forEach var="list" items="${review}">
	    <div class="detailReview">
	        <div>${list.email }</div>
	        <div>${list.reg }</div>
	        <br>
	        <div>${list.detail }</div>
	    </div>
		</c:forEach>
	     <form id="write"  action="${pageContext.request.contextPath}/sub/review/${room.no}" method="POST">
	     	<sec:csrfInput/>
               <input id ="star"type="radio" name="rating"  value="1" checked>
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
               
               <input id ="star"type="radio" name="rating" value="2"  >
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15"> 
               
              <input id ="star"type="radio" name="rating" value="3">
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
               <img src="${pageContext.request.contextPath}/img/star.png" width="15" height="15">
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                                                         
               <input id ="star"type="radio" name="rate" value="4" >
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
               <img src="${pageContext.request.contextPath}/img/star.png" width="15" height="15">
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
               
               <input id ="star"type="radio" name="rating" value="5" >
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15"/>
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
               <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
               <br><br>
               <textarea  name="detail" placeholder="후기를 남겨주세요."rows="7" id="detail_board" ></textarea>
               
               <div id="btn">
               <input class="w3-btn w3-round-large w3-green cancel_write " type="button" value="취소">
               <input class="w3-btn w3-round-large w3-green"type="submit" value="작성하기">
               </div>
		</form>
		<br>
<div class="row" style="text-align: left;">
	<!-- 번호 출력 -->

	<!-- 처음  페이지 -->
	<c:if test="${page >= 4 }">
		<a href="${pageContext.request.contextPath }/sub/detail/${room.no}?page=${1}">${1}</a>
		<span> &nbsp; &nbsp;··· &nbsp;</span>
	</c:if>

	<c:forEach var="i" begin="${start }" end="${end }" step="1">
		<c:choose>
			<c:when test="${i == page}">
				<a href="${pageContext.request.contextPath}/sub/detail/${room.no}?page=${i}"
					class="this">${i}</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/sub/detail/${room.no}?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<!-- 끝 페이지 -->
	<c:if test="${page < totalPage - 1 && end < totalPage}">
		<span>&nbsp;&nbsp;···&nbsp; </span>
		<a
			href="${pageContext.request.contextPath }/sub/detail/${room.no}?page=${totalPage}">${totalPage}</a>
	</c:if>
	<sec:authorize access="isAuthenticated()">
		<button class="w3-btn w3-round-large w3-green"id="show_write"  style="float: right">후기 쓰기</button>
	</sec:authorize>
</div>
	 </div>
</div>    